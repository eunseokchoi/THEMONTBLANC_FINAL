<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="mont.blanc.common.DBbean" %>
<html>
<head>
<title>guestCoInsert.jsp</title>
</head>
<%
try{
	String id=(String)session.getAttribute("NowUser");
	DBbean bb=(DBbean)request.getAttribute("detail"); //게시글
	if(id==null){ id="guest";}
%>
	<form name=cmt action="coPreinsert.do">
	<input type=hidden name=cowriter value=<%=id%>>  <!-- 접속유저 -->
	<input type=hidden name=num value=<%=bb.getNum() %>> <!-- 게시글 번호  -->
	<input type=hidden name=write value=<%=1 %>>
	<input type=text name=cmt class="ta">
	<input type=submit value="덧글입력" class="bt">
	</form>
<%	}catch(Exception e){ System.out.println("comment.jsp 예외오류 : "+e.toString()); } %>
</body>
</html>