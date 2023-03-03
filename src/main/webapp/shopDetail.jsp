<%@page import="VO.MemberVO"%>
<%@page import="VO.OrderVO"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
	OrderVO vo = (OrderVO)request.getAttribute("vo");
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");
%>

<%-- 정태영이 만든 임의의 쇼핑 디테일 페이지. --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			
		</script>
	</head>
	<body>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
		<%= vo.getItemname() %><br>
		<img src="<%= contextPath %>/images/<%= vo.getImage() %>" width="300"><br>
		<%= vo.getInfo() %><br>
		<%= vo.getManagername() %><br>
		<%= vo.getPrice() %><br>
		
		<form action="orderPro.do" method="post">
			구매자 이름 : <input type="text" name="buyername" value="<%= membervo.getName() %>"><br>
			이메일 : <input type="text" name="email" value="<%= membervo.getEmail() %>"><br>
			주소 : <input type="text" name="address1" value="<%= membervo.getAddress1() %>"><br>
				  <input type="text" name="address2" value="<%= membervo.getAddress2() %>"><br>
				  <input type="text" name="address3" value="<%= membervo.getAddress3() %>"><br>
				  <input type="text" name="address4" value="<%= membervo.getAddress4() %>"><br>
				  <input type="text" name="address5" value="<%= membervo.getAddress5() %>"><br>
			휴대폰 번호 : <input type="text" name="phonenumber" value="<%= membervo.getPhoneNum() %>"><br>
			수량 : <input type="text" name="quentity"><br>
			결제수단 : <input type="text" name="paymentmethod"><br>
			<input type="hidden" name="idx" value="<%= vo.getIdx() %>">
			<input type="submit" value="login">
		</form>
	</body>
</html>