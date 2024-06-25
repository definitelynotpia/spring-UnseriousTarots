<%@page import="java.util.Map"%>
<%@ page import="java.util.List" %>
<%@page import="quiz.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
// initialize variables
	boolean userExists = false; // user exists
	String authType = request.getParameter("submit"); // form submission type (login/register)
	String email = request.getParameter("email"); // submitted user credentials
	String password = request.getParameter("password");
	
	// check if user already exists
	for(Map.Entry<String,List<Object>> e:Users.loginCredentials.entrySet()){
		if(email.equals(e.getKey())){
			// if email found in users list, set userExists to true
			userExists = true;
			break;
		}
	}
	
	// if user logging in
	if ("Login".equals(authType)) {
		if(userExists){
			// check if user exists
			for(Map.Entry<String,List<Object>> e:Users.loginCredentials.entrySet()){
				if(email.equals(e.getKey())&&password.equals(e.getValue().get(0))){
					// if user exists, set session and cookies
					session.setAttribute("currentUser", email);
					
					Cookie userCookie = new Cookie("portal.currentUser", email);
					userCookie.setMaxAge(60*60*24*365);
					response.addCookie(userCookie);
					
					Cookie test = new Cookie("portal.test", "testValue");
					userCookie.setMaxAge(60*60*24*365);
					response.addCookie(test);
					
					// redirect to home
					response.sendRedirect("index.jsp");
				}
			}
		} else {
			session.setAttribute("auth_error", "Invalid Username or Password!");
			response.sendRedirect("login.jsp");
		}
	// if user is registering
	} else if ("Register".equals(authType)) {
		if(userExists){
			// if user exists, throw error
			session.setAttribute("auth_error", "Invalid Username or Paasword!");
			response.sendRedirect("register.jsp");
		} else {
			Users registeredUser = new Users(email, password, new int[]{});
			
			// set session and cookies
			session.setAttribute("currentUser", email);
			
			Cookie userCookie = new Cookie("portal.currentUser", email);
			userCookie.setMaxAge(60*60*24*365);
			response.addCookie(userCookie);
			
			Cookie test = new Cookie("portal.test", "testValue");
			userCookie.setMaxAge(60*60*24*365);
			response.addCookie(test);
			
			// redirect to login
			response.sendRedirect("login.jsp");
		}
	}
%>