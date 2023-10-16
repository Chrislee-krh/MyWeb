<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<tr>
						<td>1</td>
						<td>e.g)1</td>
						<td>e.g)title</td>
						<td>e.g)date</td>
						<td>e.g)viewcnt-1 +1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>e.g)2</td>
						<td>e.g)title</td>
						<td>e.g)date</td>
						<td>e.g)viewcnt-2 +1</td>
					</tr>
					<tr>
						<td>3</td>
						<td>e.g)3</td>
						<td>e.g)title</td>
						<td>e.g)date</td>
						<td>e.g)viewcnt-3 +1</td>
					</tr>
					<tr>
						<td>4</td>
						<td>e.g)4</td>
						<td>e.g)title</td>
						<td>e.g)date</td>
						<td>e.g)viewcnt-4 +1</td>
					</tr>
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
					<li><a href="#">prev</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">next</a></li>
				</ul>
			</div>
			
			
		</div>
	</section>
<%@ include file = "/include/indexfooter.jsp" %>
	</body>
</html>