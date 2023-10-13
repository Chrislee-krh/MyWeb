<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("login.jsp");
		return;
	}

	String id = (String)session.getAttribute("user_id");
	String pw = request.getParameter("pw");
	System.out.println(id);
	System.out.println(pw);
	UserDAO dao = UserDAO.getInstance();
	
	int result = dao.login(id, pw);
	if(result ==1){
		int result2 = dao.delete(id);
		
		if(result2==1){
			session.invalidate();
			%>
			<script>
				alert('successfully delete your account');	
				location.href="/MyWeb"
			</script>
			<%
		} else {
			%>
			<script>
				alert('fail to delete your account');
				location.href="mypage.jsp"
			</script>
			<%
		}
	} else {
		%>
		<script>
			alert('check your password');
			location.href="mypage.jsp"
		</script>
	<% }%>