<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/join.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 
<script type="text/javascript">

	var result;
	$(function(){
		$("#birthday").datepicker({
		    yearRange: 'c-70:c',
		    changeMonth: true,
		    changeYear: true,
		    dateFormat: "yy-mm-dd",
		    dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});    
	});
	  
	$(function(){	 
		$("input").tooltip({
			    disabled: true
			}).on("focusin", function () {
			    $(this)
			        .tooltip("enable")
			        .tooltip("open");
			}).on("focusout", function () {
			    $(this)
			        .tooltip("close")
			        .tooltip("disable");
			});
	});
	
	$(function(){
		$('#msg').hide();
		$('#msg2').hide();
		$('#idchkbtn').click(function(){
			var result = idchk2();
			if(result==true){
				$.ajax({
					url : "search.json",
					type : "get" ,
					data : {
						userid : $('#userid').val()
					},
					success : function(data){
						if(data==1){
							$('#msg').hide();
							$('#msg').show();
							$('#msg2').hide();
							registerform.userid.value = "";
							registerform.userid.focus();
						}else{
							$('#msg2').hide();
							$('#msg2').show();
							$('#msg').hide();
							
							registerform.userid.focus();
						}					
					}
				});
			}else {
				registerform.userid.value = "";
				registerform.userid.focus();}
		});
	});	
	  
	function idchk1() {
		var inText = registerform.userid.value;
		var ret;
		
		for (var i = 0; i < inText.length; i++){
			ret = inText.charCodeAt(i);
			if (!((ret > 47 && ret < 58) || (ret > 96 && ret < 123))) {
				registerform.userid.value = inText.replace(inText.charAt(i), "");
				alert("아이디는 영어소문와 숫자만 입력가능합니다.");
				result=false;
			}
		}
		if(inText.length > 10){
			registerform.userid.value=inText.substring(0,10);
			alert("아이디는 10자리 이하로 입력해주세요.");	
			result=false;
		}
		return result;
	}
	
	function idchk2() {
		var inText = registerform.userid.value;
		var result=false;
		if(inText ==null || inText == ""){
			alert("아이디를 입력해주세요.");
			result=false;
		}else if(inText.length > 10 || inText.length < 4) {
			registerform.userid.value = inText.substring(0, 10);
			alert("아이디는 4~10자리로 입력해주세요.");
			result=false;
		}else{result=true;}
		return result;
	}
	
	function pwchk1() {
		var inText = registerform.pw1.value;
		var ret;
		for (var i = 0; i < inText.length; i++){
			ret = inText.charCodeAt(i);
			chr_pass0 = inText.charAt(i);
			chr_pass1 = inText.charAt(i-1);
			if (!((ret > 47 && ret < 58) || (ret > 64 && ret < 91) || (ret > 96 && ret < 123))) {
				registerform.pw1.value = inText.replace(inText.charAt(i), "");
				alert("아이디는 영문자와 숫자만 입력가능합니다.");
				document.registerform.pw1.value="";
				document.registerform.pw2.value="";
			}
			if(chr_pass0 == chr_pass1){
				registerform.pw1.value = inText.replace(inText.charAt(i), "");
				alert("연속된 같은 문자는 사용하실 수 없습니다.");
				document.registerform.pw1.value="";
				document.registerform.pw2.value="";
			}
		}
		
		if(inText.length > 12){
			registerform.pw1.value=inText.substring(0,10);
			alert("비밀번호는 12자리 이하로 입력해주세요.");
			document.registerform.pw1.value="";
			document.registerform.pw2.value="";
		}
	}
	
	function pwchk2() {
		var inText = registerform.pw1.value;
		if (inText.length > 12 || inText.length < 6) {
			registerform.pw1.value = inText.substring(0, 10);
			alert("비밀번호는 6~12자리로 입력해주세요.");
			document.registerform.pw1.value="";
			document.registerform.pw2.value="";
		}
	}
	
	function pwchk3(){
		var inText1 = registerform.pw1.value;
		var inText2 = registerform.pw2.value;
		if(inText1 != inText2){
			alert("패스워드가 일치하지 않습니다.");
			document.registerform.pw1.value="";
			document.registerform.pw2.value="";
		}
	}
	
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullAddr = '';
				var extraAddr = '';
				if (data.userSelectedType === 'R')
					fullAddr = data.roadAddress;
				else
					fullAddr = data.jibunAddress;
				if (data.userSelectedType === 'R') {
					if (data.bname !== '')
						extraAddr += data.bname;
						if (data.buildingName !== '')
							extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
							+ ')' : '');
				}
				document.getElementById("postcode").value = data.postcode;
				document.getElementById("addr1").value = fullAddr;
				document.getElementById("addr2").focus();
			}
		}).open();
	}
	
	function emailchk(){
		var inText = registerform.email.value;
		var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		if(inText.length == 0){
			alert("이메일을 입력하여 주세요.");
			return false;}
		if (!inText.match(regExp)){
			alert("이메일 형식이 맞지 않습니다.");
			document.registerform.email.value="";
			return false;}
		return true;
		}
	
	function back(){
		history.go(-1);
	}
		
	function submitchk(){	
		var length = document.forms[0].length-1; 	 
		for(var i = 0; i < 8; i++){	 
			if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
				alert("필수 입력사항은 반드시 입력해주세요"); // 경고창을 띄우고		 
				document.forms[0][i].focus();           // null인 태그에 포커스를 줌		 
				return false;		 
			}		
		}

		if (registerform.gender[0].checked==false && registerform.gender[1].checked==false && registerform.gender[2].checked==false){
			 alert("성별을 체크해 주세요");
			 return false;
		}
	}
</script> 
</head>
<body id=join_center>
	<form name="registerform" onsubmit="return submitchk()" action="join.do" method="get">
		<div id=join_title>
			<img src="images/logo.jpg">
		</div>	 			
		<div>
			<table id=join_tableF>
				<tr>
					<td colspan="2" align=left><font size=4pt><b>필수 입력 사항</b></font></td>
				</tr>
				<tr>
					<td>아이디&nbsp;&nbsp; <font color=red>*</font></td>
					<td>
						<input type="text" id="userid" name="userid" onkeyup="idchk1()" onblur="idchk2()" title="영문자,숫자 조합 4-10자리">
						<input type="button" id="idchkbtn" name="idchkbtn" value="ID중복확인">
						<span id="msg" style="color: red;" >중복된 아이디 입니다~!</span>
			  			<span id="msg2" style="color: red;" >사용가능한 아이디~!</span>	
					</td>			
				</tr>
				<tr>
					<td>패스워드&nbsp;&nbsp; <font color=red>*</font></td>
					<td>
						<input type="password" id="pw1" name="pw1" onkeyup="pwchk1()" onblur="pwchk2()" title="영문자,숫자 조합  6-12자리">
					</td>
				</tr>
				<tr>
					<td>패스워드확인&nbsp;&nbsp; <font color=red>*</font></td>
					<td>
						<input type="password" id="pw2" name="pw2" onblur="pwchk3()">
					</td>
				</tr>		
				<tr>
					<td>성별&nbsp;&nbsp; <font color=red>*</font></td>
					<td>
						<input type=radio id="mr" name="gender" value="Mr.">Mr.&nbsp;&nbsp;&nbsp;
						<input type=radio id="mrs" name="gender" value="Mrs.">Mrs.
						<input type=radio id="ms" name="gender" value="Ms.">Ms.
					</td>
				</tr>
				<tr>
					<td>영문이름&nbsp;&nbsp; <font color=red>*</font></td>
					<td>이름<input type="text" id="ename1" name="ename1" placeholder="First Name">&nbsp;&nbsp; 
						성<input type="text" id="ename2" name="ename2" placeholder="Family Name"></td>
				</tr>			
				<tr>
					<td>생년월일&nbsp;&nbsp; <font color=red>*</font></td>
					<td>
						<input type="text" id="birthday" name="birthday">
					</td>
				</tr>
				<tr>
					<td>연락처&nbsp;&nbsp; <font color=red>*</font></td>
					<td>
						<input type="text" id="tel" name="tel" title="입력예> +82-02-332-4657">
					</td>
				</tr>
				<tr>
					<td>이메일&nbsp;&nbsp; <font color=red>*</font></td>
					<td>
						<input type="text" id="email" name="email" onblur="emailchk();" title="입력예> hanbit@hanbit.com">
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table id=join_tableF>
				<tr>
					<td colspan=2><font size=4pt><b>선택 입력 사항</b></font></td>
				</tr>
				<tr>
					<td>한글이름</td>
					<td>이름<input type="text" id="kname1" name="kname1">&nbsp;&nbsp;  
							성<input type="text" id="kname2" name="kname2"></td>
				</tr>
				<tr>
					<td rowspan=3>주소</td>
					<td>
				  		<input type="text" placeholder="우편번호" size="8" readonly="readonly" id="postcode" name="postcode">
				  	    <input type="button" value="주소검색" onclick="execDaumPostcode()">
				  	</td>
			 	 </tr>
			  	<tr>
					<td><input type="text" placeholder="기본주소" size="40" readonly="readonly" id="addr1" name="addr1"></td>
			  	</tr>
				<tr>
					<td><input type="text" placeholder="상세주소" size="40" id="addr2" name="addr2"></td>
				</tr>		  
			</table>
		</div>
		<div id="join_bottom">
			<input type="button" value="취소" onclick="back();" class="bt2"> &nbsp;&nbsp; <input type="submit" value="다음" class="bt2">
		</div>
	</form>	
</body>
</html>