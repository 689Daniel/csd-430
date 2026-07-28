<!-- Daniel Preller, 28 July 2026, Assignment 9
JSP page to delete books from the library database, displaying all remaining books -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Delete a Book</title>
	<link rel = "stylesheet" href = "libraryDatabase.css">
</head>
<body>
	<jsp:useBean id = "dbbean" class = "coffeeBeans.DBBean" />
	<h1>Delete a Book</h1>
	<%
		try {// Connects to the database
			dbbean.connectToDatabase();
		} catch(Exception e) {
			out.print("<h2>An error occorrued while accessing the database</h2>");
		} %>	
	<div class = "centeredForm">
		<form method = "POST">
			<label for = "bookID">Select the ID of the book to delete:</label>
			<select id = "bookID" name = "bookID">
				<%
					try {// Populates a dropdown with all valid IDs
						ResultSet bookIDs = dbbean.getTableIDs();
						while (bookIDs.next()) {
							%> <option id = '<%= bookIDs.getInt(1) %>'><%= bookIDs.getInt(1) %></option><%
						}
					} catch(Exception e) {}// If the table is empty, no IDs will be shown
				%>
			</select>
			<input type = "submit" value = "Delete Book">
		</form>
	</div>
	<%
		if (request.getMethod().equals("POST")) {// If the form has been submitted, delets the selected book
			try {
				// Deletes book and displays results
				String deletionResult = dbbean.deleteBook(Integer.parseInt(request.getParameter("bookID")));
				%><h2><%= deletionResult %></h2>
				<script>
					// Removes the previously selected ID from the dropdown manually because dropdown is created before POST request
					document.getElementById(<%= request.getParameter("bookID") %>).remove();
				</script>
				<%
			} catch(NumberFormatException e) {// Prints error messages
				out.print("<h2>Invalid ID entered<br>Please enter an integer</h2>");
			} catch(Exception e) {
				out.print("<h2>An unknown error occurred</h2>");
			}
		}
	%>
	
	<%
		try {// Displays the full book table, updated after deletion
			ResultSet allBooks = dbbean.getAllBooks();
			%>
			<table class = "bookDisplay">
				<thead>
					<tr>
						<th colspan = "5">All Books</th>
					</tr>
					<tr>
						<th>Book ID</th>
						<th>Title</th>
						<th>Author</th>
						<th>Series</th>
						<th>Release Year</th>
					</tr>
				</thead>
				<tbody>
					<% while (allBooks.next()) {// Populates a table with all books
						%>
						<tr>
							<td><%= allBooks.getInt("BookID") %></td>
							<td><%= allBooks.getString("Title") %></td>
							<td><%= allBooks.getString("Author") %></td>
							<td><%= allBooks.getString("Series") %></td>
							<td><% // Prints the release year, or null if there is none
								int year = allBooks.getInt("ReleaseYear");
								if (allBooks.wasNull()) {
									out.print("null");
								} else {
									out.print(year);
								} %></td>
						<%
					} %>
				</tbody>
			</table> <%
		} catch(Exception e) {
			out.print("<h2>An unknown error occurred</h2>");
		}
	%>
	<a href = "index.jsp">Return to Home page</a>
</body>
</html>