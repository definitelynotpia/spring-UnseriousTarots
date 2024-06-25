package com.example.demo.model;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@Component
@SessionScope
public class Questions {
	public String content; // the question
	public String[] choices; // an array of choices
	public String correctAnswer; // correct answer among choices[]
	
	// Question constructor method
	public Questions(String content, String[] choices, String correctAnswer) {
		super();
		this.content = content;
		this.choices = choices;
		this.correctAnswer = correctAnswer;
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
