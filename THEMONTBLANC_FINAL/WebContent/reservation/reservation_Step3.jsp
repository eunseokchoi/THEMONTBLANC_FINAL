<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>reservation_Step3</title>
</head>
<body>
<div id="reF">
	<div id="re_title2">예약하기</div>
	<!-- 상단 메뉴 -->
	<table id="re_tableF">
		<tr height=50 align="left">
			<td width="35%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step1">Step 1.<br><font size="5">Select info.&Detail</font></a></td>
			<td width="25%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step2">Step 2.<br><font size="5">Check information</font></a></td>
			<td width="40%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step3" style="color:orange;">Step 3.<br><font size="5">Complete Reservation</font></a></td>
		</tr>
	</table>
	<br>
	
	<!-- SNS 공유 버튼 -->
<div class="addthis_toolbox addthis_default_style">
<a class="addthis_button_facebook_like"></a>
<a class="addthis_button_tweet"></a>
<a class="addthis_button_kakao"></a>
<a class="addthis_button_line"></a>

</div>
<script type="text/javascript">var addthis_config = {"data_track_clickback":true};</script>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=viralizate"></script>
	<!-- SNS 공유 버튼 -->

<%
if(session.getAttribute("NowUser")!=null){
%>	
	<div align=center style="margin-top:100px;">
		<font size=3 color=orange ><b> 예약에 성공 하였습니다. </b></font><br>
		<a href='revStep3.do?&id=<%=(String)session.getAttribute("NowUser") %>'><input type=button value="확인" class="bt2"></a> 
	
	</div>
<%	
}else{
%>
	<div align=center style="margin-top:200px;">
		<font size=3 color=orange ><b>예약에 실패하였습니다.</b></font> <br>
		<a href='./index.jsp?page=reservation/m_reservation&list=reservation_Step1'><input type=button value="예약 다시하기" class="bt2"></a> 	
	</div>
<%
}
%>
</div>	
</body>
</html>