<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.DBbean" %>
<html>
<head>
<title>noticeDetail</title>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
</head>
<body>
<div id="adminF">
	<div id="adminF2">
		<div id="admin_title2">공지사항</div>
		<table id="admin_tableF">
			<tr class="admin_tableB">
				<td width=50% >Title</td>
				<td width=10% >Name</td>
				<td width=20% >Date</td>
				<td width=10% >Hit</td>
			</tr>
		<%
		try{
			DBbean bean = (DBbean)request.getAttribute("detail");
		%>
			<tr>
				<td width=50%><%=bean.getTitle() %></td>
				<td width=10%><%=bean.getName() %></td>
				<td width=30%><%=bean.getSdate() %></td>
				<td width=10% style="color:#ff6600"><%=bean.getHit()+1 %></td>
			</tr>
		</table>
		
		<div id="admin_contents"><%=bean.getContents().replaceAll("\r\n", "<br>") %></div>
	</div>
	<!-- 버튼 -->
		<a href='notice.do'><input type='button' value="목록" class="bt"></a>
		<a href='./index.jsp?page=admin/m_admin&list=noticeInsert'><input type='button' value="글쓰기" class="bt"></a>
		<a href="noticeEditPre.do?num=<%=bean.getNum() %>"><input type='button' value="수정" class="bt"></a>
		<form name=jin method=get action=noticeDelete.do>
			<input type=hidden name=num value=<%=bean.getNum() %>>			
			<input type=submit value="삭제" class="bt">
		</form>
</div>	
<%
	}catch(Exception ex){ ex.toString(); }
%>
</body>
</html>