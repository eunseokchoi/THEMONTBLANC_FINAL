<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>m_qna</title>
<link rel="stylesheet" type="text/css" href="qna/css/qna.css">
</head>
<body id="qna_center">
<div id="qna_title"> 
	<div class="qna_titleB">
		<span style="font-size:1.5em; padding-right:10px;">Q&A</span>
		<span>질문 게시판입니다.</span>
	</div>
</div>
<div id="wrap">
<div id="qna_left">
	<ul>
		<li><a href="./index.jsp?page=qna/m_qna&list=qna">Q&A</a></li>
		<li><a href="./index.jsp?page=qna/m_qna&list=G_requestInsert">Request</a></li>
	</ul>
</div>
<div id="qna_section">
	<% 
	String pageFile=request.getParameter("page") ;
	String listFile=request.getParameter("list") ;
	if(listFile.equals("qna")){
		pageFile="qna";
	}else if(listFile.equals("G_requestInsert")){
		pageFile="G_requestInsert";
	}
	
	if(listFile.equals("qna") ){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("G_requestInsert")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% } %>
</div>
</div>
</body>
</html>