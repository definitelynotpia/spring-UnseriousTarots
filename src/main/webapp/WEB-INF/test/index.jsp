<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home | Student Portal</title>
		<link href="style.css"  type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<%
		// check session for current user
		Object currentUser = session.getAttribute("currentUser");
		
		if(currentUser == null){
			// if not logged in, fetch cookies
			Cookie[] cookies = request.getCookies();
			if(cookies!=null){
				for(Cookie cookie:cookies){
					if("myapp.user".equals(cookie.getName())){
						currentUser = cookie.getValue();				
					}
				}
			}
			// show login/register buttons
			if(currentUser == null){
				out.println("<h2></h2>");
				out.println("<button><a href='login.jsp'>Login</a></button><br/>");
				out.println("<button><a href='register.jsp'>Register</a></button>");
			}
		} else {
			out.println("<button><a href='logout.jsp'>Logout</a></button><br/>");
		%>
			<h2>Welcome, <%=currentUser%>!</h2>
			<hr/>
			<%@include file='quiz.jsp' %>		
		<% } %>
	</body>
</html>