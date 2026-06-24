<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Review - Harry's Hypothetical Hamburgers</title>
	<%!
		String escapeHtml(String string) {// Escapes HTML characters to prevent cross-site scripting
			return string.replace("&", "&amp").replace("<", "&lt").replace(">", "&gt").replace("'", "&#039").replace("\"", "&quot");
		}
	%>
	<link rel = "stylesheet" href = "ReviewResults.css">
</head>
<body>
	<h1>Harry's Hypothetical Hamburgers</h1>
	<h2>Your Review</h2>
	<div class = "centerDiv">
		<% 
			if (request.getMethod().equals("POST")) {// Shows the page only if submitted through the form
				int rating;
				try {// Ensures that rating is a valid integer and that menu item has been entered
					rating = Integer.parseInt(request.getParameter("rating"));
					if (rating > 5 || rating < 1) {
						throw new Exception("Rating out of range");
					}
					if (request.getParameter("item").isEmpty()) {
						throw new Exception("No item entered");
					}
				} catch (Exception e) {// Displays an error message if input is not valid
					out.print("<div class = 'error'>An error occurred in your submission. Please go back and try again.</div>");				
				}
		%>
		
		<table>
			<tr>
				<td>Your Name:</td>
				<td> <% if (request.getParameter("name").trim().isEmpty()) {// Prints the customer's name, or anonymous if none is entered
				out.print("Anonymous");
			} else {
				out.print(escapeHtml(request.getParameter("name")));
			} %></td>
			</tr>
			
			<% if (!(request.getParameter("email").isEmpty())) {// Prints the customer's email address if it is entered
				out.print("<tr><td>Your Email Address:</td><td>" + escapeHtml(request.getParameter("email")));
				out.print("</td></tr><br>");
			} %>
			
			<tr>
				<td>Item Ordered:</td>
				<td> <% out.print(escapeHtml(request.getParameter("item"))); %></td>
			</tr>
			
			<tr>
				<td>Your Rating:</td>
				<td><%= request.getParameter("rating") /* HTML characters are not escaped rating is already known to be an integer from validation*/ %></td>
			</tr>
			
			<tr>
				<td colspan = "2">Your Comments:</td>
			</tr>
			
			<tr>
				<td colspan = "2">
					<textarea readonly><% if (request.getParameter("comments").trim().isEmpty()) {// Prints the customer's comments, or "None" if none are entered
						out.print("None");
					} else {
						out.print(escapeHtml(request.getParameter("comments")));
					}%>
					</textarea>
				</td>
			</tr>
		</table>
	</div>
				
				<% } else {/* Displays an error message if the page has been opened without submitting from the form*/ %>
				<div class = "error">
				You have not submitted a review.<br>
				Please go to the <a href = "RestaurantReview.jsp">review page</a> to give a review.
				</div>
			<% }
		%>
</body>
</html>