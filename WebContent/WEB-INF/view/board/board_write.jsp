<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "board_head.jsp" %>

<div id="container">
	<img src="<%=request.getContextPath() %>/img/mainimg.jpg"/><br /><br />
	<form method="get">
	<textarea name="message" cols="80" rows="20"> </textarea><br />
	<input type="submit">		
	</form>
</div>
<%@ include file = "../common/footer.jsp" %>
