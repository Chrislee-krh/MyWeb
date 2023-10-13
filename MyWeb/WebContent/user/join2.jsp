<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/indexheader.jsp" %>
	<section>
		<div align="center">
			<form name="regform" action="join_ok.jsp" method="post">
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" placeholder="4~8letters needed"></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td>PW_Check</td>
						<td><input type="password" name="pw_check"></td>
				    </tr>
				    <tr>
				    	<td>email</td>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<td>address</td>
						<td><input type="text" name="address"></td>
					</tr>
				</table>
				<br></br>
				<input type="button" value="Register" class="btn btn-primary" onclick="check()">
				<input type="button" value="Log-in" class="btn btn-success" onclick="location.href='login.jsp'">
			</form>
		</div>	
	</section>

	<script>
		function check(){
			if(document.regform.id.value === ''){
				alert("id is mendatory");
				return;
			}else if(document.regform.id.value.length<4 || document.regform.id.value.length>8){
				alert("id length should be in between 4 and 8");
				return;
			}else if(document.regform.pw.value ===''){
				alert("pw is mendatory");
				return;
			}else if(document.regform.pw.value !== document.regform.pw_check.value){
				alert("pw is not matched");
				return;
			}else if(document.regform.name.value ===''){
				alert("name is mendatory");
				return
			}else if(confirm("Do you want to register?"){
				document.regform.submit();
			}					
		}
	</script>
<%@ include file = "/include/indexfooter.jsp" %>
</body>
</html>