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
	<c:choose>
		<c:when test="${not empty address}">
			<sql:update>
		    Insert into address(address, address2,district,city_id,postal_Code,phone) VALUES(?,?,?,?,?,?)
				<sql:param value="${address}" />
				<sql:param value="${address2}" />
				<sql:param value="${district}"/>
				<sql:param value="${city_id}"/>
				<sql:param value="${postal_Code}"/>
				<sql:param value="${phone}"/>
				
			
			</sql:update>
			<c:set var="msg" value="Thank you for updating address" />

			<c:set var="address" value=" " />
			<c:set var="address2" value="" />
			<c:set var="district" value="" />
			<c:set var="city_id" value="" />
			<c:set var="postal_Code" value="" />
			<c:set var="phone" value="" />
			
		</c:when>
		<c:otherwise>
			<c:set var="msg" value="Fill the form currectly" />
		</c:otherwise>
	</c:choose>
</c:if>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Actor's Address</title>
</head>
<body>

	<h1>Address Updating</h1>

	
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
                  SELECT address,address2,district,city_id,postal_Code,phone,ST_AsText(location) FROM address
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

	<form method="post">
		<table>

			<tr>
				<td>Address </td>
				<td><input type='text' name='address' value="${address}"></td>
			</tr>
			<tr>
				<td>Address2</td>
				<td><input type='text' name='address2' value="${address2}"></td>
			</tr>
			<tr>
				<td>District </td>
				<td><input type='text' name='district' value="${district}"></td>
			</tr>
			<tr>
				<td>City id </td>
				<td><input type='text' name='city_id' value="${city_id}"></td>
			</tr>
			<tr>
				<td>Postal Code </td>
				<td><input type='text' name='postal_Code' value="${postal_Code}"></td>
			</tr>
			<tr>
				<td>phone  </td>
				<td><input type='text' name='phone' value="${phone}"></td>
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
