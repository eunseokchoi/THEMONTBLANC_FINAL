<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="info/css/montblanc.css">
</head>
<body id="montblanc_center">
	<div id="montblanc_title"> 
		<div class="montblanc_titleB">
			<span style="font-size:1.5em; padding-right:10px;">THE MONT BLANC</span>
		</div>
	</div>
	<div id="wrap">
		<div id="mjhotle_left">
			<ul>
				<li><a href="./index.jsp?page=info/info_menu&list=about">About</a></li>
				<li><a href="./index.jsp?page=info/info_menu&list=award">Awards</a></li>
				<li><a href="./index.jsp?page=info/info_menu&list=findhotel">Find a Hotel</a></li>
			</ul>
		</div>
		<div id="montblanc_section">
			<% 
			String pageFile=request.getParameter("page") ;
			String listFile=request.getParameter("list") ;
			if(listFile.equals("about")){
				pageFile="about";
			}else if(listFile.equals("award")){
				pageFile="award";
			}else if(listFile.equals("findhotel")){
				pageFile="findhotel";
			}else if(listFile.equals("G_notice")){
				pageFile="G_notice";
			}else if(listFile.equals("G_noticeDetail")){
				pageFile="G_noticeDetail";
			}else if(listFile.equals("organization")){
				pageFile="organization";
			}
		
			if(listFile.equals("about") ){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("award")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("findhotel")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("G_notice")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("G_noticeDetail")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("organization")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% } %>
		</div>
	</div>
</body>
</html>