<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Class.forName("com.mysql.jdbc.Driver");
%>
<sql:setDataSource dataSource="jdbc:mysql://localhost:3306/sakila"
	user="root" password="admin" />

<c:set var="address" value="${param.address}" />
<c:set var="address2" value="${param.address2}" />
<c:set var="district" value="${param.district}" />
<c:set var="city_id" value="${param.city_id}" />
<c:set var="postal_Code" value="${param.postal_Code}" />
<c:set var="phone" value="${param.phone}" />
<c:set var="location" value="${param.location}" />
<c:if test="${param.action == 'Submit'}">
	<h2>Here's list of the address</h2>
	<table border='1'>
		<tr>
			<th>address</th>
			<th>Address</th>
			<th>District</th>
			<th>City id</th>
			<th>postal code</th>
			<th>phone</th>
			<th>location</th>
			
	
	
		</tr>

		<sql:query var="qryPosts">
                  SELECT * FROM address WHERE address like "%${address}%"
          </sql:query>

		<c:forEach var="row" items="${qryPosts.rows}">
			<tr>
				<td><c:out value="${row.address}" /></td>
				<td><c:out value="${row.address2}" /></td>
				<td><c:out value="${row.district}" /></td>
				<td><c:out value="${row.city_id}" /></td>
				<td><c:out value="${row.postal_Code}" /></td>
				<td><c:out value="${row.phone}" /></td>
				<td><c:out value="${row.location}" /></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post">
		<table>

			<tr>
				<td>Address </td>
				<td><input type='text' name='address' value="${address}"></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type='submit' name='action' value='Submit'>
			</tr>
			
		</table>
</form>

</body>
</html>