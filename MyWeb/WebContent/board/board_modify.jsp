<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/indexheader.jsp" %>
	<section>
		<div align="center">
			<form name="regform" action="update.board?pageNum=${pageVO.pageNum }" method="post">
				<h2>Board page(modify)</h2>
				<table border="1" width="500px">
					<tr>
						<th class="text-center" style="background-color: #ffc8dd">Article No.</th>
						<td><input type="text" name="num" value="${vo.num }" readonly></td>
					</tr>
					<tr>
						<th class="text-center" style="background-color: #ffc8dd">Writer</th>
						<td><input type="text" name="writer" value="${vo.writer }" readonly></td>
					</tr>
					<tr>
						<th class="text-center" style="background-color: #ffc8dd">Title</th>
						<td><input type="text" name="title" size="10" value="${vo.title }"></td>
					</tr>
					<tr>
						<th class="text-center" style="background-color: #ffc8dd">Content</th>
						<td>
							<textarea rows="10" style="width:100%;" name="content">${vo.content }</textarea>
						</td>
					</tr>
					<tr>
						<!-- 글 등록 메뉴 -->
						<td colspan="2" align="center">
							<input type="button" value="Modify" onclick="modifyCheck()" class="btn-primary">
							<input type="button" value="List" onclick="location.href='list.board?pageNum=${param.pageNum}'" class="btn-success:hover">
							<input type="button" value="Delete" onclick="location.href='delete.board?num=${vo.num}'" class="btn-danger" >
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>

	<script>
		function modifyCheck(){
			if(document.regform.title.value === ''){
				alert('invalid title');
				return;
			}else if(confirm('Do you want to register?')){
				document.regform.submit();
			}
		}
	</script>
	


<%@ include file = "/include/indexfooter.jsp" %>