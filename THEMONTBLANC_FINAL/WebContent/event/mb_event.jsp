<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.DBbean" %>
<%@ page import="net.hb.mvc.LoginController" %>

<%!
	private int pageNum;
	private int startpage;
	private int endpage;
	private int pagesize;
	private int pagecount;
	private int start;
	private int limit = 3;
	private int end;
	private int num;
	private int total;
	private String pageType;
	private String type;
	private String id;
	
%> 
<html>
<head>
<title>event.jsp</title>
  <link rel="stylesheet" type="text/css" href="event/css/event.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
</head>
<body>

	<%
		pageType=(String)request.getAttribute("pageType");
		type = (String) request.getAttribute("type");
		startpage = (Integer) request.getAttribute("startpage");
		endpage = (Integer) request.getAttribute("endpage");
		pagecount = (Integer) request.getAttribute("pagecount");
		pagesize = (Integer) request.getAttribute("pagesize");
		start = (Integer) request.getAttribute("start");
		end = (Integer) request.getAttribute("end");
		total = (Integer) request.getAttribute("total");
		num = Integer.parseInt((String) request.getAttribute("Dnum"));
		type = (String) request.getAttribute("type");
		id = (String)session.getAttribute("NowUser");
		pageNum = (Integer) request.getAttribute("pageNum");
			
	%>

<div id="eventF">
	<div id="eventF2">
	
	<%
		if(type.equals("guest")){
	%>

	<%
		}else{
	%>
		<a href="mb_event.do?&pageType=now&type=admin"><button type="submit" class='nowEbtn'>진행이벤트</button></a>
		<a href="mb_event.do?&pageType=past&type=admin"><button type="submit" class='pastEbtn'>종료이벤트</button></a>
	<%
		}
	%>
	<br>
<%

try{	
	int rownum = total-((pageNum-1)*limit);
	List detail = (List) request.getAttribute("detail");
	if(num>0){
	for(int i=0; i<detail.size(); i++){
		DBbean bean = (DBbean)detail.get(i);
%>
		<!-- 이벤트 상세 -->
		<br>
		<table id="event_tableF">
			<tr class="event_tableB">
				<td width=8% align="center" >NO</td>
				<td width=60% align="center">TITLE</td> 
				<td width=24% align="center">DATE</td> 
				<td width=8% align="center">HIT</td>
			</tr>
			<tr>
				<td align="center"><%= rownum %></td>
				<td><%= bean.getTitle() %></td>
				<td align="center"><%= bean.getE_start() %> ~ <br><%= bean.getE_end() %></td>
				<td align="center"><%= bean.getHit() %></td>

			</tr>
		</table>
		
		<div id="event_contentsImg">
			<img src="<%= request.getContextPath() %>/event/files/<%= bean.getMbevent_main() %>"><br><br>	
		<div id="event_contents">
			<div id="event_contentsS"><%= bean.getContent() %>
		</div>
		<br>

	<%
		if(type.equals("admin")){
	%>	
		<form name="modify" method='post' action=./mb_eventPreModify.do?num=<%=bean.getNum() %>>
			<button type="submit" class='EModifybtn'>수정</button>
		</form>
		
		<script type="text/javascript">
   
     	function eventDelete(){
       		if(confirm("삭제하시겠습니까?")==true){
       			document.delete.action="./mb_eventDelete.do?num=<%=bean.getNum()%>";
       			}else{
       				return;
       				}
       		}
     	
     	</script>
   
      <form name="delete" method='post'>
         <button type="submit" class='EDeletebtn' onclick="eventDelete();" >삭제</button>
      </form>

	<%
		}
	%>
		</div>
		
<% 		
		}//for end
	}//if end
}catch(Exception ex){}
	
%>	
	
	<!-- 이벤트 리스트 -->
	<%
		if(pageType.equals("now")){
	%>
		<div id="event_total" align="left">진행이벤트 (<%= total %>)</div>
	<%
		}else{
	%>
		<div id="event_total" align="left">종료이벤트 (<%= total %>)</div>
	<%
		}
	%>
		<table id="event_tableF">

			<tr id="event_tableF">
				<td width=8%>NO</td>
				<td width=60%>TITLE</td> 
				<td width=24%>DATE</td> 
				<td width=8%>HIT</td>
			</tr>
		<%

		List data = (List) request.getAttribute("list");
		try{
			int rownum = total-((pageNum-1)*limit);
			for(int i=0; i<data.size(); i++){
				DBbean bean = (DBbean)data.get(i) ;
				if(type.equals("admin")){
					
		%>
			<tr>
				<td ><%= rownum-- %></td>
				<td align="left">
				<a href='mb_event.do?num=<%= bean.getNum() %>&type=admin'>
				<img src ="<%=request.getContextPath()%>/event/files/<%= bean.getMbevent_thumb() %>" ><br><br>
				<%= bean.getTitle() %></td>
				<td><%= bean.getE_start() %> ~ <br><br><%= bean.getE_end() %></td> 
				<td><%= bean.getHit() %></td>
			</tr>
		<% 		
				}else{
		%>
			<tr>
				<td><%= rownum-- %></td>
				<td align="left">
				<a href='mb_event.do?num=<%= bean.getNum() %>&type=guest'>
				<img src ="<%=request.getContextPath()%>/event/files/<%= bean.getMbevent_thumb() %>" ><br><br>
				<%= bean.getTitle() %></td>
				<td><%= bean.getE_start() %> ~ <br><br><%= bean.getE_end() %></td> 
				<td><%= bean.getHit() %></td>
			</tr>
		<%		
				}
			}//for end
			
		}catch(Exception ex){System.out.println(ex.toString());}

		%>	
		</table>
	<!-- 페이징 -->		
		<div id="event_page">
			<%	
			if(type.equals("admin")){
				if(startpage > pagesize){
					out.println("<a href='mb_event.do?pageType=" + pageType + "&type=admin" + "&pageNum=" + (startpage - pagesize) + "'>[이전]</a>");
				}
			
				for (int i=startpage; i < (startpage + pagesize); i++ ){
					if(i==pageNum){
						out.println("<font color=#6e6464>[" + i + "]</font>");
					}else{
						out.println("<a href='mb_event.do?pageType=" + pageType + "&type=admin" + "&pageNum=" + i + "'>[" + i + "]</a>");
					}
					if(i>=pagecount) break;
				}
				
				if( pagesize <= pagecount - startpage ){
					out.println("<a href='mb_event.do?pageType=" + pageType + "&type=admin" + "&pageNum=" + (startpage + limit) + "'>[다음]</a>");
				}	
				
			}else{
				if(startpage > pagesize){
					out.println("<a href='mb_event.do?pageType=" + pageType + "&type=guest" + "&pageNum=" + (startpage - pagesize) + "'>[이전]</a>");
				}
			
				for (int i=startpage; i < (startpage + pagesize); i++ ){
					if(i==pageNum){
						out.println("<font color=#6e6464>[" + i + "]</font>");
					}else{
						out.println("<a href='mb_event.do?pageType=" + pageType + "&type=guest" + "&pageNum=" + i + "'>[" + i + "]</a>");
					}
					if(i>=pagecount) break;
				}
				
				if( pagesize <= pagecount - startpage ){
					out.println("<a href='mb_event.do?pageType=" + pageType + "&type=guest" + "&pageNum=" + (startpage + limit) + "'>[다음]</a>");	
				}
			}
			%>
		</div>
	</div>	
	<br>
	<%
		if(type.equals("admin")){
	%>
	<form name=insert method='post' action=./index.jsp?page=admin/m_admin&list=eventInsert>
		<div id ="InsertBtn" align="center" >
			<button type="submit" class='EInsertbtn'>등록</button>
		</div>
	<%
		}//if end
	%>
	</form>
</div>	
</div>
</body>
</html>