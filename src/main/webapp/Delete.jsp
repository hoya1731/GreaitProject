<%@page import="VO.MemberVO"%>
<%@page import="DAO.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    String contextPath = request.getContextPath();
    
    String email = (String)session.getAttribute("email");
   	MemberDAO dao = new MemberDAO();
   	MemberVO vo = dao.findMember(email);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제하기 - GreaIT</title>

<style>
	hr{
			border: solid 2px gray;
			width: 50%;
		}
	.diva{
		text-align: center;
		background-color: white;
	}
	.divb input{
		width: 200px;
		height: 20px;
	}

	input{
			width: 100px;
			height: 40px;
		}
</style>

</head>
<body>
<center>
	<div class="diva">
	<br><br><br><br>
	<h1>회원삭제</h1>
	<hr>
		<div>
		<form action="<%=contextPath%>/member1/signOut.me" method="post">
		<h3>정말로 삭제하시겠습니까?</h3>
		<input type="hidden" name="email" value="<%=vo.getEmail()%>">
			<table align="center">
			<tr align="center">
				<td align="center">
				<div class="divb">
					비밀번호를 입력해주세요.<br>
					<input type="password" name="pw"><br>
				</div>
				<br>	
					<input type="submit" value="회원탈퇴">
					<input type="button" value="홈으로">
				</td>
			</tr>
		</table>
		
		</div>
		</form >
	
	</div>
	
</center>	
</body>
</html>