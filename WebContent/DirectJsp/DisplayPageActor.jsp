<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% Class.forName("com.mysql.jdbc.Driver"); %>
<sql:setDataSource dataSource="jdbc:mysql://localhost:3306/sakila" user="root" password="admin" />
<c:set var="first_name" value="${param.first_name}" />
<c:set var="last_name" value="${param.last_name}" />

<c:if test="${param.action=='Submit' }">
	<sql:query var="qryPosts">
                  SELECT first_name,last_name FROM actor  where first_name="${param.first_name}" and last_name="${param.last_name}"
          </sql:query>

	<c:forEach var="row" items="${qryPosts.rows}">
		<tr>
			<td><c:out value="${row.first_name}" /></td>
			<td><c:out value="${row.last_name}" /></td>
		</tr>
	</c:forEach>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border='1'>
	<tr>
		<th>First Name </th>
		<th>Last Name</th>
	</tr>
<h1>Srearch for actors in DATABASE<br> </h1>
<form method='post'>
<table>
	<tr>
		<td>First Name:</td>
		<td><input type='text' name='first_name' value="${first_name}"></td>
	</tr>
	<tr>
		<td>last Name</td>
		<td><input type='text' name='last_name' value="${last_name}"></td>
	</tr>
	<tr>
	<input type='submit' name='action' value='Submit'>
	</tr>
</table>
</form>
</table>
</body>
</html>