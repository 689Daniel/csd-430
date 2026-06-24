<!-- Daniel Preller, 23 June 2026, Assignment 3
JSP page for leaving a restaurant review -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLConnection" %>
<%@ page import = "java.net.URL" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Leave a Review - Harry's Hypothetical Hamburgers</title>
	<link href = "ReviewPage.css" rel = "stylesheet">
	<%!
		final int MAX_STARS = 5;
		String[] menuItems = {"Hamburger", "Cheeseburger", "Bacon Hamburger", "Bacon Cheeseburger", "Harry's Hypothetical Deluxe"};
	%>
</head>
	<body>
		<h1>Harry's Hypothetical Hamburgers</h1>
		<h2>Please leave a review</h2>
		<div class = "centerDiv">
			<form method = "POST" action = "FormResults.jsp">
				<label for = "name">Name (Leave blank for anonymous)</label>
				<br>
				<input type = "text" name = "name" id = "name">
				<br>
				<label for = "email">Email Address (Optional)</label>
				<br>
				<input type = "email" name = "email" id = "email">
				<br>
				<label for = "item">Item Ordered</label>
				<br>
				<select name = "item" id = "item" required>
					<option value = "">--select an item--</option>
					<% // Creates a dropdown of menu items
						for (String item : menuItems) {
							out.print("<option value = \"" + item + "\">" + item + "</option>");
						}
					%>
				</select>
				<br>
				<label for = "rating">Rating</label>
				<br>
				<select name = "rating" id = "rating" required>
					<% // Creates dropdown of rating  options
						for (int i = MAX_STARS; i > 0; i--) {
							out.print("<option value =" + i + ">" + i + "</option>");
						}
					%>
				</select>
				<br>
				<label for = "comments">Additional Comments (Optional)</label>
				<br>
				<textarea name = "comments" id = "comments"></textarea>
				<br>
				<input type = "submit">
			</form>
		</div>
	</body>
</html>