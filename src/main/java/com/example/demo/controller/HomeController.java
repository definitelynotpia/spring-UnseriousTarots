package com.example.demo.controller;

import com.example.demo.model.Questions;
import com.example.demo.model.UserAnswers;
import com.example.demo.model.UserSession;
import com.example.demo.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    private UserSession userSession;

    @GetMapping("/")
    public String home(Model model) {
        // if not logged in, go to login page
        if(userSession.getEmail()==null) return "redirect:/login";
        model.addAttribute("message", "Hello, Spring Boot with JSP!");
        model.addAttribute("userSession", userSession);
        return "home";
    }

    @GetMapping("/login")
    public String showLoginForm() { return "login"; }

    @GetMapping("/register")
    public String showRegisterForm() { return "register"; }

    @GetMapping("/logout")
    public String logout() {
        userSession.setEmail(null); // delete session
        return "redirect:/login";
    }

    @GetMapping("/quiz")
    public String showQuiz(Model model) {
        // initialize list of questions
        List<Questions> questions = new ArrayList<>();
        questions.add(new Questions(1, "Which city is the capital of France?", new String[]{"Berlin", "Paris", "Madrid"}, "Paris"));
        questions.add(new Questions(2,"Which planet is known as the Red Planet?", new String[]{"Mars", "Saturn", "Jupiter"}, "Mars"));
        questions.add(new Questions(3, "Which ocean is the largest on earth?", new String[]{"Pacific Ocean", "Atlantic Ocean", "Indian Ocean"}, "Pacific Ocean"));
        questions.add(new Questions(4, "Which element is NOT present in chemical symbol for water?", new String[]{"Oxygen", "Carbon", "Hydrogen"}, "Carbon"));
        questions.add(new Questions(5, "Who painted the Mona Lisa?", new String[]{"Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci"}, "Leonardo da Vinci"));

        // save only the first 5 questions as exam items
        for (int i = 0; i < questions.size(); i++) {
            Questions question = questions.get(i);
            String questionNo = "question".concat(Integer.toString(i+1));
            // store questions as page context attribute
            model.addAttribute(questionNo, question);
        }

        // initialize user answers
        UserAnswers userAnswers = new UserAnswers();
        model.addAttribute("selected", userAnswers);

        return "quiz";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    @GetMapping("/result")
    public String result(@ModelAttribute("selected") UserAnswers selected, Model model) {
        // store examinee
        String currentUser = userSession.getEmail();
        int totalScore = 0; // count quiz score
        int totalItems = Questions.questionsList.size(); // count total quiz items
        // store user answers in list
        List<String> userAnswers = new ArrayList<>();
        userAnswers.add(selected.getQuestion1());
        userAnswers.add(selected.getQuestion2());
        userAnswers.add(selected.getQuestion3());
        userAnswers.add(selected.getQuestion4());
        userAnswers.add(selected.getQuestion5());

        // compare selected answers to correct answers
        for (int i = 0; i < Questions.questionsList.size(); i++) {
            String selectedAnswer = userAnswers.get(i);
            String correctAnswer = Questions.questionsList.get(i).getCorrectAnswer();
            // if answers match, increment totalScore
            if (selectedAnswer.equals(correctAnswer)) {
                totalScore++;
            }
        }

        // update user score
        for(Map.Entry<String,List<Object>> user:Users.loginCredentials.entrySet()){
            String userKey = user.getKey();
            List<Object> userData = user.getValue();
            // if email and password matches
            if(currentUser.equals(userKey)){
                List<Object> newData = new ArrayList<>();
                newData.add(userData.get(0));
                newData.add(totalScore);
                // update user score
                Users.loginCredentials.put(userKey, newData);
            }
        }

        // pass score values to result.jsp
        model.addAttribute("totalScore", totalScore);
        float percentScore = (totalScore!=0) ? ((totalScore * 100.0f) / totalItems) : 0; // get percent of score
        model.addAttribute("percentScore", percentScore);
        // pass current user to result.jsp
        model.addAttribute("currentUser", currentUser);

        // render result page
        return "result";
    }

    @PostMapping("/login")
    public String login(String email, String password) {
        System.out.println("email: " + email + ", password: " + password);
        // check if account exists
        for(Map.Entry<String,List<Object>> user:Users.loginCredentials.entrySet()){
            // if email and password matches
            if(email.equals(user.getKey())&&password.equals(user.getValue().get(0))){
                userSession.setEmail(email); // if user exists, set user session
                return "redirect:/"; // redirect to home
            }
        }
        // else, if user does not exist
        return "redirect:/login?error=Invalid email or password. Try again.";
    }

    @PostMapping("/register")
    public String register(String email, String password) {
        System.out.println("email: " + email + ", password: " + password);
        // check if account already exists
        for(Map.Entry<String,List<Object>> e:Users.loginCredentials.entrySet()){
            if(email.equals(e.getKey())){
                // if user exists, show error
                return "redirect:/login?error=This email already has an account.";
            }
        }
        // else, login as registered account
        Users newUser = new Users(email, password); // save user login credentials
        userSession.setEmail(email);
        return "redirect:/"; // go to home page
    }

    @PostMapping("/quiz")
    public String quiz() {
        return "redirect:/result";
    }
}
