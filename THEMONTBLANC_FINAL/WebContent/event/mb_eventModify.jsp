<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mont.blanc.common.DBbean" %>
<%@ page import="java.io.File" %>

<html>
<head>
<title>eventInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="event/css/event.css">
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
	  $( "#from" ).datepicker({
	    changeMonth: true,
	    changeYear:true,
	    dateFormat:'yy/mm/dd',
	    numberOfMonths: 3,
	    onClose: function( selectedDate ) {
	      $( "#to" ).datepicker( "option", "minDate", selectedDate );
	      datepicked();
	    }
	  });
	  $( "#to" ).datepicker({
	    changeMonth: true,
	    changeYear:true,
	    dateFormat:'yy/mm/dd',
	    numberOfMonths: 3,
	    onClose: function( selectedDate ) {
	      $( "#from" ).datepicker( "option", "maxDate", selectedDate );
	      datepicked();
	    }
	  });  
	});  
	
	var datepicked = function(){
	 var from = new Date($("#from").datepicker("getDate"));
	 var to = new Date($("#to").datepicker("getDate"));
	 var during = $("#during");
	 if( to && from){
	  var count = Math.ceil((to-from)/86400000)+1;
	  during.val(count);
	 }
	}  
</script> 
<script type="text/javascript">
	function check(){		
		var length = document.forms[0].length-1; 
		// submit을 제외한 모든 input태그의 갯수를 가져옴		 
		for(var i = 0; i < length; i++){     // 루프를 돌면서		 
		    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){		 
		        alert(document.forms[0][i].name + "을/를 입력하세요."); // 경고창을 띄우고		 
		        document.forms[0][i].focus();           // null인 태그에 포커스를 줌		 
		        return false;		 
		    }//end if		
		}//end for
	}//end	
		
</script>  

</head>
<body>
<div id="adminF">
		<%
 			DBbean bean = (DBbean)request.getAttribute("pre");
 		%>
	<form method='post' action='mb_eventModify.do' name='save' onsubmit="return check()" enctype="multipart/form-data">	 	
 	<div id="adminF2">
 		
 		<div id="event_title2">이벤트 수정하기</div>
 		
 		<input type="hidden" name='num' class="eventS" value="<%= bean.getNum() %>">
 		
 		<span class="eventB">이벤트 제목 </span>	
 		<input type='text' name='title' class="eventS" value="<%= bean.getTitle() %>" ><span>(50자 미만)</span><br>
 		
		<span class="eventB">이벤트 시작 </span>
 		<input type="text" name="e_start" id="from" class="eventS" value="<%= bean.getE_start() %>" ><br>
 		
 		<span class="eventB">이벤트 종료 </span>
 		<input type="text" name="e_end" id="to" class="eventS" value="<%= bean.getE_end() %>" ><br>

		<span class="eventB">메인 이미지 </span>		
 		<input type="file" name="mbevent_main" class="eventS"><span>최적화 : 600 * 854 px </span> <span id=event_att_file> [파일명:<%=bean.getMbevent_main()%>]</span><br>

		
 		<span class="eventB">썸네일 등록 </span>
 		<input type="file" name="mbevent_thumb" class="eventS" ><span>최적화 : 225 * 90 px </span> <span id=event_att_file> [파일명:<%=bean.getMbevent_thumb()%>]</span><br>
 		
 		<span class="eventB">이벤트 내용 </span>
 		<textarea name='content' rows=5 cols=50 class="eventS"><%= bean.getContent() %></textarea><span>(3000자 미만)</span><br>
	</div>
 		<input type='submit' value="확인" class="ECbt">
 	</form>	
 		<a href='mb_event.do?pageType=now&type=admin'><input type='button' value="취소" class="ECbt"></a>
</div>
</body>
</html>