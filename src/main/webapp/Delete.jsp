<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="text-align: center; background-color: pink;" >
	<h1>회원탈퇴를 위해 비밀번호입력해서 회원탈퇴요청을 하는 VIEW</h1>
	
	<br><br><br>
		
	<form action="<%=request.getContextPath()%>/member1/signOut.me" method="post">
		
		<input type="hidden" name="email" value="${param.email}">
	
		<table width="100%">
			<tr align="center">
				<td align="center">
					비밀번호 입력 : 
					<input type="password" name="pw">
					<input type="submit" value="회원탈퇴">
				</td>
			</tr>
		</table>

	</form>
</div>	
	
	



</body>
</html>