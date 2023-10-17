<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<%@ include file = "/include/indexheader.jsp" %>
	<section>
		<div class="container">
			<h3>Family Board</h3>
			<table class="table table-bordered">
				<!-- 게시글 -->
				<thead>
					<tr>
						<th>Article No.</th>
						<th>writer</th>
						<th>title</th>
						<th>date</th>
						<th>view count</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td class="text-center" style="background-color:#bde0fe">${vo.num }</td>
							<td class="text-center">${vo.writer }</td>
							<td>
								<a href="content.board?num=${vo.num }">${vo.title }</a>
							</td>
							<td class="text-center">${vo.regdate }</td>
							<td class="text-center">${vo.hit }</td>
						</tr>
					</c:forEach>
					
				</tbody>
				<!-- 작성글 검색 및 글 작성 메뉴 -->
				<tbody>
					<tr>
						<td colspan="5" align="center">
							<form action="" class="form-inline">
								<div class="form-group">
									<input type="text" name="search" placeholder="search title.." class="form-control" />
									<input type="submit" name="search" value="search" class="btn btn-success" />
									<input type="button" value="post" class="btn btn-primary" onclick="location.href='write.board'" />
								</div>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 페이지 작업 공간 -->
			<div align="center">
				<ul class="pagination pagination-sm">
					<li><a href="list.board?pageNum=${pageVO.startPage - 10}">Prev</a></li>
					<!-- 1. 페이지 번호 처리 -->
					<c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
						<li class="{num==pageVO.pageNum ? 'active': ''}"><a href="list.board?pageNum=${num }">${num }</a></li>
					</c:forEach>
				<!-- 	<li><a href="list.board?pageNum=${num +10}">${num +10}</a></li>  -->
				<!-- 	<li><a href="#">next</a></li> -->
					<li><a href="list.board?pageNum=${pageVO.endPage + 1}">Next</a></li>
				</ul>
			</div>
		</div>
	</section>
<%@ include file = "/include/indexfooter.jsp" %>
	</body>
</html>