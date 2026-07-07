<!-- Daniel Preller, 7 July 2026, Assignment 5
JSP page for accessing table creation, population, and deletion pages -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel = "stylesheet" href = "tableManagement.css">
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
</body>
</html>