<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<style>
body {
	align-content: center;
	background-color: #E6E6FA;
}
</style>
<meta charset="ISO-8859-1">
<title>front page</title>
</head>
<body>
	<a href="/_connectDB/demo.jsp"> click here to Add new actor </a>
	<br>
	<form action="/_connectDB/demo.jsp">
		<input type='submit' name='action' value='NEW ACTOR'>
	</form>
	<h1>
		Srearch for actors name in DATABASE::<br>
	</h1>
	<form action="/_connectDB/DisplayPageActor.jsp">
		<input type='submit' name='action' value='Search Actor'>
	</form>

	<h1>Search By Address</h1>

	<form action="/_connectDB/DisplayPageAddress.jsp">
		<input type='submit' name='action' value='Search Address'>
	</form>
</body>
</html>