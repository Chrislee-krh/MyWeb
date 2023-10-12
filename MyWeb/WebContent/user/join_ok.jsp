<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 진행 흐름: 전달 받은 값 처리 -> 회원 가입 여부 확인 
	// 	-> 가입된 사용자인 경우(가입 실패 - 뒤로 가기)
	//		-> 가입 페이지로 재이동 
	// 	-> 가입되지 않은 사용자인 경우(가입)
	//		-> 회원 가입 축하 메세지 + 로그인 페이지로 이동
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	UserDAO dao = UserDAO.getInstance();
	
	UserVO vo = new UserVO(id, pw, name, email, address, null); 
	
	int result = dao.idConfirm(id);
	if(result ==1){ //아이디 중복
		%>
		<script>
			alert("ID is duplicated");
			history.go(-1);
		</script>
	<%}else {
		int result2 = dao.join(vo);
		if(result2 == 1){
			%>
			<script>
				alert("registered!");
				location.href="login.jsp";
			</script>
		<%}else{%>
			<script>
				alert("register failed");
				history.go(-1);
			</script>
		<%}
	}

%>
