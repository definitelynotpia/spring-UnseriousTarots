<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.model.Users" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Exam Results | Student Portal</title>
		<style>
		    @charset "UTF-8";
            * { font-family: Arial, sans-serif; }
            button, input[type=submit] {
                padding: 5px;
                margin: 5px;
            }
            a:link {
                color: black;
                text-decoration: none;
            }
            td, th { margin: 10px; }
            table, td, th {
                text-align: center;
                border: 1px solid;
            }
		</style>
	</head>
	<body>
	    <% Object currentUser = request.getAttribute("currentUser"); %>
		<h1>Exam Results</h1>
	    <p><b>Score:</b> ${totalScore}/5</p>
	    <p><b>Percentage:</b> ${percentScore}%</p>
	    <button><a href='index.jsp'>Retry</a></button>

	    <div id="attempts">
	    	<hr/>
	    	<h3>All Scores</h3>
            <table>
                <tr>
                    <th>Email</th>
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
	</body>
</html>