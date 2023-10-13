<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address");

UserDAO dao = UserDAO.getInstance();
UserVO vo = new UserVO(id, pw, name, email, address, null);
int result = dao.idConfirm(id);
if(result ==1){
	response.sendRedirect("join.jsp");
} else {
	int result2 = dao.join(vo);
	if(result2==1){
		response.sendRedirect("login.jsp");	
	} else {
		response.sendRedirect("join.jsp");
	}
	
}

%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>