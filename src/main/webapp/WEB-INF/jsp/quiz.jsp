<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Exam | Student Portal</title>
		<style>
            @charset "UTF-8";
            * { font-family: Arial, sans-serif; }
            li { margin: 20px 0px; }
            button, input[type=submit] {
                padding: 5px;
                margin: 5px;
            }
            a:link {
                color: black;
                text-decoration: none;
            }
            form:radiobutton {
                margin-left: 20px;
                margin-bottom: 15px;
            }
		</style>
	</head>
	<body>
		<h1>Exam Questions</h1>
		<form:form action="submit" method="post" modelAttribute="selectedAnswers">
            <ol>
                <li><form:label path="question1">${question1.content}</form:label></li>
                <form:radiobutton path="question1" value="${question1.getChoiceA()}" label="${question1.getChoiceA()}"/><br/>
                <form:radiobutton path="question1" value="${question1.getChoiceB()}" label="${question1.getChoiceB()}"/><br/>
                <form:radiobutton path="question1" value="${question1.getChoiceC()}" label="${question1.getChoiceC()}"/><br/>

                <li><form:label path="question2">${question2.content}</form:label></li>
                <form:radiobutton path="question2" value="${question2.getChoiceA()}" label="${question2.getChoiceA()}"/><br/>
                <form:radiobutton path="question2" value="${question2.getChoiceB()}" label="${question2.getChoiceB()}"/><br/>
                <form:radiobutton path="question2" value="${question2.getChoiceC()}" label="${question2.getChoiceC()}"/><br/>

                <li><form:label path="question3">${question3.content}</form:label></li>
                <form:radiobutton path="question3" value="${question3.getChoiceA()}" label="${question3.getChoiceA()}"/><br/>
                <form:radiobutton path="question3" value="${question3.getChoiceB()}" label="${question3.getChoiceB()}"/><br/>
                <form:radiobutton path="question3" value="${question3.getChoiceC()}" label="${question3.getChoiceC()}"/><br/>

                <li><form:label path="question4">${question4.content}</form:label></li>
                <form:radiobutton path="question4" value="${question4.getChoiceA()}" label="${question4.getChoiceA()}"/><br/>
                <form:radiobutton path="question4" value="${question4.getChoiceB()}" label="${question4.getChoiceB()}"/><br/>
                <form:radiobutton path="question4" value="${question4.getChoiceC()}" label="${question4.getChoiceC()}"/><br/>

                <li><form:label path="question5">${question5.content}</form:label></li>
                <form:radiobutton path="question5" value="${question5.getChoiceA()}" label="${question5.getChoiceA()}"/><br/>
                <form:radiobutton path="question5" value="${question5.getChoiceB()}" label="${question5.getChoiceB()}"/><br/>
                <form:radiobutton path="question5" value="${question5.getChoiceC()}" label="${question5.getChoiceC()}"/><br/>
            </ol>
		    <hr/>

	        <form:button>Submit</form:button>
	        <button type="button" onclick="resetRadioButtons()">Reset</button>
	    </form:form>

		<script>
		    function resetRadioButtons() {
                var radioButtons = document.querySelectorAll("form:radiobutton");
                radioButtons.forEach(function(radioButton) {
                    radioButton.checked = false;
                });
            }
		</script>
	</body>
</html>