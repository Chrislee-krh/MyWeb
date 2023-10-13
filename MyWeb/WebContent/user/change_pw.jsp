<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("login.jsp");
	}
%>

<%@ include file = "/include/indexheader.jsp" %>
	
	<section>
		<div align="center">
			<h3>change password page</h3>
			<hr>
			<form action="change_pw_ok.jsp" method="post">
				prev password: <input type="password" name="old_pw"><br>
				password: <input type="password" name="new_pw"><br>
				<input type="submit" value="confirm">
				<input type="button" value="cancel" onclick="history.go(-1)">
			</form>
		</div>
	</section>
	
<%@ include file = "/include/indexfooter.jsp" %>
