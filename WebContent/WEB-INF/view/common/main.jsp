<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../member/member_head.jsp" %>
<div id="container">
<!-- MAIN MENU -->
<table id="index-tab">
	<tr id="index-tab-tr">
		<th><i class="fa fa-heart"></i> STUDENT MGMT</th>
		<th><i class="fa fa-file"></i> GRADE MGMT</th>
		<th><i class="fa fa-bars"></i> LIST</th>
	</tr>
<!-- SUB MENU -->
	<tr>
	<!-- STUDENT MGMT -->
		<td>
			<ul class="index-ul">
				<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_add">STUDENT ADD</a></li>
				<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_list">STUDENT LIST</a></li>
				<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_search">STUDENT SEARCH</a></li>
				<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_update">STUDENT UPDATE</a></li>
				<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_delete">STUDENT DELETE</a></li>
			</ul>
		</td>
		
	<!-- GRADE MGMT -->
		<td>
			<ul class="index-ul">
				<li><a href="<%=request.getContextPath()%>/grade/grade_add.jsp">GRADE ADD</a></li>
				<li><a href="<%=request.getContextPath()%>/grade/grade_list.jsp">GRADE LIST</a></li>
				<li><a href="<%=request.getContextPath()%>/grade/grade_detail.jsp">GRADE DETAIL</a></li>
				<li><a href="<%=request.getContextPath()%>/grade/grade_update.jsp">GRADE UPDATE</a></li>
				<li><a href="<%=request.getContextPath()%>/grade/grade_delete.jsp">GRADE DELETE</a></li>
			</ul>
		</td>
		
	<!-- LIST -->
		<td>
			<ul class="index-ul">
				<li><a href="<%=request.getContextPath()%>/board/board_write.jsp">BOARD WRITE</a></li>
				<li><a href="<%=request.getContextPath()%>/board/board_list.jsp">BOARD LIST</a></li>
				<li><a href="<%=request.getContextPath()%>/board/board_detail.jsp">BOARD DETAIL</a></li>
				<li><a href="<%=request.getContextPath()%>/board/board_update.jsp">BOARD UPDATE</a></li>
				<li><a href="<%=request.getContextPath()%>/board/board_delete.jsp">BOARD DELETE</a></li>
			</ul>
		</td>
	</tr>
</table>
</div>
<%@ include file = "../common/footer.jsp" %>
</html>