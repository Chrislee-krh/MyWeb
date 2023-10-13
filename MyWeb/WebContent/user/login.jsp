<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if(session.getAttribute("user_id")!=null){
		response.sendRedirect("/user/mypage.jsp");
	}
%>
    
	<%@ include file = "/include/indexheader.jsp" %>
	
	<section>
		<div align="center">
			<h2>Log-in page</h2>
			<hr>
			<form action="login_ok.jsp" method="post">
				<input type="text" name="id" placeholder="ID"><br>
				<input type="password" name="pw" placeholder="PW"><br>
				<br>
				<input type="submit" value="Log_in" class="btn btn-success">
				<input type="button" value="Register" class="btn btn-primary"
					onclick="location.href='join.jsp'">
			</form>
		</div>
	</section>
	
	<%@ include file = "/include/indexfooter.jsp" %>
</body>
</html>