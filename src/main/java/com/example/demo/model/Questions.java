package com.example.demo.model;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import java.util.*;

@Component
@SessionScope
public class Questions {
	public int key;
	public String content; // the question
	public String[] choices; // an array of choices
	public String correctAnswer; // correct answer among choices[]

	public static List<Questions> questionsList = new ArrayList<>();
	
	// Question constructor method
	public Questions(int key, String content, String[] choices, String correctAnswer) {
		super();
		this.key = key;
		this.content = content;
		this.choices = choices;
		this.correctAnswer = correctAnswer;
		questionsList.add(this);
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
