<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>testcontroller.jsp</title>
	</head>
	<body>
		<!-- .test로 끝나면, 전부 연결되지만,
		실제 폴더 경로에 맞춰서 url주소를 사용하는게 좋다 -->
		<a href="join.test">회원 가입 요청</a><br>
		<a href="login.test">로그인 요청</a><br>
		<a href="/MyWeb/update.test">수정 요청</a><br> <!-- 절대 경로로 쓰면, 출력이 상대경로로 나옴 -->
		<a href="delete.test">삭제 요청</a>
	
	</body>
</html>