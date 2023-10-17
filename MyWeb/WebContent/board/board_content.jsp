<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/indexheader.jsp" %>
	<section>
	
		<div align="center" >
			
			<h2>Board page</h2>
			<table border="1" width="500px">
				<tr>
					<td width="20%">Article No.</td>
					<td width="30%">${vo.num }</td>
					<td width="20%">view count</td>
					<td width="30%">${vo.hit }</td>
				</tr>
				<tr>
					<td>Reg.Date</td>
					<td>${vo.regdate }</td>
					<td>Writer</td>
					<td>${vo.writer }</td>
				</tr>
				<tr>
					<td>Title</td>
					<td colspan="3">
						${vo.title }
					</td>
				</tr>
				<tr>
				<td>Content</td>
					<td colspan="3" height="120">
						<pre>${vo.content }</pre>
					<!-- <textarea rows="" cols="" readonly>${vo.content }</textarea>  -->
					</td>
				</tr>
				<tr>
					<!-- 글 등록 메뉴 -->
					<td colspan="4" align="center">
						<input type="button" value="list" onclick="location.href='list.board'">
						<input type="button" value="modify" onclick="location.href='modify.board?num=${vo.num}'">
					</td>
				</tr>
			</table>
			
		</div>
		
	</section>

<%@ include file = "/include/indexfooter.jsp" %>