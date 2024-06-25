package com.example.demo.model;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import java.util.*;

@Component
@SessionScope
public class Questions {
	public String content; // the question
	public String[] choices; // an array of choices
	public String correctAnswer; // correct answer among choices[]

	public static Map<String, List<Object>> questions = new HashMap<>();
	
	// Question constructor method
	public Questions(String content, String[] choices, String correctAnswer) {
		super();
		this.content = content;
		this.choices = choices;
		this.correctAnswer = correctAnswer;

		// store password and exam scores in list
		List<Object> questionInfo = new ArrayList<>();
		questionInfo.add(choices);
		questionInfo.add(correctAnswer);

		// append new user to users map
		questions.put(content, questionInfo);
	}
	
	public String getContent() {
		return content;
	}
	public String[] getChoices() {
		return choices;
	}
	public String getChoiceA() { return choices[0]; }
	public String getChoiceB() { return choices[1]; }
	public String getChoiceC() { return choices[2]; }
	public String getCorrectAnswer() {
		return correctAnswer;
	}
}
