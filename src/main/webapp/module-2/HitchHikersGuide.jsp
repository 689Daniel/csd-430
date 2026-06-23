<!-- Daniel Preller, 18 June 2026, Assignment 2
JSP page for displaying information about The Hitchhiker's Guide to the Galaxy -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>The Hitchhiker's Guide to the Galaxy Characters</title>
		<link rel = "stylesheet" href = "HitchHikersGuide.css">
		<%
			String[] names = {"Arthur Dent", "Ford Prefect", "Trillian", "Zaphod Beeblebrox", "Marvin", "Slartiblartfast"};
			String[] planets = {"Earth", "Betelgeuse V", "Earth", "Betelgeuse V", "Unknown", "Magrathea"};
			String[] species = {"Human", "Betelgeusian", "Human", "Betelgeusian", "Robot", "Magrathean"};
			int[] heads = {1, 1, 1, 2, 1, 1};
		%>
	</head>
	<body>
		<h1>The Hitchhiker's Guide to the Galaxy</h1>
		<p>This table describes a selection of characters from Douglas Adams' The Hitchhiker's Guide to the Galaxy</p>
		<table>
			<tr>
				<th>Name</th>
				<th>Home Planet</th>
				<th>Species</th>
				<th>Number of Heads</th>
			</tr>
			<% for (int i = 0; i < names.length; i ++) {
				out.print("<tr>\n");
				out.print("<td>" + names[i] + "</td>");
				out.print("<td>" + planets[i] + "</td>");
				out.print("<td>" + species[i] + "</td>");
				out.print("<td>" + heads[i] + "</td>");
				out.print("</tr>");
			} %>
		</table>
	</body>
</html>