<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- HEADER -->
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>member_head</title>
	<link rel="stylesheet" href="${css}/member.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="${js}/member.js"></script>
</head>

<body>	
<div id="wrapper">
<!-- TITLE -->
<header>
<h1 id="title"><a href="${ctx}/index.jsp">STUDENT MGMT</a></h1>
<hr id="title_line">
</header>
</div>

<!-- CONTENT -->
<div id="container">
	
	<form id="login_box" name="login_box" method="post">
		<img src="${img}/mainimg.jpg" alt="" /><br /><br />
		<span id="login_id_txt">ID</span>
		<input type="text" id="login_id" name="login_id" placeholder="※ID는 숫자 포함 8자 이내"/><br>
		<span id="login_pass_txt">Password</span>
		<input id="login_pass" type="password" name="login_pass"/><br /><br />
		<input id="loginBtn" type="submit" value="LOGIN"/>
		<input type="hidden" name="action" value="login" />
		<input type="hidden" name="page" value="main" />
		<input type="reset" value="CANCEL" />
	</form>
<script>
member.init();
</script>
<!-- FOOTER -->
<footer>
	<div>
	  <p>Posted by: LEE JUYEON</p>
	  <p>Contact information: <a href="mailto:okkaring@gmail.com">okkaring@gmail.com</a></p>
	  <a href="jdbc_test.jsp">DB 연결 테스트</a>
	  <a href="util/update_email.jsp">email update</a>
	</div>
</footer>
</div>
</body>
</html>