<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Exam Results | Student Portal</title>
		<script src="script.js"></script>
		<link href="style.css"  type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<%
		boolean isShown = false; // toggle display all attempts
		Object currentUser = session.getAttribute("currentUser");
		Integer totalScore = 0; // track score of examinee
				
		// fetch exam items
		@SuppressWarnings("unchecked") // ignore unchecked cast warning
		List<Questions> questions = (List<Questions>) session.getAttribute("questions");
		int totalItems = 5; // get number of exam items
		// fetch exam answers
		List<String> selectedAnswers = new ArrayList<>();		
		
		// check each submitted answer to exam answer keys
		for (int i = 0; i < totalItems; i++) {
		    String selectedAnswer = request.getParameter("question" + i);
		    selectedAnswers.add(selectedAnswer);
		    // if choice is correct, add 1 point to score
		    if (selectedAnswer.equals(questions.get(i).getCorrectAnswer())) {
		        totalScore++;
		    }
		}
		double percentage = (double) totalScore / totalItems * 100;
		
		for(Map.Entry<String,List<Object>> e:Users.loginCredentials.entrySet()){
			if(currentUser.equals(e.getKey())){
				e.getValue().set(1, totalScore);
			}
		}
		%>
		<h1>Exam Results</h1>
	    <p><b>Score:</b> <%= totalScore%>/<%= totalItems%></p>
	    <p><b>Percentage:</b> <%= String.format("%.2f", percentage) %>%</p>
	    <% out.println("<button><a href='index.jsp'>Retry</a></button>"); %>
	    
	    <div id="attempts">
	    	<hr/>
	    	<h3>All Scores</h3>
	    	<table>
			<tr>
				<th>Name</th>
				<th>Score</th>
			</tr>
			<% for(Map.Entry<String,List<Object>> e:Users.loginCredentials.entrySet()){ %>
				<tr>
					<td> <%
					if(currentUser.equals(e.getKey())) {
						out.println("<b><i>" + e.getKey() + "</i></b>");
					} else {
						out.println(e.getKey());
					}
					%> </td>
					<td> <%
					out.println(e.getValue().get(1));
					/* Object scores = e.getValue().get(1);
					for(int i = 0; i < scores.length(); i++) {
						out.print(e.getValue().get(1));
					} */
					%></td>
				</tr>
			<% } %>
		</table>
	    </div>
	    
	    <hr/>
	    <h3>Answer key</h3>
	    <%
	 	// display the first 5 questions
		for (int i = 0; i < 5; i++) {
		    Questions question = questions.get(i);
		    out.println("<p>" + (i + 1) + ". " + question.getContent() + "</p>");
		    out.println("<b>Your answer: </b>" + selectedAnswers.get(i) + "<br/>");
		    out.println("<b>Correct answer: </b>" + question.getCorrectAnswer());
		}
        %>
	</body>
</html>