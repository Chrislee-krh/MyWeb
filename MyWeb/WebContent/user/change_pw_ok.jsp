<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("login.jsp");
		return;
	}

	request.setCharacterEncoding("utf-8");
	String old_pw = request.getParameter("old_pw");
	String new_pw = request.getParameter("new_pw");
	
	UserDAO dao = UserDAO.getInstance();
	String id = (String)session.getAttribute("user_id");
	
	int result = dao.login(id, old_pw);
	if(result==1){
		int result2 = dao.changePassword(id, new_pw);
		if(result2 ==1){
			%>
			<script>
				alert("pw is successfully changed");
				location.href="mypage.jsp"
			</script>
		<%}else{%>
			<script>
				alert("pw isn't successfully changed");
				location.href="mypage.jsp"
			</script>
			<%
		}
	} else {
		%>
		<script>
			history.go(-1);
		</script>
		<%
	}
%>