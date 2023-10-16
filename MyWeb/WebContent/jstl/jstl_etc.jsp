<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String test = "test";
	pageContext.setAttribute("test", test);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jstl_etc.jsp</title>
	</head>
	<body>
		<c:set var="test2" value="test2"></c:set>
		<c:set var="test1" value="<%=test %>"/>
		<c:remove var="test" scope="page"/> <!-- 이렇게해도 test는 지워지지 않는다 -->
		<c:remove var="test2" scope="page"/> <!-- 이건 지워짐 -->
		<% pageContext.removeAttribute("test"); %> <!-- 아직 안지워짐 -->
		<%=test %><br>
		${test }<br> <!-- 출력 안됨 -->
		
		${test2 }<br>
		
		<h2>c:forTokens 테스트</h2>
		<!-- 
		자바의 StringTokenizer를 JSTL로 구현하려 할 때 쓸 수 있다. 
		문자열을 구분자로 나눌 때 사용함	
		-->
		<c:set var="tokens" value="안녕/지금은/JSP수업시간/이다."></c:set>
		<c:forTokens var="abc" items="${tokens }" delims="/">
			${abc }
		</c:forTokens>
		
	</body>
</html>