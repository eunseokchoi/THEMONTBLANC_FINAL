<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.DBbean" %>
<html>
<head>
<title>requestList</title>
<link rel="stylesheet" type="text/css" href="guest/css/faq.css">
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<%!
	private int pageSize = 5; 	// [1][2][3]~~[10]	 단위
	private int limit = 5; 	//1~10 단위
	private String pnum;		//request.getParameter("pageNUM") 문자열을 받기 때문에
	private int pageNUM;		//이건 숫자
	private int pageCount;		//총 페이지의 수 900/10 -> 90
	private int startPage;		//[이전][1][2][3]~~~[다음]
	private int total;
	private String sval;
	private String skey;
	private String returnPage;	
%>	
</head>
<body>
<%
try{
	total = (Integer)request.getAttribute("total");
	pageCount = (Integer)request.getAttribute("pageCount");
	startPage = (Integer)request.getAttribute("startPage");
	skey = String.valueOf(request.getAttribute("skey"));
	sval = String.valueOf(request.getAttribute("sval"));	
	pageNUM = (Integer)request.getAttribute("pageNUM");
	returnPage = String.valueOf(request.getAttribute("returnPage"));
	
%>	
<div id="adminF">
	<div id="adminF2">
		<div id="admin_title2">문의사항</div>
		<div id="admin_total">전체글 (<%=total %>)</div>
		<table id="admin_tableF">
			<tr class="admin_tableB">			
				<td width=10%>GROUP</td>
				<td width=30%>TITLE</td>
				<td width=10%>NAME</td>
				<td width=15%>TEL</td>
				<td width=15%>MAIL</td>
				<td width=10%>DATE</td>
			</tr>
			<%				
				List data=(List)request.getAttribute("list");
				for(int i=0; i<data.size(); i++){
					DBbean bean =(DBbean)data.get(i);
			%>		
			<tr onMouseOver="style.backgroundColor='#ebe7e7'" onMouseOut="style.backgroundColor=''">
				<td><%=bean.getQselect()%></td>
				<td align="left"><a class="reselect" href="requestDetail.do?num=<%=bean.getQno()%>"><%=bean.getQtitle()%></a></td>
				<td><%= bean.getQname() %></td>
				<td><%= bean.getQtel() %></td>
				<td><%= bean.getQemail() %></td>
				<td><%= bean.getNalja()%></td>
			</tr>
				<%
				}//for end
				%>
		</table>
		<div id="admin_page">
			<% 		
			if(startPage>pageSize){
				out.println("<a href='request.do?pageNUM="+(startPage-pageSize)+returnPage+"'>◀ 이전</a>&nbsp;");
			}
			for(int i=startPage; i<(startPage+pageSize); i++){
				if(i==pageNUM){out.println("<font color=#6e6464>["+i+"]</font>&nbsp;");}
				else{
					out.println("<a href='request.do?pageNUM="+i+returnPage+"'>"+i+"</a>&nbsp;");
				}
			if(i>=pageCount) break; 	
			}//for end
			if(startPage+pageSize<=pageCount){
				out.println("<a href='request.do?&pageNUM="+(startPage+pageSize)+returnPage+"'>다음 ▶</a>");
			}
		} catch (Exception ex) {ex.toString(); }
		%>		
		</div>
	</div>
	<!-- 검색 -->
	<form action=request.do>
		<select name=keyfield class="ta">
			<option value=qselect>그룹</option>
			<option value=qname>작성자</option>
		</select>
		<input type=text name=keyword class="ta2">
		<input type=submit value=검색 class="bt">
	</form>
</div>
</body>
</html>