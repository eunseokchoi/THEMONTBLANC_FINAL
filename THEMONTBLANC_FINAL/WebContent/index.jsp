<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>THE MONT BLANC</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">
<script src="css/html5shiv.js"></script>
<meta name="google-site-verification" content="x9qM2ZwCjmW7EgSuF_-wijZ90RX4r5LevWfGGlv43Pg" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="main/css/main.css">
<style type="text/css">
	#pop_color{
		bacl:"#000000";
	}
</style>
<script type="text/javascript">
	function popup(){
		cookiedata = document.cookie;
		if(cookiedata.indexOf("maindiv=done") < 0){
			document.all['divpop'].style.visibility = "visible" ; 
		}else{
			document.all['divpop'].style.visibility="hidden"; 
		}
	}	
	
	function popup2(){
		cookiedata = document.cookie;
		if(cookiedata.indexOf("maindiv2=popc") < 0){
			alert(cookiedata.indexOf("maindiv2=popc"));
			document.all['divpop2'].style.visibility = "visible" ;
		}else{
			document.all['divpop2'].style.visibility="hidden"; 
		}
	}
	
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setMinutes(todayDate.getMinutes() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";"
	}	

	function closeWin() { 
		if ( document.notice_form.chkbox.checked ){ 
			setCookie( "maindiv", "done" , 1 ); 
		} 
		document.all['divpop'].style.visibility = "hidden";
	}
	
	function closeWin2() {
		if (document.notice.chkbox.checked) {
			setCookie("maindiv2", "popc", 1);
		}
		document.all['divpop2'].style.visibility = "hidden";
	}
</script>
</head>
<%
	String pageFile=request.getParameter("page");
	String data=request.getParameter("keyfield");
	if(pageFile == null || pageFile == ""){
		pageFile = "/main/main";
	}
%>
<body>
	<!-- top -->	
	<div>
		<jsp:include page="main/top.jsp" flush="false" />	
	</div>
	<!-- mainMenu -->	
	<div>
		<jsp:include page="main/mainMenu.jsp" flush="false" />
	</div>
	<!-- main  -->	
	<div>
		<% if(data != null){ %>
			<jsp:include page='./admin/m_admin.jsp' />
		<% }else { %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
		<% } %>	
	</div>	
	<!-- bottom -->  	
	<div>
		<jsp:include page="main/bottom.jsp" flush="false" />
	</div>
	<!-- POPUP -->
	<div id="divpop" style="border:1px solid white; background-color:#000000; position: absolute; left: 250px; top: 190; z-index: 200; visibility: hidden;" >
		<table width=300 height=400 cellpadding=2 cellspacing=0 >
			<tr>
				<td style="border:1px #666666 solid" bgcolor="white" > 
				    <!-- style="border: 1px #666666 solid" height=360 align=center bgcolor=white>여기에 내용 삽입 -->
					<img alt="" src="guest/images/hotel_img1.png">
				</td>
			</tr>
			<tr>
				<form name="notice_form">
					<td align=right bgcolor=black><input type="checkbox" name="chkbox" value="checkbox">
					  <font color="white">오늘 하루 이 창을 열지 않음</font>&nbsp;<a href="javascript:closeWin();"><font color="white">[닫기]</font></a>&nbsp;
					</td>
			</tr>
			</form> 
		</table>
	</div>	
		<div id="divpop2" style="position: absolute; right:300px; top: 190; z-index: 100; visibility: hidden;" >
		<table width=400 height=500 cellpadding=2 cellspacing=0 >
			<tr height="310">
				<td style="border:2px" bgcolor="white" > 
					<img alt="" src="guest/images/1234.png">
				</td>
			</tr>
			<tr id="pop_color" >
				<td align="center" height="300" >
					<form name="notice">
						<input type="checkbox" name="chkbox" value="checkbox">
						<font color="white">오늘 하루 이 창을 열지 않음</font>&nbsp;
						<a href="javascript:closeWin2();"><font color="white">[닫기]</font></a>&nbsp;
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>