<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% Class.forName("com.mysql.jdbc.Driver"); %>
<sql:setDataSource dataSource="jdbc:mysql://localhost:3306/sakila" user="root" password="admin" />

<c:set var="first_name" value="${param.first_name}" />
<c:set var="last_name" value="${param.last_name}" />

<c:if test="${param.action == 'Submit'}"> 
	<c:choose>
		<c:when test="${not empty last_name}">
			<sql:update>
		    Insert into actor(first_name, last_name) VALUES(?, ?)
				<sql:param value="${first_name}"/>
				<sql:param value="${last_name}" />
			</sql:update>
			<c:set var="msg" value="Thank you for your feedback." />
			
			
			<c:set var="first_name" value="" />
			<c:set var="last_name" value="" />
		</c:when>
		<c:otherwise>
			<c:set var="msg" value="Please supply some comments." />
		</c:otherwise>
	</c:choose>
</c:if>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Speak To Me, Please</title>
</head>
<body>

<h1>Speak To Me, Please</h1>

Welcome to the Acme Corp. feedback site.

<h2>Here's what your fellow workers have said:</h2>
<table border='1'>
	<tr>
		<th>First Name </th>
		<th>Last Name</th>
	</tr>

	<sql:query var="qryPosts">
                  SELECT first_name,last_name FROM actor
          </sql:query>

	<c:forEach var="row" items="${qryPosts.rows}">
		<tr>
			<td><c:out value="${row.first_name}" /></td>
			<td><c:out value="${row.last_name}" /></td>
		</tr>
	</c:forEach>
</table>

<form method="post" action="/_conncetDB/test">
<table>
	
	<tr>
		<td>First Name: (optional)</td>
		<td><input type='text' name='first_name' value="${first_name}"></td>
	</tr>
	<tr>
		<td>last Name</td>
		<td><input type= 'text'name='last_name' value="${last_name}"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type='submit' name='action' value='Submit'>
	</tr>
</table>
<h3>${msg}</h3>
</form>

</body>
</html>
