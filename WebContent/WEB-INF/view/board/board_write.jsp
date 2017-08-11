<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp"/>

<div id="container">
	<img src="${ctx}/img/mainimg.jpg"/><br /><br />
	<form method="get">
	<textarea name="message" cols="80" rows="20"> </textarea><br />
	<input type="submit">		
	</form>
</div>
<jsp:include page="../common/footer.jsp"/>
