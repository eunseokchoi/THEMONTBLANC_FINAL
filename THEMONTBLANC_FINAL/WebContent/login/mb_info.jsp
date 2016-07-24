<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="login/css/join.css">
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
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
				document.getElementById("showaddr").value = fullAddr;
				document.getElementById("addr").value = fullAddr;
				document.getElementById("addr").focus();
			}
		}).open();
	}
</script>
<body id=join_center>
	<div id=join_title>
		<img src="login/images/logo.jpg">
	</div>
	<%
		int result=0;
		try{
			result = (int)request.getAttribute("result");
		}catch(Exception ex){}
		
		String id = (String)request.getAttribute("id");
			if(id==null){id="";}
			String pw = (String)request.getAttribute("pw");
			if(pw==null){pw="";}
			String gender = (String)request.getAttribute("gender");
			if(gender==null){gender="";}
			String engname = (String)request.getAttribute("engname");
			if(engname==null){engname="";}
			String korname = (String)request.getAttribute("korname");
			if(korname==null){korname="";}
			String birthday = (String)request.getAttribute("birthday");
			if(birthday==null){birthday="";}
			String addr = (String)request.getAttribute("addr");
			if(addr==null){addr="";}
			String tel = (String)request.getAttribute("tel");
			if(tel==null){tel="";}
			String email = (String)request.getAttribute("email");
			if(email==null){email="";}
		
		if(result==1){
	%>
	<script type="text/javascript">
		alert("수정 완료~!");
	</script>
	<%
		}else if(result==2){
	%>
	<script type="text/javascript">
		alert("회원탈퇴 완료~!");
		location.href="../index.jsp";
	</script>
	<%
		}
	%>
	<script type="text/javascript">
		function del(){
			var id=document.myform.userid.value;
			if(confirm("탈퇴하시겠습니까?")){
				location.href="delete.do?id="+id;
			}else{}
		}
		
		function back(){
			location.href="./index.jsp";
		}
	
		function toaddr(){
			document.getElementById("addr").value=document.getElementById("showaddr").value;
		}
</script>
	<div align="center">
		<form method="get" name="myform" action="modify.do">
		<input type="hidden" id="userid"value=<%= id %>>
		<table id=join_tableF>
			<tr>
				<td align="center"colspan=2 width=100><font size=5pt><%=id %>  님&nbsp; 회원정보</font></td>
			</tr>
			<tr height="15px"></tr>
			<tr>
				<td>아이디&nbsp;:&nbsp;</td>
				<td><input type =text id=id name=id value=<%=id %> readonly="readonly">		</td>
			</tr>
			<tr>
				<td>패스워드&nbsp;:&nbsp;</td>
				<td><input type =text id=pw name=pw value=<%=pw %>>	</td>
			</tr>
			<tr>
				<td>패스워드확인&nbsp;:&nbsp;</td>
				<td><input type =text id=pw2 name=pw2 value=<%=pw %>>	</td>
			</tr>
			<tr>
				<td>성별&nbsp;:&nbsp;</td>
				<td><input type =text id=gender name=gender value=<%=gender %>>		</td>
			</tr>
			<tr>
				<td>영문이름&nbsp;:&nbsp;</td>
				<td><input type =text id=engname name=engname value=<%=engname %>>		</td>
			</tr>
			<tr>
				<td>한글이름&nbsp;:&nbsp;</td>
				<td><input type =text id=korname name=korname value=<%=korname %>>		</td>
			</tr>
			<tr>
				<td>생년월일&nbsp;:&nbsp;</td>
				<td><input type =text id=birthday name=birthday value=<%=birthday %>>		</td>
			</tr>
			<tr>
				<td>연락처&nbsp;:&nbsp;</td>
				<td><input type =text id=tel name=tel value=<%=tel %>>		</td>
			</tr>
			<tr>
				<td>이메일&nbsp;:&nbsp;</td>
				<td><input type =text id=email name=email value=<%=email %>>		</td>
			</tr>
			<tr>
				<td>주소&nbsp;:&nbsp;</td>
				<td><input type="hidden" id=addr name=addr value=<%=addr %> width=150>
				<textarea rows="5" cols="30" id="showaddr" onblur="toaddr()"><%=addr %></textarea>
				<input type="button" onclick="execDaumPostcode()" value="주소검색">		</td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="button" id="returnbutton" onclick="back();" value="홈으로">&nbsp;&nbsp;<input type="submit" id="modifybutton" value="회원정보수정">&nbsp;&nbsp;<input type="button" onclick="del();" value="회원탈퇴"></td>
			</tr>			
		</table>
		</form>
	</div>	
</body>
</html>