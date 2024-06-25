<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login | Student Portal</title>
		<link href="style.css"  type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<form action="auth.jsp" method="get">
			<label for="email">Email</label><br/>
			<input type="text" name="email" placeholder="student@school.edu.com"  pattern="[a-z]+.[a-z]+@school.edu.com" required/>
			<span class="hint">Format: <i>firstname.lastname@school.edu.com</i></span><br/>
			<label for="password">Password</label><br/>
			<input type="text" name="password" required/><br/>
			
			<input type="submit" name="submit" value="Login"/>
			<hr/>
			<i>Don't have an account? <a href="register.jsp">Register</a></i>
		</form>
		
		<%		
		Object err = session.getAttribute("auth_error");
		if(err != null){
			out.print(err);
		}
		%>
	</body>
</html>