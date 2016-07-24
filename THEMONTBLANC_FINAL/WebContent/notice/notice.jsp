<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.DBbean" %>
<html>
<head>
<title>notice 관리자전용페이지</title>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%!
	private int pageSize = 5; 
	private int limit = 5; 	
	private int pageNUM;		
	private int pageCount;		
	private int temp;			
	private int startPage;		
	private int total;	
	
	private String pnum;
	private int rownum;
%>
</head>
<body>
<%
	try{
		total = (Integer)request.getAttribute("total");	
%>			
<div id="adminF">
	<div id="adminF2">
		<div id="admin_title2">공지사항</div>
		<div id="admin_total">전체글 (<%=total %>)</div>
		<table id="admin_tableF">
			<tr class="admin_tableB">
				<td width=10% >NO</td>
				<td width=40% >TITLE</td>
				<td width=10% >NAME</td> <!-- 추가됨 -->
				<td width=30% >DATE</td>
				<td width=10% >HIT</td>
			</tr>
		<%
			pnum = (String)request.getParameter("pageNUM");
			
			if(pnum == null) pnum="1";
			pageNUM = Integer.parseInt(pnum);
			
			rownum = total-((pageNUM-1)*limit);
			 
			List data = (List)request.getAttribute("list");
			for(int i = 0; i < data.size() ; i++ ){
				DBbean bean = (DBbean)data.get(i); 
		%>
			<tr onMouseOver="style.backgroundColor='#ebe7e7'" onMouseOut="style.backgroundColor=''">
				<td><%=rownum--%></td>
				<td align=left><a href="noticeDetail.do?num=<%=bean.getNum()%>"><%=bean.getTitle() %></a></td>
				<td><%=bean.getName() %></td>
				<td><%=bean.getSdate() %></td>
				<td style="color:#ff6600"><%=bean.getHit() %></td>
			</tr>
		<%
			}
		%>	
		</table>
		<div id="admin_page">
			<%
			if(pnum == null) pnum="1";
			pageNUM = Integer.parseInt(pnum);
			
			if(total%limit==0){	pageCount = total/limit;}	
			else{pageCount = (total/limit) + 1;	}
			
			temp = (pageNUM - 1) % 10;		
			startPage = pageNUM - temp;	
			
			System.out.println("startPage : "+startPage+" pageCount : "+pageCount);
			if(startPage > pageSize){
				out.println("<a href='notice.do?pageNUM=" + (startPage - pageSize)  + "'>◀ 이전</a>&nbsp;");
			}//if 이전 
			for(int i = startPage ; i < (startPage + pageSize) ; i++){
				if(i == pageNUM){ 
					out.println("<font color=#6e6464>["+i+"]</font>&nbsp;");
					}else{
						out.println("<a href='notice.do?pageNUM="+ i +"'>"+i+"</a>&nbsp;");
				}	
				if(i >= pageCount ) break;
			}//for end
			if(startPage + pageSize <= pageCount){
				out.println("<a href='notice.do?pageNUM=" + (startPage + pageSize)  + "'>다음 ▶</a>");
			}//if 다음
			%>
		</div>
	</div>
	<!-- 버튼 -->
		<a href='./index.jsp?page=admin/m_admin&list=noticeInsert'><input type='button' value="글쓰기" class="bt"></a>
</div>	
	<%
	}catch(Exception ex){ ex.toString(); }
	%>
</body>
</html>