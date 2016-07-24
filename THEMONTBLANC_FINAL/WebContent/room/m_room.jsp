<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>m_room</title>
<link rel="stylesheet" type="text/css" href="room/css/room.css">
</head>
<body id="room_center">
<div id="room_title"> 
	<div class="room_titleB">
		<span style="font-size:1.5em; padding-right:10px;">ROOM</span>
	</div>
</div>
<div id="wrap">
<div id="room_left">
	<ul>
		<li><a href="./index.jsp?page=room/m_room&list=standard">Standard</a></li>
		<li><a href="./index.jsp?page=room/m_room&list=deluxe">Deluxe</a></li>
		<li><a href="./index.jsp?page=room/m_room&list=suite">Suite</a></li>
	</ul>
</div>
<div id="room_section">
	<% 
	String pageFile=request.getParameter("page") ;
	String listFile=request.getParameter("list") ;
	if(listFile.equals("standard")){
		pageFile="standard";
	}else if(listFile.equals("deluxe")){
		pageFile="deluxe";
	}else if(listFile.equals("suite")){
		pageFile="suite";
	}else if(listFile.equals("roomlist")){
		pageFile="roomlist";
	}else if(listFile.equals("informroom")){
		pageFile="informroom";
	}
	
	if(listFile.equals("standard") ){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("deluxe")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("suite")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("roomlist")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("informroom")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% } %>
	
</div>
</div>
</html>