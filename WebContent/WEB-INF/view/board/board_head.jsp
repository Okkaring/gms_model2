<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% String now = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); %>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>board_head</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
<div id="wrapper">
	<!-- TITLE -->
	<header>
	<h1 id="title"><a href="<%=request.getContextPath() %>/index.jsp">BOARD MGMT</a></h1>
	<div id= "clock"> TIME : <%= now %> </div>
	<hr id="title_line">
	</header>
</div>
</body>
</html>