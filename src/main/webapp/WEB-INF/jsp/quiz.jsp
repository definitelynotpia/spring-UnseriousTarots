<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            input[type=radio] {
                margin-left: 20px;
                margin-bottom: 15px;
            }
		</style>
	</head>
	<body>
		<h1>Exam Questions</h1>
		<form action="result.jsp" method="post">
            <ol>
                <li>${ question1.content }</li>
                <input type="radio" name="question1" id="1-0" value="${question1.getChoiceA()}" required/>
                <label for="1-0">${question1.getChoiceA()}</label><br/>
                <input type="radio" name="question1" id="1-1" value="${question1.getChoiceB()}" required/>
                <label for="1-1">${question1.getChoiceB()}</label><br/>
                <input type="radio" name="question1" id="1-2" value="${question1.getChoiceC()}" required/>
                <label for="1-2">${question1.getChoiceC()}</label><br/>

                <li>${ question2.content }</li>
                <input type="radio" name="question2" id="2-0" value="${question2.getChoiceA()}" required/>
                <label for="2-0">${question2.getChoiceA()}</label><br/>
                <input type="radio" name="question2" id="2-1" value="${question2.getChoiceB()}" required/>
                <label for="2-1">${question2.getChoiceB()}</label><br/>
                <input type="radio" name="question2" id="2-2" value="${question2.getChoiceC()}" required/>
                <label for="2-2">${question2.getChoiceC()}</label><br/>

                <li>${ question3.content }</li>
                <input type="radio" name="question3" id="3-0" value="${question3.getChoiceA()}" required/>
                <label for="3-0">${question3.getChoiceA()}</label><br/>
                <input type="radio" name="question3" id="3-1" value="${question3.getChoiceB()}" required/>
                <label for="3-1">${question3.getChoiceB()}</label><br/>
                <input type="radio" name="question3" id="3-2" value="${question3.getChoiceC()}" required/>
                <label for="3-2">${question3.getChoiceC()}</label><br/>

                <li>${ question4.content }</li>
                <input type="radio" name="question4" id="4-0" value="${question4.getChoiceA()}" required/>
                <label for="4-0">${question4.getChoiceA()}</label><br/>
                <input type="radio" name="question4" id="4-1" value="${question4.getChoiceB()}" required/>
                <label for="4-1">${question4.getChoiceB()}</label><br/>
                <input type="radio" name="question4" id="4-2" value="${question4.getChoiceC()}" required/>
                <label for="4-2">${question4.getChoiceC()}</label><br/>

                <li>${ question5.content }</li>
                <input type="radio" name="question5" id="5-0" value="${question5.getChoiceA()}" required/>
                <label for="5-0">${question5.getChoiceA()}</label><br/>
                <input type="radio" name="question5" id="5-1" value="${question5.getChoiceB()}" required/>
                <label for="5-1">${question5.getChoiceB()}</label><br/>
                <input type="radio" name="question5" id="5-2" value="${question5.getChoiceC()}" required/>
                <label for="5-2">${question5.getChoiceC()}</label><br/>
            </ol>
		    <hr/>

	        <button type="submit">Submit</button>
	        <button type="button" onclick="resetRadioButtons()">Reset</button>
	    </form>

		<script>
		    function resetRadioButtons() {
                var radioButtons = document.querySelectorAll('input[type="radio"]');
                radioButtons.forEach(function(radioButton) {
                    radioButton.checked = false;
                });
            }
		</script>
	</body>
</html>