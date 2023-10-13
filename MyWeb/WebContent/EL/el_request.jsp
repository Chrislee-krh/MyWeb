<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	UserVO vo = new UserVO();
	vo.setId("hhh123");
	vo.setName("name");
	vo.setAddress("산골짜기");
	
	request.setAttribute("vo", vo);
	
	RequestDispatcher dp = request.getRequestDispatcher("el_request_ok.jsp");
	dp.forward(request, response);
%>