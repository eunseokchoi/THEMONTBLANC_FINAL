<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.DBbean" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="notice/css/notice.css">
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
	
	private String skey;
	private String sval;	
%>
</head>
<body>
	<%
	try{
		total = (Integer)request.getAttribute("total");
	%>
	<div id="noticeF">
		<div id="noticeF2">
			<div id="notice_title">공지사항</div>
			<div id="notice_total">전체글 (<%=total %>)</div>
			<table id="notice_tableF">
				<tr class="notice_tableB">
					<td width=10% >NO</td>
					<td width=60% >TITLE</td>
					<td width=10% >NAME</td>
					<td width=10% >DATE</td>
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
					<td align=left><a href="G_noticeDetail.do?num=<%=bean.getNum()%>"><%=bean.getTitle() %></a></td>
					<td><%=bean.getName() %></td>
					<td><%=bean.getSdate() %></td>
					<td style="color:#ff6600"><%=bean.getHit() %></td>
				</tr>
			<%
				}
			%>	
			</table>
			<div id="notice_page">
				<%
				if(pnum == null) pnum="1";
				pageNUM = Integer.parseInt(pnum);
				
				if(total%limit==0){	pageCount = total/limit;}	
					else{pageCount = (total/limit) + 1;	}
				
				temp = (pageNUM - 1) % limit;		
				startPage = pageNUM - temp;	
				
				System.out.println("startPage : "+startPage+" pageCount : "+pageCount);
				if(startPage > pageSize){
					out.println("<a href='G_notice.do?pageNUM=" + (startPage - pageSize)  + "'>◀ 이전</a>&nbsp;");
				} 
				for(int i = startPage ; i < (startPage + pageSize) ; i++){
					if(i == pageNUM){ 
						out.println("<font color=#6e6464>["+i+"]</font>&nbsp;");
						}else{
							out.println("<a href='G_notice.do?pageNUM="+ i +"'>"+i+"</a>&nbsp;");
					}	
					if(i >= pageCount ) break;
				}
				if(startPage + pageSize <= pageCount){
					out.println("<a href='G_notice.do?pageNUM=" + (startPage + pageSize)  + "'>다음 ▶</a>");
				}
				%>
			</div>
		</div>
	</div>
	<%
		}catch(Exception ex){ ex.toString(); }
	%>
</body>
</html>