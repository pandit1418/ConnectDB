<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include  file="Nav.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 15px;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div style="padding: 0 16px">
		<h3>Add Actor name here </h3>

	</div>


	<form method="post" action="/_connectDB/ServletActorAdd">
		<table>

			<tr>
				<td>First Name:</td>
				<td><input type='text' name='first_name' value="${first_name}"></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type='text' name='last_name' value="${last_name}"></td>
			</tr>
			<tr>
				<td><input type='submit' class='button' name='action' value='Submit Name'></td>
			</tr>
		
		</table>
	</form>
</body>
</html>