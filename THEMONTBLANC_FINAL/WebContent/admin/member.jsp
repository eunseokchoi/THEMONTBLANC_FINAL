<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.DBbean" %>
<%@ page import="mont.blanc.common.DBSQL" %>
<%!
	private int startPage;
	private int pageCount;
	private int pageSize=5;
	private int pageNUM;
	private int limit=10;
	private String returnPage;
%>
<html>
<head>
<title>member</title>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
</head>
<body>
<%
	try{
	int total=(Integer)request.getAttribute("total");
	returnPage=(String)request.getAttribute("returnPage");
	System.out.println(returnPage);
	
	String pnum=request.getParameter("pageNUM");
	if(pnum==null) pnum="1";
	pageNUM=Integer.parseInt(pnum);
	
	int temp=(pageNUM-1)%pageSize;;
	startPage=pageNUM-temp;
	
	if(total%limit==0) { pageCount=total/limit; }
	else { pageCount=(total/limit)+1; }
	
	System.out.println("startPage="+startPage+", pageCount="+pageCount);
	
	List data=(List)request.getAttribute("member");
	DBSQL dbsql=new DBSQL();
%>
<div id="adminF">
	<div id="adminF2">
		<form name="reviewlist">
			<div id="admin_title2">MEMBER LIST</div>
			<div id="admin_total">MEMBER COUNT (<%=total %>)</div>
			<table id="admin_tableF">
				<tr class="admin_tableB">
					<td width=10%>NO</td>
					<td width=10%>ID</td>
					<td width=10%>PW</td>
					<td width=10%>GENDER</td>
					<td width=15%>NAME(E)</td>
					<td width=15%>BIRTHDAY</td>
					<td width=15%>TEL</td>
					<td width=15%>E-MAIL</td>
					
				</tr>
				<%
			    for(int i=0; i<data.size(); i++){
				DBbean bb=(DBbean)data.get(i);
				%>
				<tr onMouseOver="style.backgroundColor='#ebe7e7'"
					onMouseOut="style.backgroundColor=''">
					<td><%=i+1 %></td>
					<td align="left"><%=bb.getId() %></td>
					<td align="left"><%=bb.getPw() %></td>
					<td><%=bb.getGender() %></td>
					<td align="left"><%=bb.getEngname() %></td>
					<td><%=bb.getBirthday() %></td>
					<td align="left"><%=bb.getTel() %></td>
					<td align="left"><%=bb.getEmail() %></td>
					<td align="left"><a href="delete.do?id=<%=bb.getId()%>"><input type=button value="삭제" class=bt></a></td>
				</tr>
				<%
			}
		}catch(Exception e){   }
		%>
			</table>
		</form>
		<div id="admin_page">
			<%
			if(startPage>=5){
				out.print("<a href='member.do?pageNUM="+(startPage-pageSize)+"'>◀ 이전</a>&nbsp;");
			}
			for(int i=startPage; i<(startPage+pageSize); i++){
				if(i==pageNUM){ out.println("<font color=#6e6464>"+i+"</font>&nbsp;"); }
				else{
					out.print("<a href='member.do?pageNUM="+i+returnPage+"'>"+i+"</a>&nbsp;");
				}
				if(i>=pageCount) break;
			}
			if(startPage+pageSize<=pageCount){
				out.print("<a href='member.do?pageNUM="+(startPage+pageSize)+"'>다음 ▶</a>");
			}
			%>
		</div>	
	</div>
	<!-- 검색 -->
	<form action="member.do">
		<select name=keyfield class="ta">
			<option value=name>이 름</option>
			<option value=tel>연락처</option>
		</select>
		<input type=text name=keyword class="ta2">
		<input type=submit value="검색" class="bt">
	</form>
</div>	
</body>
</html>