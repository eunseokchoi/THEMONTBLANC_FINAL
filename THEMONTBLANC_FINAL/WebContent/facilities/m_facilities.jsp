<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>m_facilities.jsp</title>
<link rel="stylesheet" type="text/css" href="facilities/css/facilities.css">
</head>
<body id="fa_center">
<div id="fa_title"> 
	<div class="fa_titleB">
		<span style="font-size:1.5em; padding-right:10px;">FACILITIES</span>
		<span>다양한 시설을 이용하실 수 있습니다.</span>
	</div>
</div>
<div id="wrap">
<div id="fa_left">
	<ul>
		<li><a href="./index.jsp?page=facilities/m_facilities&list=banquet">Banquet</a></li>
		<li><a href="./index.jsp?page=facilities/m_facilities&list=wedding">Wedding</a></li>
		<li><a href="./index.jsp?page=facilities/m_facilities&list=fitness">Fitness</a></li>
		<li><a href="./index.jsp?page=facilities/m_facilities&list=dining">Dining</a></li>
	</ul>
</div>
<div id="fa_section">
	<% 
	String pageFile=request.getParameter("page") ;
	String listFile=request.getParameter("list") ;
	if(listFile.equals("banquet")){
		pageFile="banquet";
	}else if(listFile.equals("fitness")){
		pageFile="fitness";
	}else if(listFile.equals("wedding")){
		pageFile="wedding";
	}else if(listFile.equals("dining")){
		pageFile="dining";
	}

	if(listFile.equals("banquet") ){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("fitness")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("wedding")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("dining")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% } %>
</div>
</div>
</body>
</html>