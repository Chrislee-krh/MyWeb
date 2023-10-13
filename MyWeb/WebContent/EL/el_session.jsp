<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.setAttribute("id", "clairvoy");
	UserVO vo = new UserVO();
	vo.setId("clair");
	vo.setName("chris");
	vo.setAddress("sanjose");
	
	session.setAttribute("vo", vo);
	
	application.setAttribute("admin", "clairV");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>el_session.jsp</title>
	</head>
	<body>
		<a href="el_session_ok.jsp">세션 값 확인</a>
	</body>
</html>