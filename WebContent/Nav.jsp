<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
}

.navbar {
	overflow: hidden;
	background-color: #333;
}

.navbar a {
	float: left;
	font-size: 16px;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.subnav {
	float: left;
	overflow: hidden;
}

.subnav .subnavbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: Black;
	font-family: inherit;
	margin: 0;
}

.navbar a:hover, .subnav:hover .subnavbtn {
	background-color: red;
}

.subnav-content {
	display: none;
	position: absolute;
	left: 0;
	background-color: red;
	width: 100%;
	z-index: 1;
}

.subnav-content a {
	float: left;
	color: white;
	text-decoration: none;
}

.subnav-content a:hover {
	background-color: #eee;
	color: black;
}

.subnav:hover .subnav-content {
	display: block;
}
</style>
</head>
<body>

	<div class="navbar">
		<a href="#home">Home</a>
		<div class="subnav">
			<button class="subnavbtn">
				Actor <i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<a href="/_connectDB/ServletActorList">Actor List</a> <a
					href="/_connectDB/ServletActorAdd.jsp">Add Actor</a>
			</div>
		</div>
		<div class="subnav">
			<button class="subnavbtn">
				Movies <i class="fa fa-caret-down"></i>
			</button>
			<div class="subnav-content">
				<a href="/_connectDB/ServletFilmList">List Movies</a> <a
					href="/_connectDB/ServletFilmAdd.jsp">Add Movie</a>
			</div>
		</div>

	</div>
`</body>
</html>