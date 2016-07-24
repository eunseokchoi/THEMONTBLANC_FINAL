<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.DBbean" %>
<html>
<head>
<title>guestDetail</title>
<link rel="stylesheet" type="text/css" href="guest/css/faq.css">
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<body>
<%
try{
	DBbean bean=(DBbean)request.getAttribute("detail");
%>
<div id="adminF">
	<div id="adminF2">
		<div id="admin_title2">문의사항</div>
		<table id="admin_tableF">
			<tr class="admin_tableB">			
				<td width=10%>GROUP</td>
				<td width=30%>TITLE</td>
				<td width=10%>NAME</td>
				<td width=15%>TEL</td>
				<td width=15%>MAIL</td>
				<td width=10%>DATE</td>
			</tr>
			<tr>
				<td><%= bean.getQselect() %></td>
				<td><%= bean.getQtitle() %></td>
				<td><%= bean.getQname() %></td>
				<td><%= bean.getQtel() %></td>
				<td><%= bean.getQemail() %></td>
				<td><%= bean.getNalja()%></td>
			</tr>
		</table>	
			
		<div id="admin_contents">
		<table>
		<tr>
			<td></td><td></td><td></td>
		</tr>
		</table>
		<%=bean.getQcontents().replaceAll("\r\n", "<br>")%>
		</div>
		
		<!-- 버튼 -->	
		<div id="admin_bottom">
			<a href='request.do'><input type='button' value="목록" class="bt"></a>
			<form name=jin method=get action=requestDelete.do>
				<input type=hidden name=num value=<%=bean.getQno() %>>			
			<input type=submit value="삭제" class="bt">
		</form>
		</div>
	</div>	
<%
}catch(Exception ex){   }
%>
</div>	
</body>
</html>