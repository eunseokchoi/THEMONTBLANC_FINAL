<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="mont.blanc.common.*" %>

<%!
	private int startPage =1, endPage=10;
	private int pageCount;
	private int pageSize=5;
	private int pageNUM;
	private int limit=10;
	private String returnPage;
%>
<html>
<head>
<title>guest.jsp</title>
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
</head>
<body>
	<%
	try{
	
		int total=(Integer)request.getAttribute("total");
		
		returnPage=(String)request.getAttribute("returnpage");
		
		String pnum = request.getParameter("pageNUM");
		if (pnum == null)
			pnum = "1";
		pageNUM = Integer.parseInt(pnum);

		int temp = (pageNUM - 1) % pageSize;	
		startPage = pageNUM - temp;
		endPage = startPage + pageSize -1 ; 
		
		if (total % limit == 0) {
			pageCount = total / limit;
		} else {
			pageCount = (total / limit) + 1;
		}
			
	List data=(List)request.getAttribute("hotel");
	DBSQL dbsql=new DBSQL();
	
	%>
<div id="adminF">
	<div id="adminF2">
		<div id="admin_title2">이용후기</div>
		<div id="admin_total">전체글 (<%=total %>)</div>
		<table id="admin_tableF">
			<tr class="admin_tableB">
				<td width=10%>NO</td>
				<td width=30%>TITLE</td>
				<td width=20%>NAME</td>
				<td width=10%>DATE</td>
				<td width=10%>HIT</td>
				<td width=10%>LIKE</td>
				<td width=10%>DELETE</td>
			</tr>
		<%
			for(int i=0; i<data.size(); i++){
				DBbean bb=(DBbean)data.get(i);
				int hh=dbsql.cototal(bb.getNum());				
		%>
			<tr onMouseOver="style.backgroundColor='#ebe7e7'" onMouseOut="style.backgroundColor=''">
				<td><b><%= bb.getRn() %></b></td>
				<td align=left><a href="G_AdminDetailguest.do?num=<%=bb.getNum()%>&pageNUM=<%=pageNUM %>"><%= bb.getTitle() %> 
				<%	if(hh>=1){	%>
				<font size=2 color=red>[<%=hh %>]</font>
				<%	} %></a></td>
				<td><%= bb.getWriter() %></td>
				<td><%= bb.getWdate() %></td>
				<td style="color:#ff6600"><%= bb.getCount() %></td>
				<td><%= bb.getReco() %></td>
				<td><a href="G_AdminDeleteguest.do?num=<%=bb.getNum()%>"><input type="button" value="삭제" class="bt"></a></td>
			</tr>
		<%
			}
		}catch(Exception e){   }
		%>
		</table>
		<div id="admin_page">
			<%
			if(startPage>pageSize){
				out.print("<a href='guest.do?pageNUM="+(startPage-pageSize)+"'>◀ 이전</a>&nbsp;");
			}
			for(int i=startPage; i<(startPage+pageSize); i++){
				if(i==pageNUM){ out.println("<font color=#6e6464>["+i+"]</font>&nbsp;"); }
				else{
					out.print("<a href='guest.do?pageNUM="+i+"'>"+i+"</a>&nbsp;");
				}
				if(i>=pageCount) break;
			}
			if(startPage+pageSize<=pageCount){
				out.print("<a href='guest.do?pageNUM="+(startPage+pageSize)+"'>다음 ▶</a>");
			}
			%>
		</div>
	</div>			
</div>
</body>
</html>