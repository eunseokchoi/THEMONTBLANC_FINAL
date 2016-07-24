<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.*" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="reservation/css/reservation.css">
</head>
<body id="re_center">
	<div id="re_title"> 
		<div class="re_titleB">
			<span style="font-size:1.5em; padding-right:10px;">RESERVATION</span>
			<span>예약 게시판입니다.</span>
		</div>
	</div>
	<div id="wrap">
		<div id="re_left">
		<ul>
			<li><a class="current-demo" href="./index.jsp?page=reservation/m_reservation&list=reservation_Step1">예약하기</a></li>
	<%
		String id = (String)session.getAttribute("NowUser");
		if(id!=null){
	%>		
		<li><a href='revStep3.do?&id=<%=id %>'>예약확인</a></li>
	<%
		}else{
	%>			
		<li><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Check">예약확인</a></li>		
	<%
		}
	%>	
		</ul>
		</div>
		<div id="re_section">
			<% 
				String pageFile=request.getParameter("page") ;
				String listFile=request.getParameter("list") ;
				if(listFile.equals("reservation_Step1")){
					pageFile="reservation_Step1";
				}else if(listFile.equals("reservation_Step2")){
					pageFile="reservation_Step2";
				}else if(listFile.equals("reservation_Step3")){
					pageFile="reservation_Step3";
				}else if(listFile.equals("reservation_Check")){
					pageFile="reservation_Check";
				}else if(listFile.equals("reservation_Delete")){
					pageFile="reservation_Delete";
				}
		
				if(listFile.equals("reservation_Step1") ){
			%>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<%
				}else if(listFile.equals("reservation_Step2")){
			%>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<%
				}else if(listFile.equals("reservation_Step3")){
			%>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<%
				}else if(listFile.equals("reservation_Check")){
			%>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<%
				}else if(listFile.equals("reservation_Delete")){
			%>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<%
				}
			%>
		</div>	
	</div>
</body>
</html>