<!-- Daniel Preller, 7 July 2026, Assignment 5
JSP page for dropping a library database table -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel = "stylesheet" href = "tableManagement.css">
	<meta charset="UTF-8">
	<title>Drop Library Database Table</title>
</head>
<body>
	<h1>Drop Library Database Table</h1>
	<jsp:useBean id = "dbbean" class = "coffeeBeans.DBBean" />
	<%
		out.print("<p>" + dbbean.connectToDatabase() + "</p>");
		out.print("<p>" + dbbean.dropTable() + "</p>");
	%>
	<a href = "index.jsp">Return to Home page</a>
</body>
</html>