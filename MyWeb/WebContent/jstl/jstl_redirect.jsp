<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>c:redirect</title>
	</head>
	<body>
		
		<c:redirect url="jstl_etc2.jsp">
			<c:param name="abc" value="안녕! redirect 테스트!" />
			<c:param name="abc2" value="url 전달"></c:param>
		</c:redirect>
		 
	</body>
</html>