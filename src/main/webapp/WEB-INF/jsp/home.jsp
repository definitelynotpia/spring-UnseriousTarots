<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        @charset "UTF-8";
        * { font-family: Arial, sans-serif; }
        label { font-weight: bold; }
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
            width: 200px
        }
    </style>
</head>
<body>
    <h1>${message}</h1>
    <c:if test="${not empty userSession.email}">
        <h3>
            Welcome, ${userSession.email}!
            <button><a href="logout">Logout</a></button><br/>
        </h3>
        <hr/>
        <button><a href="quiz">Start Quiz</a></button><br/>
    </c:if>
</body>
</html>
