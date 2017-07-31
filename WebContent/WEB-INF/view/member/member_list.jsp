<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file = "member_head.jsp" %>

<div id="container">
<table id="member_list_tab">
	<tr>
		<th> N° </th>
		<th> ID </th>
		<th> SSN </th>
		<th> NAME </th>
		<th> REGDATE </th>
		<th> PHONE </th>
		<th> @EMAIL </th>
		<th> MAJOR </th>
		<th> MODIFY / DELETE </th>
	</tr>

	<tr>
		<td> N° </td>
		<td> ID </td>
		<td> SSN </td>
		<td> <a href="<%= request.getContextPath()%>/member/member_detail.jsp?id=">ㅇㅣ름</a> </td>
		<td> regdate </td>
		<td> phone </td>
		<td> email </td>
		<td> major </td>
		<td> <a href="<%= request.getContextPath()%>/member/member_update.jsp?id="> MODIFY </a> <a href="<%= request.getContextPath()%>/member/service_delete.jsp?id="> DELETE </a></td>
	</tr>

</table>
</div>
<%@ include file = "../common/footer.jsp" %>