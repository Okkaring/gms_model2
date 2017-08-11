<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">BOMB A B Y CHU</a>
    </div>
    
    <ul class="nav navbar-nav">
      <li class="active"><a onclick="moveTo('common','main')"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
    
      <li class="dropdown">
      	<a href="#" class="dropdown-toggle"
      	data-toggle="dropdown" role="button"
      	aria-haspopup="true"
      	aria-expanded="false">회원 관리 <span class="caret"></span></a>
      	<ul class="dropdown-menu">
      		<li><a onclick="moveTo('member','member_add')">학생 추가</a></li>
      		<li><a onclick="moveTo('member','member_list')">학생 목록</a></li>
      		<li><a onclick="moveTo('member','member_search')">학생 조회</a></li>
      		<li role = "separator" class="divider"></li>
      		<li><a onclick="deleteTarget('member_delete')">학생 삭제</a></li>
      	</ul>
      	</li>
      	
        <li class="dropdown">
      	<a href="#" class="dropdown-toggle"
      	data-toggle="dropdown" role="button"
      	aria-haspopup="true"
      	aria-expanded="false">성적 관리 <span class="caret"></span></a>
      	<ul class="dropdown-menu">
      		<li><a onclick="moveTo('grade','grade_add')">성적 추가</a></li>
      		<li><a onclick="moveTo('grade','grade_list')">성적 목록</a></li>
      		<li><a onclick="moveTo('grade','grade_detail')">성적 조회</a></li>
      		<li role = "separator" class="divider"></li>
      		<li><a onclick="deleteTarget('grade_delete')">성적 삭제</a></li>
      	</ul>
      	</li>
      	
      <li class="dropdown">
      	<a href="#" class="dropdown-toggle"
      	data-toggle="dropdown" role="button"
      	aria-haspopup="true"
      	aria-expanded="false">게시판 관리 <span class="caret"></span></a>
      	<ul class="dropdown-menu">
      		<li><a onclick="moveTo('board','board_write')">게시판 추가</a></li>
      		<li><a onclick="moveTo('board','list')">게시판 목록</a></li>
      		<li><a onclick="moveTo('board','board_detail')">게시판 조회</a></li>
      		<li role = "separator" class="divider"></li>
      		<li><a onclick="deleteTarget('board_delete')">게시판 삭제</a></li>
      	</ul>
      	</li>
    </ul>
    <span class="navbar_st">${sessionScope.user.name} &nbsp; <a id="logout" onclick="logout()">로그아웃</a></span>
  </div>
</nav>
<script>
	function logout(){
		alert("로그아웃");
		location.href="${ctx}/common.do?action=logout&page=index";
	}
	function moveTo(ctx,page){
		location.href="${ctx}/"+ctx+".do?action=move&page="+page;
	}
	function deleteTarget(ctx){
		window.prompt(ctx+"의 id=?");
	}
</script>