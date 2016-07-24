<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="mont.blanc.common.*"%>
<%!
private String checkIn;
private String checkOut;
private List revOkRoom;
private List revOkType;
private int revPop;
private int revCap;
private int room;
private String roomType;
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="reservation/css/reservation.css">

<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="/THEMONTBLANC_FINAL/reservation/engine1/style.css" />
<script type="text/javascript" src="/THEMONTBLANC_FINAL/reservation/engine1/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->

<!-- 날짜선택 J Query IMPORT-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- 날짜선택 J Query IMPORT 종료-->

<script type="text/javascript">
	
	/* 날짜선택 J Query SCRIPT */
	
	$(function() {
		
	  $( "#datepicker" ).datepicker({
		  
	       }); 
		
      $('#from').datepicker({
        numberOfMonths: 2, 
        firstDay: 0,
            dateFormat: 'yy/mm/dd', 
            minDate: '0', 
            maxDate: '+6M',
            onSelect: function(dateStr) {
                        var min = $(this).datepicker('getDate');
                        $('#to').datepicker('option', 'minDate', min || '0');
                        datepicked();
            }});
      
      $('#to').datepicker({
        numberOfMonths: 2, 
        firstDay: 0,
            dateFormat: 'yy/mm/dd', 
            minDate: '0', 
            maxDate: '+6M',
                  onSelect: function(dateStr) {
                        var max = $(this).datepicker('getDate');
                        $('#from').datepicker('option', 'maxDate', max || '+6M');
                        datepicked();                                                
            }});
      //calendar게스트값 step1으로         
      $("select[name=Guests] option[value=<%=request.getParameter("Guests")%>]").attr("selected",true);          
      //캘린더 이미지 css속성주기
      $("img.ui-datepicker-trigger").attr("style", "margin-left:2px; vertical-align:middle; cursor: Pointer;");    
      $("#ui-datepicker-div").attr("style", "z-index:9999 !important");
	});
  
		var datepicked = function() {
		 var from = $('#from');
		    var to = $('#to');
		    var nights = $('#nights');
		 
		     var fromDate = from.datepicker('getDate')
		 
		        var toDate = to.datepicker('getDate')
		 
		        if (toDate && fromDate) {
		        var difference = 0;
		            var oneDay = 1000*60*60*24; 
		            var difference = Math.ceil((toDate.getTime() - fromDate.getTime()) / oneDay); 
		            nights.val(difference);
		            }}

	/* 날짜선택 J Query SCRIPT 종료 */
	
	</script>
	</head>
	<body>
	<div id="reF">
		<div id="re_title2">예약하기</div>
		<!-- 상단 메뉴 -->
		<table id="re_tableF">
			<tr height=50 align="left">
				<td width="35%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step1" 
				style="color:orange;">Step 1.<br><font size="5">Select info.& Detail</font></a></td>
				<td width="25%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step2">Step 2.<br>
				<font size="5">Check information</font></a></td>
				<td width="40%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step3">Step 3.<br>
				<font size="5">Complete Reservation</font></a></td>
			</tr>
		</table>	
		<!-- SELECT INFORMATION -->
		<form name=R_Select method=get action=revStep1.do>
			<table id="re_tableF2">
			<tr>
				<td width="60%" class="re_tableF2_td">
					<div id="datepicker"></div>
				</td>
				
				<td width="40%" class="re_tableF2_td">
					<span>1. SELECT INFO.</span><br><br>
				  	<ul>
						
						<li class="re_tableF2_li">Check IN</li>							
						<li><input type="text" id="from" name="from" value="<%
							if((String)request.getAttribute("checkIn") != null){
								%><%=(String)request.getAttribute("checkIn") %><%
								} %>" class="ta2"></li>
						<li class="re_tableF2_li">Check OUT</li>
						<li><input type="text" id="to" name="to" value="<% 
							if((String)request.getAttribute("checkOut") != null){
								%><%=(String)request.getAttribute("checkOut") %><%
								} %>" class="ta2"></li>
						<li class="re_tableF2_li">No. Of Nights</li>
						<li><input type="text" id="nights" name="nights" value="<% 
							if((Integer)request.getAttribute("revPop") != null){
								%><%=(Integer)request.getAttribute("revPop") %><%
								} %>" readonly="readonly" class="ta2"></li>
						
						<li class="re_tableF2_li">No. Of Guests</li>
						<li><select name="Guests" class="ta3">										
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>							
							</select>
							<input type="submit" value="예약진행" class="bt2">
						</li>	
					</ul>	
				</td>
			</tr>
		</table>
	</form>
		<!-- SELECT INFORMATION END-->
	<%
	if(request.getAttribute("checkflag") == null)
	{	
		try{	
			String ok = (String)request.getAttribute("ok");
			if(ok.equals("noData")){
	%>
		<div align=center style="margin-top:200px;">
			<font size=3 color=orange >
				<b>죄송하지만, 귀하께서 선택하신 날짜에 예약가능한 방이 없습니다.<br>
					날짜를 변경하여 다시 검색해 주시기를 바랍니다.
					저희 몽블랑호텔을 이용해 주셔서 대단히 감사합니다.
				</b>
			</font><br>
			<a href='./index.jsp?page=reservation/m_reservation&list=reservation_Step1'>
			<input type=button value="예약 다시하기" class="bt2"></a> 	
		</div>
	<%
		}//if
		else {
		revOkRoom = (List)request.getAttribute("revOkRoom");
		revOkType = (List)request.getAttribute("revOkType");
		checkIn = (String)request.getAttribute("checkIn");
		checkOut = (String)request.getAttribute("checkOut");
		revPop = (Integer)request.getAttribute("revPop");
		revCap = (Integer)request.getAttribute("revCap");
	%>	
	<table id="re_tableF2">
		<tr>
		<td  class="re_tableF2_td"><span>2. SELECT ROOM</span></td>
		</tr>
	</table>
	<%
		for(int i=0 ; i<revOkType.size() ; i++) {	
			DBbean bean = (DBbean)revOkType.get(i);
			  String thumb = bean.getRoomThumb();
			  String type = bean.getRoomType() ;
			  int roomId = bean.getRoomID();
			  int Cost = bean.getRoomCost();
			  int Cap = bean.getRoomCap();
			  String info1 = bean.getRoomInfo1().replaceAll("\r\n", "<br>");
			  String info2 = bean.getRoomInfo2().replaceAll("\r\n", "<br>");
			  String info3 = bean.getRoomInfo3().replaceAll("\r\n", "<br>");
			  String CommaCost=String.format("%,d",Cost);//금액 콤마삽입
			
			  if(revCap<=Cap){ //선택한 인원수보다 같거나 큰방만 출력
	%>
	
		<table id="re_tableF3">
			<tr>
	<!-- Start WOWSlider.com BODY section -->
	<div id="wowslider-container1">
	<div class="ws_images"><ul>
			<li><img src="/THEMONTBLANC_FINAL/reservation/data1/images/<%=type%>1.jpg" alt="<%=type%>" title="<%=type%>" id="wows1_0"/></li>
			<li><img src="/THEMONTBLANC_FINAL/reservation/data1/images/<%=type%>2.jpg" alt="<%=type%>" title="<%=type%>" id="wows1_1"/></li>
			<li><a href="http://wowslider.com"><img src="/THEMONTBLANC_FINAL/reservation/data1/images/<%=type%>3.jpg" 
			alt="http://wowslider.com/" title="<%=type%>" id="wows1_2"/></a></li>
			<li><img src="/THEMONTBLANC_FINAL/reservation/data1/images/<%=type%>4.jpg" alt="<%=type%>" title="<%=type%>" id="wows1_3"/></li>
		</ul></div>
		<div class="ws_bullets"><div>
			<a href="#" title="<%=type%>"><span><img src="/THEMONTBLANC_FINAL/reservation/data1/tooltips/<%=type%>1.jpg" 
			alt="<%=type%>"/>1</span></a>
			<a href="#" title="<%=type%>"><span><img src="/THEMONTBLANC_FINAL/reservation/data1/tooltips/<%=type%>2.jpg" 
			alt="<%=type%>"/>2</span></a>
			<a href="#" title="<%=type%>"><span><img src="/THEMONTBLANC_FINAL/reservation/data1/tooltips/<%=type%>3.jpg" 
			alt="<%=type%>"/>3</span></a>
			<a href="#" title="<%=type%>"><span><img src="/THEMONTBLANC_FINAL/reservation/data1/tooltips/<%=type%>4.jpg" 
			alt="<%=type%>"/>4</span></a>
		</div></div><div class="ws_script" style="position:absolute;left:-99%"><a href="http://www.naver.com">http://wowslider.net/</a> 
		by WOWSlider.com v8.7</div>
	<div class="ws_shadow"></div>
	</div>	
	
				
				<td width="50%" class="re_tableF3_td1">
					<ul>
						<li><font color="#6e6464;" size="6"><%=type%></font></li>
						<li>호실 : <%=roomId%>호</li>
						<li>가격 : <%=CommaCost%>원</li>
						<li>수용인원 : <%=Cap%>인</li>		
						<li><a href='index.jsp?page=reservation/m_reservation&list=reservation_Step2
						&roomID=<%=bean.getRoomID()%>&in=<%=checkIn%>&out=<%=checkOut%>&revPop=<%=revPop%>
						&roomCost=<%=Cost%>&revCap=<%=revCap%>&Type=<%=type%>' >
						<input type=button value="객실 선택" class="bt2"></a></li>			
					</ul>
				</td>
			</tr>
			<tr>	
				<td colspan="2" class="re_tableF3_td2"><p><%=info1%><%=info2%><%=info3%></p></td>
			</tr>
		</table>
		<br>	
		<hr>
	<%
				}//if end
			}//for end
		}//else end
	}catch(Exception ex){System.out.println("표현식 오류 : "+ex.toString());}
		
	}//if end
	%>
		
	</div>
	<script type="text/javascript" src="/THEMONTBLANC_FINAL/reservation/engine1/wowslider.js"></script>
	<script type="text/javascript" src="/THEMONTBLANC_FINAL/reservation/engine1/script.js"></script>
	<!-- End WOWSlider.com BODY section -->
</body>
</html>