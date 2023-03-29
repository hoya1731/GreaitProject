
<%@page import="VO.YoutubeCrawlingVO"%>
<%@page import="VO.VideoCrawlingVO"%>
<%@page import="VO.BoxCrawlingVO"%>
<%@page import="VO.CrawlingVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();

ArrayList list = (ArrayList) request.getAttribute("youtubeList");
// ArrayList list2 = (ArrayList) request.getAttribute("youtubeList2");
// ArrayList list3 = (ArrayList) request.getAttribute("youtubeList3");

YoutubeCrawlingVO vo = null;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.108.0">
<title>Center</title>
<!-- 제이쿼리 사용을 위한 제이쿼리 라이이브러리 연동 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript" src="<%=contextPath%>/eq/js/main.js"></script>

<style type="text/css">
.centertb1 {
	width: 98%;
	height: 350px;
	text-align: center;
	margin: auto;
}

.centertb2 {
	width: 98%;
	text-align: center;
	height: 400px;
	margin: auto;
}

.centertb3 {
	width: 98%;
	text-align: center;
	margin-top: 20px;
	height: 400px;
}

a {
	text-decoration: none;
	color: black;
}

hr {
	width: 90%;
	border: 1.5px gray solid;
}

.fonttb {
	font-size: 0.8em;
	text-align: left;
}
</style>

</head>
<body>
	<center>

		<div>
			<br>
			<h2>관련영상</h2>
			<hr>
				<table class="centertb1">
					<tr>
						<%
							for(int i=0; i<5; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td>
						<div>
							<a href="<%=vo.getHref()%>">
								<img src="<%=vo.getImgSrc()%>" alt="" width="200px" height="130px" /><br>
							</a>
						</div>
					
						<a href="<%=vo.getHref()%>">
							<strong><%=title%></strong><br>
						</a>
						</td>
						<%} %>
					</tr>
					<tr>
						<%
							for(int i=5; i<10; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td>
						<div>
							<a href="<%=vo.getHref()%>">
								<img src="<%=vo.getImgSrc()%>" alt="" width="200px" height="130px" /><br>
							</a>
						</div>
					
						<a href="<%=vo.getHref()%>">
							<strong><%=title%></strong><br>
						</a>
						</td>
						<%} %>
					</tr>
					<tr>
						<%
							for(int i=10; i<15; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td>
						<div>
							<a href="<%=vo.getHref()%>">
								<img src="<%=vo.getImgSrc()%>" alt="" width="200px" height="130px" /><br>
							</a>
						</div>
					
						<a href="<%=vo.getHref()%>">
							<strong><%=title%></strong><br>
						</a>
						</td>
					
					<%} %>
					</tr>
					<tr>
					
						
						<%
							for(int i=15; i<20; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td>
						<div>
							<a href="<%=vo.getHref()%>">
								<img src="<%=vo.getImgSrc()%>" alt="" width="200px" height="130px" /><br>
							</a>
						</div>
					
						<a href="<%=vo.getHref()%>">
							<strong><%=title%></strong><br>
						</a>
						</td>
						<%} %>
					</tr>
					<tr>
						
						<%
							for(int i=20; i<25; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td>
						<div>
							<a href="<%=vo.getHref()%>">
								<img src="<%=vo.getImgSrc()%>" alt="" width="200px" height="130px" /><br>
							</a>
						</div>
					
						<a href="<%=vo.getHref()%>">
							<strong><%=title%></strong><br>
						</a>
						</td>
						<%} %>
					</tr>	
				</table>
				<br>
				<br>
		</div>
		<!-- 영화 슬라이드 구역 끝-->
	</center>
</body>
</html>