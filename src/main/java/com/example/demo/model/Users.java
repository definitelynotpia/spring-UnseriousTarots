package com.example.demo.model;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@SessionScope
public class Users {
	public String email; // initialize attributes for login credentials
	public String password;
	public int examScores[]; // save score for each quiz attempt
	
	// initialize user accounts
    public static Map<String, List<Object>> loginCredentials = new HashMap<>();
    
    static {
    	// email (key) and [password, scores] (value)
    	loginCredentials.put("admin@school.edu.com", new ArrayList<>(Arrays.asList("1234", 2)));
    	loginCredentials.put("test.test@school.edu.com", new ArrayList<>(Arrays.asList("qwerty", 0)));
    	loginCredentials.put("pia.alexy@school.edu.com", new ArrayList<>(Arrays.asList("wasd", 3)));
    }

    // User constructor
    public Users(String email, String password, int[] examScores) {
		super();
		this.email = email; // get login credentials
		this.password = password;
		this.examScores = examScores;
		
		// store password and exam scores in list
		List<Object> userData = new ArrayList<>();
		userData.add(password);
		userData.add(examScores);
		
		// append new user to users map
		loginCredentials.put(email, userData);
		System.out.println("registered user: " + email + ", " + password);
	}

}
