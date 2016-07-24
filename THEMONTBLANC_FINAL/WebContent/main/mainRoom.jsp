<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.*" %>
<html>
<head>
</head>
<body>
<div class="maintap">
	<div class="tabtable">
	<%
	try{
		DBSQL dbsql=new DBSQL();
		int bb=dbsql.G_total();
		String pnum=request.getParameter("pageNUM");
		List ob=dbsql.G_boardSelect(pnum);
		
		request.setAttribute("total", bb);
		request.setAttribute("hotel", ob);
		
		List data=(List)request.getAttribute("hotel");
		DBSQL dbsql2=new DBSQL();
	
	for(int i=0; i<5; i++){
		DBbean bb2=(DBbean)data.get(i);
		int hh=dbsql2.cototal(bb2.getNum());
	%>
		<div class="tabttd1"><%= bb2.getWdate() %></div>
		<div class="tabttd2">
			<a href="G_guestDetail.do?num=<%=bb2.getNum()%>"><%= bb2.getTitle() %> 
			<%	if(hh>=1){	%>
			<font size=2 color=orange>[<%=hh %>]</font>
			<%	} %></a>
		</div>
	<%
		}
	}catch(Exception ex){ ex.toString(); }
	%>
	</div>
</div>			
</body>
</html>