<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>  
DBbean_re" %>
<%@ page import="mont.blanc.common.DBbean" %>
<html>
<head>
<title>guestEdit.jsp</title>
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">
</head>
<body>
<%
	try{
	DBbean bean=(DBbean)request.getAttribute("hey");
	DBbean bb=(DBbean)request.getAttribute("detail");
%>
<div id="guestF">
	<form name=guestInsert action="G_guestEdit.do">
	<div id="guestF2">
	<div id="guest_title2">게시글 수정</div>
	<table>
		<tr>
			<td class="guestB"><input type=hidden name=num value="<%=bean.getNum()%>">제목</td>
			<td><input type=text name=title value="<%=bean.getTitle() %>" class="guestS"></td>
		</tr>
		<tr>
			<td class="guestB">내용</td>
			<td><textarea name=contents rows=20 cols=60 class="guestS"><%=bean.getContents() %></textarea></td>
		</tr>
	</table>
	</div>
	<!-- 버튼 -->
		<input type=submit value=확인 class="bt">
	</form>	
		<a href='G_guest.do'><input type='button' value="취소" class="bt"></a>
<%
	}catch(Exception e){  System.out.println("edit 오류 : "+e.toString());}
%>	
</div>
</body>
</html>