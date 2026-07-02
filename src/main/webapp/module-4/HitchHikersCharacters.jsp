<!-- Daniel Preller, 2 July 2026, Assignment 4
JSP page to display information about characters from Douglas Adams' The Hitchhiker's Guide to the Galaxy
using JavaBeans -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>The Hitchhiker's Guide to the Galaxy Characters</title>
	<link href = "HitchHikersCharacters.css" rel = "stylesheet">
	<jsp:useBean id = "arthur" class = "coffeeBeans.HitchHikersCharacter" />
	<jsp:setProperty name = "arthur" property = "name" value = "Arthur Dent" />
	<jsp:setProperty name = "arthur" property = "homePlanet" value = "Earth" />
	<jsp:setProperty name = "arthur" property = "species" value = "Human" />
	<jsp:setProperty name = "arthur" property = "heads" value = "1" />
	<jsp:useBean id = "ford" class = "coffeeBeans.HitchHikersCharacter" />
	<jsp:setProperty name = "ford" property = "name" value = "Ford Prefect" />
	<jsp:setProperty name = "ford" property = "homePlanet" value = "Betelgeuse V" />
	<jsp:setProperty name = "ford" property = "species" value = "Betelgeusian" />
	<jsp:setProperty name = "ford" property = "heads" value = "1" />
	<jsp:useBean id = "trillian" class = "coffeeBeans.HitchHikersCharacter" />
	<jsp:setProperty name = "trillian" property = "name" value = "Trillian" />
	<jsp:setProperty name = "trillian" property = "homePlanet" value = "Earth" />
	<jsp:setProperty name = "trillian" property = "species" value = "Human" />
	<jsp:setProperty name = "trillian" property = "heads" value = "1" />
	<jsp:useBean id = "zaphod" class = "coffeeBeans.HitchHikersCharacter" />
	<jsp:setProperty name = "zaphod" property = "name" value = "Zaphod Beeblebrox" />
	<jsp:setProperty name = "zaphod" property = "homePlanet" value = "Betelgeuse V" />
	<jsp:setProperty name = "zaphod" property = "species" value = "Betelgeusian" />
	<jsp:setProperty name = "zaphod" property = "heads" value = "2" />
	<jsp:useBean id = "marvin" class = "coffeeBeans.HitchHikersCharacter" />
	<jsp:setProperty name = "marvin" property = "name" value = "Marvin" />
	<jsp:setProperty name = "marvin" property = "homePlanet" value = "Unknown" />
	<jsp:setProperty name = "marvin" property = "species" value = "Robot" />
	<jsp:setProperty name = "marvin" property = "heads" value = "1" />
	<jsp:useBean id = "slartiblartfast" class = "coffeeBeans.HitchHikersCharacter" />
	<jsp:setProperty name = "slartiblartfast" property = "name" value = "Slartiblartfast" />
	<jsp:setProperty name = "slartiblartfast" property = "homePlanet" value = "Magrathean" />
	<jsp:setProperty name = "slartiblartfast" property = "species" value = "Magrathea" />
	<jsp:setProperty name = "slartiblartfast" property = "heads" value = "1" />
</head>
<body>
	<h1>The Hitchhiker's Guide to the Galaxy Characters</h1>
	<h2>This table displays basic information about several characters from The Hitchhiker's Guide to the Galaxy</h2>
	<table>
		<tr>
			<th>Name</th>
			<th>Home Planet</th>
			<th>Species</th>
			<th>Number of Heads</th>
		</tr>
		<tr>
			<td><jsp:getProperty property = "name" name = "arthur" /></td>
			<td><jsp:getProperty property = "homePlanet" name = "arthur" /></td>
			<td><jsp:getProperty property = "species" name = "arthur" /></td>
			<td><jsp:getProperty property = "heads" name = "arthur" /></td>
		</tr>
		<tr>
			<td><jsp:getProperty property = "name" name = "ford" /></td>
			<td><jsp:getProperty property = "homePlanet" name = "ford" /></td>
			<td><jsp:getProperty property = "species" name = "ford" /></td>
			<td><jsp:getProperty property = "heads" name = "ford" /></td>
		</tr>
		<tr>
			<td><jsp:getProperty property = "name" name = "trillian" /></td>
			<td><jsp:getProperty property = "homePlanet" name = "trillian" /></td>
			<td><jsp:getProperty property = "species" name = "trillian" /></td>
			<td><jsp:getProperty property = "heads" name = "trillian" /></td>
		</tr>
		<tr>
			<td><jsp:getProperty property = "name" name = "zaphod" /></td>
			<td><jsp:getProperty property = "homePlanet" name = "zaphod" /></td>
			<td><jsp:getProperty property = "species" name = "zaphod" /></td>
			<td><jsp:getProperty property = "heads" name = "zaphod" /></td>
		</tr>
		<tr>
			<td><jsp:getProperty property = "name" name = "marvin" /></td>
			<td><jsp:getProperty property = "homePlanet" name = "marvin" /></td>
			<td><jsp:getProperty property = "species" name = "marvin" /></td>
			<td><jsp:getProperty property = "heads" name = "marvin" /></td>
		</tr>
		<tr>
			<td><jsp:getProperty property = "name" name = "slartiblartfast" /></td>
			<td><jsp:getProperty property = "homePlanet" name = "slartiblartfast" /></td>
			<td><jsp:getProperty property = "species" name = "slartiblartfast" /></td>
			<td><jsp:getProperty property = "heads" name = "slartiblartfast" /></td>
		</tr>
	</table>
</body>
</html>