<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>m_event.jsp</title>
<link rel="stylesheet" type="text/css" href="event/css/event.css">
</head>
<body id="event_center">

<div id="event_title"> 
	<div class="event_titleB">
		<span style="font-size:1.5em; padding-right:10px;">EVENT</span>
		<span>다양한 이벤트를 즐기세요.</span>
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
	if(listFile.equals("event")){
		pageFile="/event/mb_event";	
	}else{
		pageFile="/notice/G_notice";
	}
	
	if(listFile.equals("event") ){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% } %>
</div>
</div>
</body>
</html>