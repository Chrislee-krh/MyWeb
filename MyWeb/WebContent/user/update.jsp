<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
	 이 페이지에 들어왔을 때, getUserInfo() 메서드를 재활용해서 정보를 불러온 후, 아래의 태그에 정보가 노출되게 처리. id태그는 바꿀 수 없게 처리해야 한다.
	*/
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	String id = (String)session.getAttribute("user_id");
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = dao.getUserInfo(id);
%>

<%@ include file ="/include/indexheader.jsp"%>
	<section>
		<div align="center">
			<form name="regform" action="update_ok.jsp" method="post">
				<h2>user info update page</h2>
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" value="<%=vo.getId() %>" readonly></td>
					</tr>
					<tr>
						<td>Name</td>
						<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
					</tr>
					<tr>
						<td>E-mail</td>
						<td><input type="email" name="email" value="<%=vo.getEmail() %>"></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><input type="text" name="address" value="<%=vo.getAddress() %>"></td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="Confirm" class="btn btn-primary" onclick="check()">
				<input type="button" value="My Page" class="btn btn-success" onclick="location.href='mypage.jsp'">
			</form>
		</div>
	</section>
	
	<script>
		function check() {
			//form은 유일하게 document.태그이름.태그이름으로 하위 태그에 대한 접근이 가능(e.g. document.regform.id.value)
			//check()는 회원 가입 창에 각 값들에 대한 검증을 위해서 사용하는 함수
			if(document.regform.name.value === ''){
				alert('Name is mendatory.')
				return;
			}else if(confirm('Do you want to update your info?'))
				//confirm()은 확인 창에 "Yes 혹은 confirm" 시 true, no, cancel 선택시 false
				document.regform.submit(); //자바 스크립트의 submit()
		}

	</script>

<%@ include file ="/include/indexfooter.jsp"%>