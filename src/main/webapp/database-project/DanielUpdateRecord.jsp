<!-- Daniel Preller, 21 July 2026, Assignment 8
JSP page to add a book to the library database and display the results -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<link rel = "stylesheet" href = "libraryDatabase.css">
	<meta charset="UTF-8">
<title>Update Book Information</title>
</head>
<body>
	<jsp:useBean id = "dbbean" class = "coffeeBeans.DBBean" />
	<h1>Update Book Information</h1>
	<% try {dbbean.connectToDatabase();} catch(Exception e) {out.print("<h2>An error occurred while accessing the database</h2>");} %>
	<div class = "flexContainer">
		<form method = "POST">
			<label for = "bookID">Select a book ID to update the book:</label>
			<select id = "bookID" name = "bookID">
				<%
					try {// Displays a dropdown of all book IDs
						ResultSet bookIDs = dbbean.getTableIDs();
						while (bookIDs.next()) {
							%> <option id = '<%= bookIDs.getInt(1) %>'><%= bookIDs.getInt(1) %></option><%
						}
					} catch (Exception e) {}// If an SQL error occurs, the list will be empty
				%>
			</select>
			<input type = "hidden" name = "bookUpdated" value = "False"><!-- Used to determine whether to display the updated results table -->
			<input type = "submit" value = "Find Book">
		</form>
	</div>
	<%
		if (request.getMethod().equals("POST")) {
			try {// Displays information about the selected book in a form
				ResultSet originalBook = dbbean.getBookByID(Integer.parseInt(request.getParameter("bookID")));
				originalBook.next();
				%><h2>Update Book Information Here</h2>
				<div class = "centeredForm">
					<form method = "POST">
						<label for = "originalBookID"></label>
						<input type = "text" id = "originalBookID" name = "originalBookID" value = '<%= originalBook.getInt("BookID") %>' readonly>
						<label for = "title">Title:</label>
						<input type = "text" id = "title" name = "title" required value = '<%= originalBook.getString("Title") %>'>
						<label for = "author">Author:</label>
						<input type = "text" id = "author" name = "author" value = '<%= originalBook.getString("Author") %>'>
						<label for = "series">Series:</label>
						<input type = "text" id = "series" name = "series" value = '<%= originalBook.getString("Series") %>'>
						<label for = "releaseYear">Release Year:</label>
						<input type = "text" id = "releaseYear" name = "releaseYear" value = '<%= originalBook.getInt("ReleaseYear") %>'>
						<input type = "hidden" name ="bookUpdated" value = "True">
						<input type = "hidden" name = "bookID" value = '<%= originalBook.getInt("BookID") %>'><!-- Keeps form populated when submitting the second form -->
						<input type = "Submit" value = "Update Book">
					</form>
				</div>
				<%
			} catch (Exception e) {out.print("<h2>An Error Occurred</h2>");}
		}
		if (request.getMethod().equals("POST") && request.getParameter("bookUpdated").equals("True")) {
			try {// Updates the book based on user input and displays the results
				// Saves all user input as variables for convenience, and casts when necessary
				String updatedTitle = request.getParameter("title");
				String updatedAuthor = request.getParameter("author");
				String updatedSeries = request.getParameter("series");
				int updatedYear = Integer.parseInt(request.getParameter("releaseYear"));
				
				// Updates the book in the database
				dbbean.updateBook(Integer.parseInt(request.getParameter("bookID")), updatedTitle, updatedAuthor, updatedSeries, updatedYear);
				
				// Displays the results
				ResultSet updatedBook = dbbean.getBookByID(Integer.parseInt(request.getParameter("bookID")));
				updatedBook.next();
				%>
				<h2>Updated Book</h2>
				<table class = bookDisplay>
					<tr>
						<th>Book ID</th>
						<th>Title</th>
						<th>Author</th>
						<th>Series</th>
						<th>Release Year</th>
					</tr>
					<tr>
						<td><%= updatedBook.getInt("BookID") %></td>
						<td><%= updatedBook.getString("Title") %></td>
						<td><%= updatedBook.getString("Author") %></td>
						<td><%= updatedBook.getString("Series") %></td>
						<td><%= updatedBook.getInt("ReleaseYear") %></td>
					</tr>
				</table>
				<%
			} catch(NumberFormatException e) {// Prints an error if an invalid year is entered (book ID is already confirmed valid, so the error cannot be from that)
				out.print("<h2>Invalid Year Entered. Please enter the release year as a digit</h2>");
			}
			catch (Exception e) {out.print("<h2>An error occurred</h2>");}
		}
	%>
	<a href = "index.jsp">Return to Home page</a>
</body>
</html>