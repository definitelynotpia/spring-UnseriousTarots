<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        @charset "UTF-8";
        * { font-family: Arial, sans-serif; }
        label { font-weight: bold; }
        .error { color: red; }
        .hint {
            font-size: 14px;
            color: dimGray;
        }
        button, input[type=submit] {
        	padding: 5px;
        	margin: 5px;
        }
        a:link {
        	color: black;
        	text-decoration: none;
        }
        input[type=text] {
        	margin-bottom: 15px;
        	width: 200px;
        }
    </style>
</head>
<body>
    <h2>Login</h2>
    <form action="login" method="post">
        <label for="email">Email</label><br/>
        <input type="text" name="email" placeholder="student@school.edu.com"  pattern="[a-z]+.[a-z]+@school.edu.com" required/>
        <span class="hint">Format: <i>firstname.lastname@school.edu.com</i></span><br/>
        <label for="password">Password</label><br/>
        <input type="text" name="password" required/><br/>

        <c:if test="${not empty param.error}">
            <p class="error">${param.error}</p>
        </c:if>

        <input type="submit" name="submit" value="Login"/>
        <hr/>
        <i>No account yet? <button><a href="register">Register</a></button></i>
    </form>
</body>
</html>
