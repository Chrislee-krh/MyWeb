<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ include file = "/include/indexheader.jsp" %>

	<section>
		<div align="center">
			<form name= "regform" action="join_ok.jsp" method="post">
				<h2>Register page(join.jsp)</h2>
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" placeholder="네 글자 이상 여덟 글자 이하"></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td>PW check</td>
						<td><input type="password" name="pw_check"></td>
					</tr>
					<tr>
						<td>Name</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>E-mail</td>
						<td><input type="email" name="email"></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><input type="text" name="address"></td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="Register" class="btn btn-primary" onclick="check()">
				<input type="button" value="Log in" class="btn btn-success" onclick="location.href='login.jsp'">
			</form>
		</div>
	</section>
	
	<script>
		function check() {
			//form은 유일하게 document.태그이름.태그이름으로 하위 태그에 대한 접근이 가능(e.g. document.regform.id.value)
			//check()는 회원 가입 창에 각 값들에 대한 검증을 위해서 사용하는 함수
			if(document.regform.id.value === '') {
				alert('ID is mendatory.');
				return;
			}else if(document.regform.id.value.length <4 || document.regform.id.value.length >8){
				alert('ID length shoud be in between 4 and 8.')
				return;
			}else if(document.regform.pw.value ==='') {
				alert('PW is mendatory.')
				return
			}else if(document.regform.pw.value !== document.regform.pw_check.value) {
				alert('Check your password again!')
				return;
			}else if(document.regform.name.value === ''){
				alert('Name is mendatory.')
				return;
			}else if(confirm('Do you want to register?'))
				//confirm()은 확인 창에 "Yes 혹은 confirm" 시 true, no, cancel 선택시 false
				document.regform.submit(); //자바 스크립트의 submit()
		}

	</script>
	
	<%@ include file = "/include/indexfooter.jsp" %>
	
	</body>
</html>