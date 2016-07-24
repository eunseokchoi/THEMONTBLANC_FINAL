<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.DBbean" %>
<html>
<head>
<title>G_noticeDetail</title>
<link rel="stylesheet" type="text/css" href="notice/css/notice.css">
</head>
<body>
<div id="noticeF">
	<div id="noticeF2">
		<div id="notice_title">공지사항</div>
		<table id="notice_tableF">
			<tr class="notice_tableB">
				<td width=70% >Title</td>
				<td width=10% >Name</td>
				<td width=10% >Date</td>
				<td width=10% >Hit</td>
			</tr>
		<%
		try{
			DBbean bean = (DBbean)request.getAttribute("detail");
		%>
			<tr>
				<td width=60%><%=bean.getTitle() %></td>
				<td width=10%><%=bean.getName() %></td>
				<td width=20%><%=bean.getSdate() %></td>
				<td width=10% style="color:#ff6600"><%=bean.getHit()+1 %></td>
			</tr>
		</table>
		
		<div id="notice_contents"><%=bean.getContents().replaceAll("\r\n", "<br>") %></div>
	</div>
	<!-- 버튼 -->
		<a href='G_notice.do'><input type='button' value="목록" class="bt"></a>
</div>	
<%
	}catch(Exception ex){ ex.toString(); }
%>
</body>
</html>