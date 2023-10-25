<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/indexheader.jsp" %>
	<section>
		<div align="center">
			<form name="regform" action="register.board" method="post" enctype="multipart/form-data">
				<h2>Board page</h2>
				<table border="1" width="500px">
					<tr>
						<td>writer</td>
						<td><input type="text" name="writer" size="10"></td>
					</tr>
					<tr>
						<td>title</td>
						<td><input type="text" name="title" size="10"></td>
					</tr>
					<tr>
						<td>content</td>
						<td>
							<textarea rows="10" style="width:100%;" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td>attachment</td>
						<td><input type="file" name="filename"></td>
						
					</tr>
					<tr>
						<!-- 글 등록 메뉴 -->
						<td colspan="2" align="center">
							<input type="button" value="register" onclick="registCheck()">
							<input type="button" value="list" onclick="location.href='list.board'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>

	<script>
		function registCheck(){
			if(document.regform.writer.value === ''){
				alert('invalid writer');
				return;
			}else if(document.regform.title.value === ''){
				alert('invalid title');
				return;
			}else if(confirm('Do you want to register?')){
				document.regform.submit();
			}
		}
	</script>
	


<%@ include file = "/include/indexfooter.jsp" %>