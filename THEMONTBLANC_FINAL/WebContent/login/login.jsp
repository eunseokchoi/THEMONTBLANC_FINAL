<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
	
	function idCheck(){
		var id = document.getElementById("userid").value;
		var pw = document.getElementById("userpw").value;
		if(id==null||id==""){
			alert("아이디를 입력하세요");
			location.reload();
		}else if(pw==null||pw==""){
			alert("비밀번호를 입력하세요");
			location.reload();
		}else if( id.length<4 || id.length>12){
			alert("아이디는 4~12자리입니다");
			location.reload();
		}else if(id.length>=4 || id.length<=12){
			var idReg = /^[A-za-z0-9]{4,12}/g;
			if(!id.match(idReg)){
				alert("영문 숫자만 입력 가능합니다");
				location.reload();
			}
		}
			
		$(function(){
			$.ajax({
				url : "login.json",
				type : "get",
				data : {
					userid : $('#userid').val(),
					userpw : $('#userpw').val()
				},
				success : function(data){
					if(data==1){
						location.reload();
					}else if(data==2){
						location.reload();
					}else{
						alert("잘못입력하셧습니다");
						location.reload();
					}
				}
			});
		});	
	}
	
	$(function(){  
        jQuery('#membership').click(function (e) {  
            e.preventDefault();  
            var url = "login/membership.jsp";  
            window.open(url, "MEMBERSHIP");  
        });  
    });
</script>
</head>
<body>
	<%
		String NowUser = (String)session.getAttribute("NowUser");
		if(session.getAttribute("NowUser")==null){
	%>
	<div id="message">
		<span class="logintext">
			ID &nbsp;<input type="text"  name="userid" placeholder="아이디" id="userid" style="width:70px;">&nbsp;
		</span>
		<span class="logintext">
			PW &nbsp;<input type="password"	name="userpw" placeholder="비밀번호" id="userpw"  style="width:70px;">&nbsp;
		</span>
		<span class="logintext">
			<a href="#" class="logintext" onclick="idCheck()">로그인</a>&nbsp;
		</span>
		<span class="logintext">
			<a href="login/join-step1.jsp" class="logintext">회원가입</a>&nbsp;
		</span>
		<span class="logintext" id="membership">
			<a href="" class='logintext'>멤버십</a>
		</span>
	</div>
	<%
		}else if(NowUser.equals("admin")){
	%>
	<span class='logintext'>
		<%=(String)session.getAttribute("NowUser")%> 관리자 ▶&nbsp;
	</span>
	<span class='logintext'>
		<a href="member.do" class='logintext'>관리자페이지</a> &nbsp;
	</span>
	<span class="logintext" id="membership">
			<a href="" class='logintext'>멤버십</a> &nbsp;
	</span>
	<span class='logintext'>
		<a href="login/logout.jsp" class='logintext'>로그아웃</a>
	</span>
	<%
		}else{
	%>
	<span class='logintext'>
		<%=(String)session.getAttribute("NowUser")%> 고객님 ▶&nbsp;
	</span>
	<span class='logintext'>
		<a href="info.do" class='logintext'>마이페이지</a> &nbsp;
	</span>
	<span class="logintext" id="membership">
			<a href=""class="logintext">멤버십</a> &nbsp;
	</span>
	<span class='logintext'>
		<a href="login/logout.jsp" class='logintext'>로그아웃</a>
	</span>
	<%
		}
	%>
</body>
</html>