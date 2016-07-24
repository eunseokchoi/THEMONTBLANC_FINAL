<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">
</head>
<body id="admin_center">
	<div id="admin_title"> 
		<div class="admin_titleB">
			<span style="font-size:1.5em; padding-right:10px;">관리자</span>
			<span>관리자 페이지입니다.</span>
		</div>
	</div>
	<div id="wrap">
		<div id="admin_left">
			<ul>
				<li><a href="member.do">Member</a></li>
				<li><a href="notice.do">Notice</a></li>
				<li><a href="mb_event.do?&pageType=now&type=admin">Event</a></li>
				<li><a href="G_Adminguest.do">Board</a></li>
				<li><a href="request.do">FAQ</a></li>
				<li><a href="revCal.do">Reservation</a></li>
			</ul>
		</div>
		<div id="admin_section">
			<% 
			String pageFile=request.getParameter("page") ;
			String listFile=request.getParameter("list") ;
			/*회원정보*/
			if(listFile.equals("member")){
				pageFile="/admin/member";
			/*공지사항*/
			}else if(listFile.equals("notice")){
				pageFile="/notice/notice";
			}else if(listFile.equals("noticeInsert")){
				pageFile="/notice/noticeInsert";
			}else if(listFile.equals("noticeDetail")){
				pageFile="/notice/noticeDetail";
			}else if(listFile.equals("noticeDelete")){
				pageFile="/notice/noticeDelete";
			}else if(listFile.equals("noticeEdit")){
				pageFile="/notice/noticeEdit";
			/*이벤트*/	
			}else if(listFile.equals("event")){
				pageFile="/event/mb_event";
			}else if(listFile.equals("eventInsert")){
				pageFile="/event/mb_eventInsert";	
			}else if(listFile.equals("eventModify")){
				pageFile="/event/mb_eventModify";	
			}else if(listFile.equals("eventPreModify")){
				pageFile="/event/mb_eventModify";	
				
				/*이용후기*/	
			}else if(listFile.equals("guest")){
				pageFile="/guest/guest";
			}else if(listFile.equals("guestDetail")){
				pageFile="/guest/guestDetail";
			}else if(listFile.equals("guestDelete")){
				pageFile="/guest/guestDelete";
			/*문의사항*/	
			}else if(listFile.equals("request")){
				pageFile="/guest/request";
			}else if(listFile.equals("requestDetail")){
				pageFile="/guest/requestDetail";	
			}else if(listFile.equals("requestDelete")){
				pageFile="/guest/requestDelete";		
			/*예약현황*/	
			}else if(listFile.equals("reservation_Cal")){
				pageFile="/reservation/reservation_Cal";
			}else if(listFile.equals("reservation_Board")){
				pageFile="/reservation/reservation_Board";
			}
			

			if(listFile.equals("member")){ %>			
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("notice")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("noticeInsert")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("noticeDetail")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("noticeDelete")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("noticeEdit")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("event")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("eventInsert")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("eventModify")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("eventPreModify")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("guest")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("guestDetail")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("guestDelete")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("request")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("requestDetail")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("requestDelete")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			
			<% }else if(listFile.equals("reservation_Cal")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("reservation_Board")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% } %>
		</div>
	</div>
</body>
</html>