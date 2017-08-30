<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="${js}/member.js"></script>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">BOMBABYCHU</a>
    </div>
    
    <ul class="nav navbar-nav">
      <li class="active"><a id = "navbar" onclick="moveTo('common','main')"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>  
        
      <li class="dropdown">
      	<a href="#" class="dropdown-toggle"
      	data-toggle="dropdown" role="button"
      	aria-haspopup="true"
      	aria-expanded="false">회원 관리<span class="caret"></span></a>
      	
      	<ul id="navbar_ul_stu">
      		<li><a>학생 추가</a></li>
      		<li><a>학생 목록</a></li>
      		<li><a>학생 조회</a></li>
      		<li></li>
      		<li><a>학생 삭제</a></li>
      	</ul>
      	</li>
      	
        <li class="dropdown">
      	<a href="#" class="dropdown-toggle"
      	data-toggle="dropdown" role="button"
      	aria-haspopup="true"
      	aria-expanded="false">성적 관리<span class="caret"></span></a>
      	
      	<ul id="navbar_ul_grade">
      		<li><a>성적 추가</a></li>
      		<li><a>성적 목록</a></li>
      		<li><a>성적 조회</a></li>
      		<li></li>
      		<li><a>성적 삭제</a></li>
      	</ul>
      	</li>
      	
      <li class="dropdown">
      	<a href="#" class="dropdown-toggle"
      	data-toggle="dropdown" role="button"
      	aria-haspopup="true"
      	aria-expanded="false">게시판 관리<span class="caret"></span></a>
      	
      	<ul id="navbar_ul_board">
      		<li><a>게시판 추가</a></li>
      		<li><a>게시판 목록</a></li>
      		<li><a>게시판 조회</a></li>
      		<li></li>
      		<li><a>게시판 삭제</a></li>
      	</ul>
      	</li>
    </ul>
    <span class="navbar_st">${sessionScope.user.name} &nbsp; <a id="logout">로그아웃</a></span>
  </div>
</nav>
<script>
	function logout(ctx,page){
		alert("로그아웃");
		location.href="${ctx}/"+ctx+".do?action=logout&page="+page;
	}
	function moveTo(ctx,page){
		location.href="${ctx}/"+ctx+".do?action=move&page="+page;
	}
	function deleteTarget(ctx){
		prompt(ctx+"의 id");
	}
	function list(ctx,page,pageNumber){
		location.href="${ctx}/"+ctx+".do?action=list&page="+page+"&pageNumber="+pageNumber;
	}
	function mainLoad(){
		var u1 = document.getElementById("main_ul_stu");
		var u2 = document.getElementById("main_ul_grade");
		var u3 = document.getElementById("main_ul_board");
		var u1c= u1.children;
		var u2c= u2.children;
		var u3c= u3.children;
		u1.setAttribute("class","list-group");
		u2.setAttribute("class","list-group");
		u3.setAttribute("class","list-group");
		var i;
		for(i=0;i<u1c.length;i++){
			u1c[i].setAttribute("class","list-group-item");
		}
		for(i=0;i<u2c.length;i++){
			u2c[i].setAttribute("class","list-group-item");
		}
		for(i=0;i<u3c.length;i++){
			u3c[i].setAttribute("class","list-group-item");
		}

		u1c[0].setAttribute("onclick","moveTo('member','member_add')");
		u1c[1].setAttribute("onclick","list('member','member_list','1')");
		u1c[2].setAttribute("onclick","moveTo('member','member_search')");
		u1c[3].setAttribute("onclick","moveTo('member','member_update')");
		u1c[4].setAttribute("deleteTarget('member_delete')");
		
		u2c[0].setAttribute("onclick","moveTo('grade','grade_add')");
		u2c[1].setAttribute("onclick","list('grade','grade_list','1')");
		u2c[2].setAttribute("onclick","moveTo('grade','grade_detail')");
		u2c[3].setAttribute("onclick","moveTo('grade','grade_update')");
		u2c[4].setAttribute("onclick","deleteTarget('grade_delete')");
		
		u3c[0].setAttribute("onclick","moveTo('board','board_write')");
		u3c[1].setAttribute("onclick","list('board','board_list','1')");
		u3c[2].setAttribute("onclick","moveTo('board','board_detail')");
		u3c[3].setAttribute("onclick","moveTo('board','board_update')");
		u3c[4].setAttribute("onclick","deleteTarget('board_delete')");
	}
	function navbarLoad(){
		
		var u1 = document.getElementById("navbar_ul_stu");
		var u2 = document.getElementById("navbar_ul_grade");
		var u3 = document.getElementById("navbar_ul_board");
		u1.setAttribute("class","dropdown-menu");
		u2.setAttribute("class","dropdown-menu");
		u3.setAttribute("class","dropdown-menu");
		var u1c = u1.children;
		var u2c = u2.children;
		var u3c = u3.children;
		u1c[0].setAttribute("onclick","moveTo('member','member_add')");
		u1c[1].setAttribute("onclick","list('member','member_list','1')");
		u1c[2].setAttribute("onclick","moveTo('member','member_search')");
		u1c[3].setAttribute("role","separator");
		u1c[3].setAttribute("class","divider");
		u1c[4].setAttribute("onclick","deleteTarget('member_delete')");
		u2c[0].setAttribute("onclick","moveTo('grade','grade_add')");
		u2c[1].setAttribute("onclick","list('grade','grade_list','1')");
		u2c[2].setAttribute("onclick","moveTo('grade','grade_detail')");
		u2c[3].setAttribute("role","separator");
		u2c[3].setAttribute("class","divider");
		u2c[4].setAttribute("onclick","deleteTarget('grade_delete')");
		u3c[0].setAttribute("onclick","moveTo('board','board_write')");
		u3c[1].setAttribute("onclick","list('board','board_list','1')");
		u3c[2].setAttribute("onclick","moveTo('board','board_detail')");
		u3c[3].setAttribute("role","separator");
		u3c[3].setAttribute("class","divider");
		u3c[4].setAttribute("onclick","deleteTarget('board_delete')");
		var logout = document.getElementById("logout");
		logout.setAttribute("onclick","'common','home'");
	}
	function findByName(){
		var search = document.getElementById('search').value;
		if(search===""){
			alert('검색어를 입력하세요.');
			return false;
		}
		alert('잘 봐 이것은 mbr_list / function: / findByName: '+ search);
		location.href="${ctx}/member.do?action=search&page=member_list&search="+search;
		return true;
	}
	function updateStudent(id){
		alert('수정할 id : ' +id);
		location.href="${ctx}/member.do?action=update&page=member_update&id="+id;
	}
	function deleteStudent(id){
		alert('삭제할 id : ' + id);
		location.href="${ctx}/member.do?action=delete&page=member_list&id="+id;
	}
	function detailStudent(id){
		alert('조회할 id : ' + id);
		location.href="${ctx}/member.do?action=detail&page=member_detail&id="+id;
	}
	window.onload=navbarLoad();

    function studentInfo(){
  	  var id='id',
  	      id_val='${requestScope.student.id}',
  	      name='name',
  	      name_val='${requestScope.student.name}',
  	      email='email',
  	      email_val='${requestScope.student.email}'
  	      ;
  	  sessionStorage.setItem(id,id_val);    
  	  sessionStorage.setItem(name,name_val);    
  	  sessionStorage.setItem(email,email_val);    
    }
    /* window.addEventListener('load',test,false); */
    function memberAdd(){
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		var birthday = document.getElementById("birthday").value;
	  		if(id===""){
	  			alert('ID를 입력해 주세요.');
	  			return false;
	  		}
	  		if(pw===""){
	  			alert('pw를 입력해 주세요.');
	  			return false;
	  		}
	  		if(birthday===""){
	  			alert('생일을 입력해 주세요.');
	  			return false;
	  		}
  		var form = document.getElementById('join_form');
  		form.setAttribute('action','${ctx}/member.do');
  		form.setAttribute('method','post');
  		form.submit();
  		return true;
  	}
   
</script>