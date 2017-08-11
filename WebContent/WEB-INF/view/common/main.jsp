<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common_head.jsp"/>


<div id="container" >
	<div class="row">
		<div class="col-sm-4">
			<h3>학생관리</h3>
				<ul class="list-group">
					<li class="list-group-item"><a onclick = "moveTo('member','member_add')">STUDENT ADD</a></li>
					<li class="list-group-item"><a onclick = "moveTo('member','member_list')">STUDENT LIST</a></li>
					<li class="list-group-item"><a onclick = "moveTo('member','member_search')">STUDENT SEARCH</a></li>
					<li class="list-group-item"><a onclick = "moveTo('member','member_update')">STUDENT UPDATE</a></li>
					<li class="list-group-item"><a onclick = "deleteTarget('member_delete')">STUDENT DELETE</a></li>
				</ul>
		</div>
		<div class="col-sm-4">
			<h3>성적관리</h3>
				<ul class="list-group">
					<li class="list-group-item"><a onclick = "moveTo('grade','grade_add')">GRADE ADD</a></li>
					<li class="list-group-item"><a onclick = "moveTo('grade','grade_list')">GRADE LIST</a></li>
					<li class="list-group-item"><a onclick = "moveTo('grade','grade_detail')">GRADE DETAIL</a></li>
					<li class="list-group-item"><a onclick = "moveTo('grade','grade_update')">GRADE UPDATE</a></li>
					<li class="list-group-item"><a onclick = "deleteTarget('grade_delete')">GRADE DELETE</a></li>
				</ul>
		</div>
		<div class="col-sm-4">
			<h3>게시판관리</h3>
				<ul class="list-group">
					<li class="list-group-item"><a onclick = "moveTo('board','board_write')">BOARD WRITE</a></li>
					<li class="list-group-item"><a onclick = "moveTo('board','board_list')">BOARD LIST</a></li>
					<li class="list-group-item"><a onclick = "moveTo('board','board_detail')">BOARD DETAIL</a></li>
					<li class="list-group-item"><a onclick = "moveTo('board','board_update')">BOARD UPDATE</a></li>
					<li class="list-group-item"><a onclick = "deleteTarget('board_delete')">BOARD DELETE</a></li>
				</ul>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"/>
</html>

<script>
	function moveTo(ctx,page){
		location.href="${ctx}/"+ctx+".do?action=move&page="+page;
	}
	function deleteTarget(ctx){
		window.prompt(ctx+"의 id");
	}
</script>