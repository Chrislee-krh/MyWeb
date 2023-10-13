<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jstl_choose01.jsp</title>
	</head>
	<body>
		<!-- choose의 자식으로 c:when, c:otherwise를 가질 수 있다 -->
		<c:choose>
			<c:when test="${param.name eq 'chris' }">
				크리스라니..이름이 개 멋지시군요.
			</c:when>
			<c:when test="${param.age >= 20 }">
				좋은 때네요.
			</c:when>
			<c:otherwise>
				크리스도 아니고, 좋은 때도 아니네요..ㅉㅉ
			</c:otherwise>
		</c:choose>
	</body>
</html>