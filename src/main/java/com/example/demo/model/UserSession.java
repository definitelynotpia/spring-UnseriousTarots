package com.example.demo.model;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@Component
@SessionScope
public class UserSession {
    private String email;

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
