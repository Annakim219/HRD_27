<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main page</title>
<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	width: 100%;
	height: 100%;
}

header {
	width: 100%;
	height: 10%;
	line-height: 100px;;
	text-align: center;
	background: steelblue;
	color: white;
}

nav {
	width: 100%;
	height: 5%;
	line-height: 45px;
	text-align: center;
	background: mediumpurple;
	color: white;
}

nav ul {
	display: inline-block;;
	list-style-type: none;
}

nav li {
	float: left;
	margin: 0 30px;
}

nav a {
	display: block;
	text-decoration: none;
	color:white;
}

section {
	width: 100%;
	height: 80%;
}

h2 {
	margin: 20px auto;
	text-align: center;
}

footer {
	width: 100%;
	height: 5%;
	line-height: 45px;;
	text-align: center;
	background: grey;
	color: white;
	font-size: 0.9em;
}

table {
	margin: 0 auto;
	border-collapse: collapse;
	border: 2px solid grey;
}

tr, td, th {
	border: 1px solid black;
}

#tr_btn {
	height: 50px;
}

#btn1 {
	width: 120px;
	height: 28px;
	background: lightgrey;
}

#btn2 {
	width: 120px;
	height: 28px;
	background: black;
	color: white;
}

.btn_group {
	margin: 15px auto;
}
</style>
</head>
<body>
	<header>
		<h1>도서 회원관리 ver1.0</h1>
	</header>
</body>
</html>