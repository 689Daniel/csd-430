<!-- Daniel Preller, 14 July 2026, Assignment 7
JSP page for accessing all pages in the database assignment -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel = "stylesheet" href = "libraryDatabase.css">
	<meta charset="UTF-8">
	<title>Library Database Home</title>
</head>
<body>
	<h1>Library Database Home</h1>
	<h2>Module 1</h2>
	<div class = "flexContainer">
		<a href = "DanielCreateTable.jsp">Create Table</a>
		<a href = "DanielPopulateTable.jsp">Populate Table</a>
		<a href = "DanielDropTable.jsp">Drop Table</a>
	</div>
	<h2>Module 2</h2>
	<div class = "flexContainer">
		<a href = "DanielReadRecord.jsp">View Books</a>
	</div>
	<h2>Module 3</h2>
	<div class = "flexContainer">
		<a href = "DanielAddRecord.jsp">Add Books</a>
	</div>
</body>
</html>