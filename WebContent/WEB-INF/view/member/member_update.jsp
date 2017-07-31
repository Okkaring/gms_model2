<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "member_head.jsp" %>
		
<div id="container">
	<form action="<%=request.getContextPath()%>/member/update.do" method="get" >
	<table id="member_detail_tab">
		<tr>
			<td colspan="2" rowspan="3" class="content_width"><img src="<%=request.getContextPath()%>/img/profile_img.jpg"/></td>
			<td class="content_width">이름</td>
			<td>name</td>
		</tr>
		<tr>
			<td class="content_width">ID</td>
			<td>id</td>
		</tr>
		<tr>
			<td class="content_width">SSN</td>
			<td>ssn</td>
		</tr>
		<tr>
			<td colspan="3">전화</td>
			<td><input type="text" name="phone" placeholder="phone"/></td>
		</tr>
		<tr>
			<td colspan="3">이메일</td>
			<td>email</td>
		</tr>
		<tr>
			<td colspan="3">전공</td>
			<td>major</td>
		</tr>
	</table>
	<input type="submit" id="confirm_btn"value="수 정"/>
	<input type="button" onclick="javascript:cancel()" value="취 소"/>
	<input type="hidden" name="id" value="id" />
	</form>
</div>	
<script>
function cancle(){
	location.href="<%=request.getContextPath()%>/member/member_list.jsp?id=id";
}
</script> 
<%@ include file = "../common/footer.jsp" %>
