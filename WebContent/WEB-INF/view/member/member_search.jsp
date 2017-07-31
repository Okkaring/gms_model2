<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "member_head.jsp" %>

<div id="container">
	<form id="member_search_box" action="<%=request.getContextPath()%>/member.do" method="get">
		검색 조건 : <select name="option">
		<option value="id" selected> ID </option>
		<option value="name"> NAME </option>
		</select><br /><br />
	<input type="text" name="search" />
	<input type="hidden" name="action" value="move" />
	<input type="hidden" name="page" value="member_detail" />
	<input type="submit" />
	</form>
</div>
<%@ include file = "../common/footer.jsp" %>