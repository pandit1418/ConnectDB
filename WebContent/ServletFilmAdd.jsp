<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="Nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
.button {
	display: inline-block;
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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div style="padding: 0 16px">
		<h3>Add new Movies in the database</h3>

	</div>


	<form method="post" action="/_connectDB/ServletFilmAdd">
		<table>
			<tr>
				<td>title</td>
				<td><input type='text' name='title' value="${title}"></td>
			</tr>
			<tr>
				<td>description</td>
				<td><input type='text' name='description'
					value="${description}"></td>
			</tr>
			<tr>
				<td>release year</td>
				<td><input type='text' name='release_year'
					value="${release_year}"></td>
			</tr>
			<tr>
				<td>language ID</td>
				<td><input type='text' name='language_id'
					value="${language_id}"></td>
			</tr>

			<tr>
				<td>original_language_id</td>
				<td><input type='text' name='original_language_id'
					value="${original_language_id}"></td>
			</tr>
			<tr>
				<td>rental_duration</td>
				<td><input type='text' name='rental_duration'
					value="${rental_duration}"></td>
			</tr>
			<tr>
				<td>rental_rate</td>
				<td><input type='text' name='rental_rate'
					value="${rental_rate}"></td>
			</tr>
			<tr>
				<td>length</td>
				<td><input type='text' name='length' value="${length}"></td>
			</tr>
			<tr>
				<td>replacement_cost</td>
				<td><input type='text' name='replacement_cost'
					value="${replacement_cost}"></td>
			</tr>
			<tr>
				<td>rating</td>
				<td><input type='text' name='rating' value="${rating}"></td>
			</tr>
			<tr>
				<td>special_features</td>
				<td><input type='text' name='special_features'
					value="${special_features}"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type='submit' class='button' name='action'
					value='Submit Film'>
			</tr>
		</table>
	</form>
</body>
</html>