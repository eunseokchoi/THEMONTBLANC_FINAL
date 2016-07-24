<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="event/css/event.css">
</head>
<body id="event_center">
	<div id="event_title"> 
		<div class="event_titleB">
			<span style="font-size:1.5em; padding-right:10px;">NOTICE</span>
			<span>공지사항입니다.</span>
		</div>
	</div>
	<div id="wrap">
		<div id="event_left">
			<ul>
				<li><a href="G_notice.do">NOTICE</a></li>
				<li><a href="mb_event.do?pageType=now&type=guest">EVENT</a></li>
			</ul>
		</div>
		<div id="event_section">
			<% 
			String pageFile=request.getParameter("page") ;
			String listFile=request.getParameter("list") ;
			if(listFile.equals("G_notice")){
				pageFile="G_notice";
			}else if(listFile.equals("G_noticeDetail")){
				pageFile="G_noticeDetail";
			}				
			
			if(listFile.equals("G_notice")){
			%>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<%
				}else if(listFile.equals("G_noticeDetail")){
			%>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<%
				}
			%>
		</div>
	</div>
</body>
</html>