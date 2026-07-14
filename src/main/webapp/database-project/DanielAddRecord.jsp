<!-- Daniel Preller, 14 July 2026, Assignment 7
JSP page to add a book to the library table and display the updated table -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
	<link rel = "stylesheet" href = "libraryDatabase.css">
	<meta charset="UTF-8">
	<title>Add a Book</title>
</head>
<body>
	<jsp:useBean id = "dbbean" class = "coffeeBeans.DBBean" />
	<h1>Add a New Book</h1>
	<div class = "centeredForm">
		<form method = "POST">
			<label for = "title">Title:</label>
			<input type = "text" id = "title" name = "title" required autofocus>
			<label for = "author">Author:</label>
			<input type = "text" id = "author" name = "author">
			<label for = "series">Series:</label>
			<input type = "text" id = "series" name = "series">
			<label for = "releaseYear">Release Year:</label>
			<input type = "text" id = "releaseYear" name = "releaseYear">
			<input type = "Submit" value = "Add Book">
		</form>
	</div>
	<% if (request.getMethod().equals("POST")) {// Executes once form has been submitted
		try {
			dbbean.connectToDatabase();
			
			//Adds the book to the table
			dbbean.addBook(request.getParameter("title"), request.getParameter("author"), request.getParameter("series"), request.getParameter("releaseYear"));
		
			//Gets all the books after adding the new one
			ResultSet results = dbbean.getAllBooks();
			%>
			<table class = "bookDisplay">
				<thead>
					<tr>
						<th colspan = "5">Updated Books Database</th>
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
					<% while (results.next()) {// Populates a table with all books
						%>
						<tr>
							<td><%= results.getInt("BookID") %></td>
							<td><%= results.getString("Title") %></td>
							<td><%= results.getString("Author") %></td>
							<td><%= results.getString("Series") %></td>
							<td><% // Prints the release year, or null if there is none
								int year = results.getInt("ReleaseYear");
								if (results.wasNull()) {
									out.print("null");
								} else {
									out.print(year);
								} %></td>
						<%
					} %>
				</tbody>
			</table>
			<%
		} catch(SQLException e) {
			out.print("<h2>An error occurred while accessing the database</h2>");
		} catch(NumberFormatException e) {
			out.print("<h2>Invalid Year Entered</h2>");
		} catch (Exception e) {// Can occur if the database is not available
			out.print("<h2>An error occurred while accessing the database</h2>");
		}
	} %>
	<a href = "index.jsp">Return to Home page</a>
</body>
</html>