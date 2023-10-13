<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//url주소로 강제 접근 막기
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("login.jsp");
		return;
	}
%>        
<%
    	String id = (String)session.getAttribute("user_id");
    	String name = (String)session.getAttribute("user_name");
%>
    
	<%@ include file = "/include/indexheader.jsp" %>
	
	<section>
		<div align="center">
			<h2>Mypage</h2>
			<hr>
			Manage precious <%=id %>(<%=name %>) account.
			<hr>
			<input type="button" value="alter password" class="btn btn-success" onclick="location.href='change_pw.jsp'">
			<input type="button" value="alter info" class="btn btn-primary" onclick="location.href='update.jsp'">
			<input type="button" value="quit" class="btn btn-danger" onclick="location.href='delete_check.jsp'">
		</div>
	
	</section>
	
	<%@ include file = "/include/indexfooter.jsp" %>