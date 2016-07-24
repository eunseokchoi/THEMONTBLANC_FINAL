<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page session="true"%>
<html>
<head>
<title>reservation_Step2</title>

<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="/THEMONTBLANC_FINAL/reservation/engine2/style.css" />
<script type="text/javascript" src="/THEMONTBLANC_FINAL/reservation/engine2/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->

	<%
	String Room_ID = request.getParameter("roomID");
	String C_IN = request.getParameter("in");
	String C_OUT = request.getParameter("out");
	String No_Of_Nights = request.getParameter("revPop");
	String Type=request.getParameter("Type");
	String revCap = request.getParameter("revCap");
	String Cost = request.getParameter("roomCost");
	
	int SumOfCost=Integer.parseInt(request.getParameter("revPop"))*
				  Integer.parseInt(request.getParameter("roomCost"));
	String CommaSum=String.format("%,d",SumOfCost);// 천단위 콤마
	
	%>	
	</head>
	<div id="reF">
		<div id="re_title2">예약하기</div>
		<!-- 상단 메뉴 -->
		<table id="re_tableF">
			<tr height=50 align="left">
				<td width="35%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step1">Step 1.<br><font size="5">Select info.& Detail</font></a></td>
				<td width="25%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step2" style="color:orange;">Step 2.<br><font size="5">Check information</font></a></td>
				<td width="40%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step3">Step 3.<br><font size="5">Complete Reservation</font></a></td>
			</tr>
		</table>
	<script type="text/javascript">			
		function info(){	
			alert("로그인 후 이용하시기 바랍니다."); 			
		}
	</script>
	<%
	if(session.getAttribute("NowUser")==null){
	%>
	</div>
	<body onLoad="info()">
	<%
	  } else { String id=(String)session.getAttribute("NowUser"); 
	%>
	<br>
	
		<table id="re_tableF4">
  		
  		<tr>
  			<td width="100%"> 
  			
		<!-- Start WOWSlider.com BODY section -->
		<div id="wowslider-container2">
		<div class="ws_images"><ul>
				<li><img src="/THEMONTBLANC_FINAL/reservation/data2/images/<%=Type%>1.jpg" 
					alt="<%=Type%>" title="<%=Type%>" id="wows1_0"/></li>
				<li><img src="/THEMONTBLANC_FINAL/reservation/data2/images/<%=Type%>2.jpg" 
					alt="<%=Type%>" title="<%=Type%>" id="wows1_1"/></li>
				<li><a href="http://wowslider.com"><img src="/THEMONTBLANC_FINAL/reservation/data2/images/<%=Type%>3.jpg" 
					alt="wowslideshow" title="<%=Type%>" id="wows1_2"/></a></li>
				<li><img src="/THEMONTBLANC_FINAL/reservation/data2/images/<%=Type%>4.jpg" 
					alt="<%=Type%>" title="<%=Type%>" id="wows1_3"/></li>
			</ul></div>
			<div class="ws_bullets2"><div>
				<a href="#" title="<%=Type%>"><span><img src="/THEMONTBLANC_FINAL/reservation/data2/tooltips/<%=Type%>1.jpg" 
					alt="<%=Type%>"/>1</span></a>
				<a href="#" title="<%=Type%>"><span><img src="/THEMONTBLANC_FINAL/reservation/data2/tooltips/<%=Type%>2.jpg"
					alt="<%=Type%>"/>2</span></a>
				<a href="#" title="<%=Type%>"><span><img src="/THEMONTBLANC_FINAL/reservation/data2/tooltips/<%=Type%>3.jpg"
					alt="<%=Type%>"/>3</span></a>
				<a href="#" title="<%=Type%>"><span><img src="/THEMONTBLANC_FINAL/reservation/data2/tooltips/<%=Type%>4.jpg"
					alt="<%=Type%>"/>4</span></a>
			</div></div><div class="ws_script" style="position:absolute;left:-99%"><a href="http://wowslider.net">http://wowslider.net/
			</a> by WOWSlider.com v8.7</div>
		<div class="ws_shadow"></div>
		</div>	
		</td>
  		</tr>
  		<tr>
  			<td colspan="2"><div class="ta4"><%=id %> 님의 예약 정보는 아래와 같습니다.</div></td>
  		</tr>
  		<tr><td class="re_tableF4_td1">Check-IN: &nbsp;&nbsp; <%= C_IN %></td></tr>
  		<tr><td class="re_tableF4_td1">Check-OUT: &nbsp;&nbsp; <%= C_OUT %></td></tr>
  		<tr><td class="re_tableF4_td1">No.Of.Nights:&nbsp;&nbsp;<%= No_Of_Nights %>박</td></tr>
  		<tr><td class="re_tableF4_td1">No.Of.Guests:&nbsp;&nbsp;<%= revCap %>인</td></tr>
  		<tr><td class="re_tableF4_td1">Room No:&nbsp;&nbsp;<%= Room_ID %>호</td></tr>
  		<tr><td class="re_tableF4_td1">Room Type:&nbsp;&nbsp;<%= Type %></td></tr>
  		<tr><td class="re_tableF4_td1">Room Charge:&nbsp;&nbsp;<%=CommaSum%>원</td>
  		</tr>
  	</table>
  	
  	
  	
  	
  	<div align=center style="margin-top:50px;">
	<a href='revStep2.do?revMember=<%=id%>&revRoomID=<%=Room_ID %>&revCost=<%=Cost %>&revCap=<%=revCap %>&in=<%=C_IN%>&out=<%=C_OUT%>&revTerm=<%=No_Of_Nights %>'>
	<input type=button value="최종예약" class="bt2"></a>
	</div>
<%			
  }
%>
		<script type="text/javascript" src="/THEMONTBLANC_FINAL/reservation/engine2/wowslider.js"></script>
		<script type="text/javascript" src="/THEMONTBLANC_FINAL/reservation/engine2/script.js"></script>
		<!-- End WOWSlider.com BODY section -->  		
</body>
</html>