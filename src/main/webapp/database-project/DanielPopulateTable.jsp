<!-- Daniel Preller, 7 July 2026, Assignment 5
JSP page for populating a library database table -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Populate Library Database Table</title>
	<link rel = "stylesheet" href = "libraryDatabase.css">
</head>
<body>
	<h1>Populate Library Database Table</h1>
	<jsp:useBean id = "dbbean" class = "coffeeBeans.DBBean" />
	<%
		out.print("<p>" + dbbean.connectToDatabase() + "</p>");
		out.print("<p>" + dbbean.populateTable() + "</p>");
	%>
	<a href = "index.jsp">Return to Home page</a>
</body>
</html>