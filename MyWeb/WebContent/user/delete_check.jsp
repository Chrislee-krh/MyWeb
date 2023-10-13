<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/include/indexheader.jsp" %>
	<section>
		<div align="center">
			<form action="delete_check_ok.jsp" method="post">
				<h3> type in current pw</h3>
				<hr>
				pw:<input type="password" name="pw">
				<input type="submit" value="confirm">
			</form>
		</div>
	</section>
<%@ include file = "/include/indexfooter.jsp" %>
