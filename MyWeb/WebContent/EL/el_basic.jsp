<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%=1+2 %>
		<%="안녕" %>
		<%= 1>2 || 1 ==2%><br>
		
		<!-- 산술 연산 및 출력 -->
		${1+2}<br>
		${'안녕' }<br>
		<!-- 비교 -->
		${1>2 || 1==2}<br>
		${1>2 or 1==2 }<br>
		${'홍길동' == '홍길동' }<br>
		${'홍길동' eq '홍길동' }<br>
		<!-- ${'홍길동' ne '홍길동' }<br> -->
		<!-- 삼항 -->
		${1==2 ? "같음":"다름" }<br>
		
	</body>
</html>