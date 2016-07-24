<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "mont.blanc.common.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
</head>
<body>
	<%
		int year = 1981 ;
		int month = 10 ;
		int day = 24 ;
		int lastDay = 30 ;
		int week = 1 ;
		List roomAll = new ArrayList();
		List revAll = new ArrayList();
		try{
			year = ((Integer)request.getAttribute("setYear")).intValue();
			month = ((Integer)request.getAttribute("setMonth")).intValue();
			day = ((Integer)request.getAttribute("setDay")).intValue();
			lastDay = ((Integer)request.getAttribute("setLastDay")).intValue();
			week = ((Integer)request.getAttribute("setWeek")).intValue();
			roomAll = (List)request.getAttribute("roomAll") ;
			revAll = (List)request.getAttribute("revAll") ;
		
		}catch(Exception ex){System.out.println("reservation.jsp : "+ex.toString());}
	%>
	<div id=adminF>
		<div id=adminF2>
		<div id="admin_title2">예약 캘린더</div>
		<table id=admin_tableF>
			<tr class="admin_tableB">
				<td align="center">
					<a href="revCal.do?setYear=<%=year-1%>&setMonth=<%=month%>&setDay=<%=day%>"><font color="#FFF">◀ </font></a> 
					<b><%=year%>년</b>
					<a href="revCal.do?setYear=<%=year+1%>&setMonth=<%=month%>&setDay=<%=day%>"><font color="#FFF"> ▶</font></a>
					&nbsp;&nbsp;
					<a href="revCal.do?setMonth=<%=month-1%>&setYear=<%=year%>&setDay=<%=day%>"><font color="#FFF">◀ </font></a>
					<b><%=month+1%>월</b>
					<a href="revCal.do?setMonth=<%=month+1%>&setYear=<%=year%>&setDay=<%=day%>"><font color="#FFF"> ▶</font></a>
				</td>
			</tr>
		</table>	
		<table id=admin_tableF>
			<tr>
				<td class="cal7" colspan="2"><a href="revBoard.do"><input type="button" value=예약관리 class="bt2"></a></td>
					<%
					for(int z=1 ; z<=lastDay ; z++){
						if (z==day) {				
					%>	
						<td class="cal6"><b><%=z %></b></td>
					<%
						}
						else {				
							%>	
								<td class="cal7"><b><%=z %></b></td>
							<%
						}
					}
					%>
			</tr>
			<tr>
				<td class="roomtd"><b>Type</b></td>
				<td class="roomtd2"><b>Room</b></td>
					<%
					int w = week ;
					int i = 1 ;
					String wk = "" ;
					try{
						while(i <= lastDay) {				
							switch(w){
								case 1 : wk = "일" ; break ;
								case 2 : wk = "월" ; break ;
								case 3 : wk = "화" ; break ;
								case 4 : wk = "수" ; break ;
								case 5 : wk = "목" ; break ;
								case 6 : wk = "금" ; break ;
								case 7 : wk = "토" ; break ;			
							}					
										
							if(w==7) {
								%>	
								<td class="cal4"><b><%=wk %></b></td>
								<%
							}else if(w==1){
								%>	
								<td class="cal5"><b><%=wk %></b></td>
								<%
							}else {		
								%>	
								<td class="cal3"><b><%=wk %></b></td>
								<%
							}
							w++ ;
							if(w==8){w=1 ;}
							i++ ;
						}
					}catch(Exception ex){System.out.println("calendar : "+ex.toString());}		
					%>
			</tr>
		</table>
		<table id=admin_tableFMove2>
			<tr class="cal9"><td colspan="33"></td></tr>
			<%
			String roomType ;
			int roomID ;	
			int revRoomID ;
			
			try{
				for(int x=0 ; x<roomAll.size() ; x++){
					DBbean bean = (DBbean)roomAll.get(x) ;							
					roomType = bean.getRoomType() ;
					roomID = bean.getRoomID() ;
				%>	
				<tr>
					<td class="roomtd_move" style=" background:#ebe5e5;"><b><%=roomType%></b></td>
					<td class="roomtd2_move" style="border-right:1px solid #6e6464; background:#ebe5e5;"><b><font color="#AAA"><%=roomID%></font></b></td>
					<%
						int y = 1 ;
						while(y<=lastDay){
							for(int a=0 ; a<revAll.size(); a++){
								DBbean revBean = (DBbean)revAll.get(a);
								revRoomID = revBean.getRevRoomID();
								if(revRoomID==roomID){
									if(Integer.parseInt((revBean.getRevIn()).substring(5,7))<(month+1)){
										if(Integer.parseInt((revBean.getRevOut()).substring(5,7))>(month+1)){
											for(int b=0;b<lastDay; b++){
												%>
												<td class="cal2">&nbsp;</td>
												<%
												if(y==lastDay){break;}
												y++ ;											
											}
										}else{
											for(int b=0;b<(Integer.parseInt(revBean.getRevOut().substring(8,10))-1); b++){
												%>
												<td class="cal2">&nbsp;</td>
												<%
												if(y==lastDay){break;}
												y++ ;											
											}
										}
									}else {
										if(Integer.parseInt(revBean.getRevIn().substring(8, 10))==y){
											for(int b=0;b<(revBean.getRevTerm()); b++){
												if(b==0){
													%>
													<td class="cal1">&nbsp;</td>
													<%											
												}
												else {
												%>
												<td class="cal2">&nbsp;</td>
												<%
												}								
												if(y==lastDay){y++ ; break;}
												y++ ;														
											}
										}else {
											%>
											<td class="cal8">&nbsp;</td>
											<%
											if(y==lastDay){break;}
											y++ ; a-- ;	
										}
									}
								}
							}
							
							for(int c=y ; c<=lastDay; c++){
								%>
								<td class="cal8">&nbsp;</td>
								<%
								y++ ;					
							}							
						}
					%>							
				</tr>
				<%	
				}
			}catch(Exception ex){System.out.println("room 출력 : "+ex.toString());}
			%>
			<tr class="cal9"><td colspan="33"></td></tr>
		</table>		
		</div>
	</div>
</body>
</html>