<!-- Daniel Preller, 8 July 2026, Assignment 6
JSP page allowing user to see a record held in the library table from a dropdown of IDs -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
	<link rel = "stylesheet" href = "libraryDatabase.css">
	<meta charset="UTF-8">
	<title>View Book Information</title>
	<%! ResultSet bookIDs; %>
	<% ResultSet book; %>
</head>
<body>
	<jsp:useBean id = "dbbean" class = "coffeeBeans.DBBean" />
	<h1>View Book Information</h1>
	<div class = flexContainer>
		<form method = "POST">
			<label for = "bookID">Select a book ID to view information about the book:</label>
			<select id = "bookID" name = "bookID">
				<%
					dbbean.connectToDatabase();
					// Creates a dropdown of all available book IDs
					try {
						bookIDs = dbbean.getTableIDs();
						while (bookIDs.next()) {
							out.print("<option id = '" + bookIDs.getInt(1) + "'>" + bookIDs.getInt(1) + "</option>");
						}
					} catch (SQLException e) {}
				%>
			</select>
			<input type = "submit" value = "Find Book">
		</form>
	</div>
	<table class = "bookDisplay">
		<tr>
			<th>Book ID</th>
			<th>Title</th>
			<th>Author</th>
			<th>Series</th>
			<th>Release Year</th>
		</tr>
		<tr>
			<% 
				// If the form has been submitted, displays the book information
				if (request.getMethod().equals("POST")) {
					try {
						// Gets the book from the database
						int queryID = Integer.parseInt(request.getParameter("bookID"));
						book = dbbean.getBookByID(queryID);
						// Displays the information
						book.next();
						out.print("<td>" + book.getInt("BookID") + "</td>");
						out.print("<td>" + book.getString("Title") + "</td>");
						out.print("<td>" + book.getString("Author") + "</td>");
						out.print("<td>" + book.getString("Series") + "</td>");
						out.print("<td>" + book.getInt("ReleaseYear") + "</td>");
					} catch(Exception e) {// Prints an error if an invalid ID is entered
						out.print("<td colspan = '5'>Invalid ID</td>");
					}
				}
			%>
		</tr>
	</table>
	<a href = "index.jsp">Return to Home page</a>
</body>
</html>