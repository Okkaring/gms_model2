<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "member_head.jsp" %>

<div id="container">
<img src="<%=request.getContextPath() %>/img/mainimg.jpg"/><br />
<form id="join_form" action="member_detail.jsp" method="get">
	
	<fieldset>
	<legend id="legend_set">ADD ARTICLE</legend><br />
	
 	<span id="add_id">ID:</span>
 	<input name="id" type="text" placeholder="아이디"><br>
  	
 	<span id="add_pass">Password:</span>
	<input name="pw" type="password" placeholder="비밀번호"><br>
	 
 	<span id="add_bday">Birth day:</span>
 	<input name="birthday" type="text" style="width: 170px;"><br>
 	 
 	<input type="radio" name="gender" value="male" checked> Male
 	<input type="radio" name="gender" value="female" checked> Female<br />
 	
 	<span id="add_email">E-MAIL:</span>
	<input type="email" name="email"/><input type="submit"><br />
	 
 	<span id="add_name">Name:</span>
 	<input name="name" type="text" placeholder="이름"><br><br/>
 	
 	<h2>MAJOR</h2>
 	<select name="major">
 		<option value="computer" selected>컴퓨터공학과</option>
 		<option value="economics">경제학</option>
 		<option value="tourism">관광학</option>
 		<option value="art">순수미술</option>
 	</select><br />
 	
 	<h2>SUBJECT</h2>
 	 <input type="checkbox" name="subject" value="java" checked /> java <br />
 	 <input type="checkbox" name="subject" value="C" checked/> C <br />
 	 <input type="checkbox" name="subject" value="html"/> html <br />
 	 <input type="checkbox" name="subject" value="CSS"/> CSS <br />
 	 <input type="checkbox" name="subject" value="JavaScript"/> JavaScript <br />
 	 <input type="checkbox" name="subject" value="sql"/> sql <br />
 	 <input type="checkbox" name="subject" value="pathon"/> pathon <br /><br />
 	 
 	<input id="join_yes-btn" type="submit" value="admit">
 	<input id="join_no-btn" type="reset" value="cancle">
</fieldset>
</form> 
</div>
	<%@ include file = "../common/footer.jsp" %>