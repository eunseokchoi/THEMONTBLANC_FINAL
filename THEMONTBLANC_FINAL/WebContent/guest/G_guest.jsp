<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="mont.blanc.common.DBbean" %>

<%@ page import="mont.blanc.common.DBSQL" %>
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
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">
</head>
<body>
	<%
		try{
			int total=(Integer)request.getAttribute("total");
			int sub = (Integer) request.getAttribute("sub");
			returnPage=(String)request.getAttribute("returnpage");
			
			String pnum = request.getParameter("pageNUM");
			if (pnum == null)
				pnum = "1";
			pageNUM = Integer.parseInt(pnum);
		
			int temp = (pageNUM - 1) % pageSize;	
			startPage = pageNUM - temp;
			endPage = startPage + pageSize -1 ; 
			
			if (sub % limit == 0) {
				pageCount = sub / limit;
			} else {
				pageCount = (sub / limit) + 1;
			}	
		
			List data = (List) request.getAttribute("hotel");	
			List noticedata = (List) session.getAttribute("notice");
			DBSQL dbsql = new DBSQL();
	%>
	<div id="guestF">
		<div id="guestF2">
			<div id="guest_title2">Board</div>
			<div id="guest_total">전체글 (<%=sub %> / <%=total %>)</div>
			<table id="guest_tableF">
				<tr class="guest_tableB" >
					<td width=10%>NO</td>
					<td width=15%>CATEGORY</td>
					<td width=25%>TITLE</td>
					<td width=10%>NAME</td>
					<td width=15%>DATE</td>
					<td width=5%>COUNT</td>
					<td width=20%>REVIEW</td>
				</tr>
	<%
			for(int i=0; i<data.size(); i++){
				DBbean bb=(DBbean)data.get(i);
				int hh=dbsql.cototal(bb.getNum());
					
	%>
				<tr onMouseOver="style.backgroundColor='#ebe7e7'" onMouseOut="style.backgroundColor=''" height="30" align="center">
					<td><b><%= bb.getRn() %></b></td>
					<td><%= bb.getCategory() %></td>
					<td align=center><a href="G_guestDetail.do?num=<%=bb.getNum()%>&pageNUM=<%=pageNUM %><%=returnPage%>"><%= bb.getTitle() %> 
	<%
				if(hh>=1){
	%>
					<font size=2 color=red>[<%=hh %>]</font>
	<%
				}
	%>
					</a></td>
					<td><%= bb.getWriter() %></td>
					<td><%= bb.getWdate() %></td>
					<td style="color:#ff6600"><%= bb.getCount() %></td>
					<td>
	<%
				if(bb.getCategory().equals("이용후기")){
					int s=1 ; 
					for(s=1; s<=bb.getRate(); s++){						
	%>
						<div id=star1></div>
	<%
					}
					for(int k =0; k<=5-s; k++){
	%>
						<div id=star2></div>
	<%
					}
				}
	%>
					</td>
				</tr>
	<%
			}
		}catch(Exception e){}
	%>
			</table>
			<div id="guest_page">
	<%
		if(startPage>pageSize){
			out.print("<a href='G_guest.do?pageNUM="+(startPage-pageSize)+"'>◀ 이전</a>&nbsp;");
		}
		for(int i=startPage; i<(startPage+pageSize); i++){
			if(i==pageNUM){ out.println("<font color=#6e6464>["+i+"]</font>&nbsp;");
			}else{
				out.print("<a href='G_guest.do?pageNUM="+i+returnPage+"'>"+i+"</a>&nbsp;");
			}
			if(i>=pageCount) break;
		}
		if(startPage+pageSize<=pageCount){
			out.print("<a href='G_guest.do?pageNUM="+(startPage+pageSize)+"'>다음 ▶</a>");
		}
	%>
			</div>
		</div>			
	<!-- 검색 -->
		<table class="kk">
			<tr align="right">
				<td>
					<form action="G_guest.do">
						<select name="category_type" class="selectpicker">
							<option value="all" selected="selected">전체</option>
							<option value="이용후기">후기</option>
							<option value="자유글">자유글</option>
						</select> 
						<select name="type2" class="selectpicker">
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="all" >제목+내용</option>
						</select> 
						<input type=text name="keyword" class="text"> 
						<input class="board-btn-s" type="submit" value=" 검 색 "> &nbsp;&nbsp;&nbsp;
					</form>						
				</td>
			</tr>
		</table>
		<div align="right">
			<a href='G_guestPreInsert.do' class="bt"><input type='button' value="글쓰기" class="bt">&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</div>
	</div>
</body>
</html>