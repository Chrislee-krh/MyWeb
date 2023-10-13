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
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");

	UserDAO dao = UserDAO.getInstance();
	UserVO vo = new UserVO(id,null,name,email,address, null);
	
	System.out.println(vo.getName());
	int result = dao.update(vo);
	
	if(result ==1){
		%>
		<script>
			alert('user info gets successfully changed!');
		<%
			HttpSession session2 = request.getSession();
			session.setAttribute("user_name", name);
		%>
			location.href="mypage.jsp"
		</script>
		<%}else{%>
		<script>
			alert('failed in change user info');
			location.href="mypage.jsp"
		</script>
		<% }%>
	

%>    
    
