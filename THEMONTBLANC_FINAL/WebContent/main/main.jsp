<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>main</title>
</head>
<body onload="popup(),popup2()">
	<!-- 슬라이드 -->
    <div>
		<jsp:include page="slide.jsp" flush="false" /> 
    </div>
	<!-- 예약 --> 
	<div style="margin-top:10px;">    
		<jsp:include page="calendar.jsp" flush="false" />
	</div>
	<!-- 공지사항 -->	
	<div class="center2">
		<ul>
			<li class=center2F><jsp:include page="tab.jsp" flush="false" /></li>		
			<li class=center2F><jsp:include page="mainEvent.jsp" flush="false" /></li>
		</ul>
	</div>		
</body>
</html>