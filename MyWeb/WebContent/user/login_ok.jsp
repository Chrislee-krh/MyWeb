<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        /*
    1. DAO를 통해 executeQuery()메서드를 이용한 결과값 존재 여부 확인
    2. 결과있으면, 성공 1 세션 열어 저장
    	없으면, 실패 0 로그인 페이지로 이동
    */
    <%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    UserDAO dao = UserDAO.getInstance();
    int result = dao.login(id, pw);
    if(result ==1){
    	UserVO vo = dao.getUserInfo(id);
    	String name = vo.getName();
    	//System.out.println("이름: " + name);
    	session.setAttribute("user_id", id);
    	session.setAttribute("user_name", name);
    	response.sendRedirect("mypage.jsp");
    } else {
    	%>
    	<script>
	    	alert('Log in failed');
	    	history.go(-1);    	
    	</script>
    <%} %>