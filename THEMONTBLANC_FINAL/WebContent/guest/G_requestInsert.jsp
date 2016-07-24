<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>request</title>
<link rel="stylesheet" type="text/css" href="guest/css/faq.css">
<script language="JavaScript">
	function onSubmit() {
		var form = document.request;
		if (form.ftitle.value == "") {
			alert("제목을 입력해 주세요.");
			form.ftitle.focus();
			location.reload();
			return;
		}
		var form = document.request;
		if (form.fname.value == "") {
			alert("이름을 입력해 주세요.");
			form.fname.focus();
			return;
		}
		var form = document.request;
		if (form.ftel.value == "") {
			alert("연락처을 입력해 주세요.");
			form.ftel.focus();
			return;
		}
		var form = document.request;
		if (form.femail.value == "") {
			alert("이메일을 입력해 주세요.");
			form.femail.focus();
			return;
		}
		var form = document.request;
		if (form.agree.checked == false) {
			alert("동의하여주세요.");
			return false;
		} else {
			return true;
		}
	}

	function showKeyCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)) {
			return;
		} else {
			return false;
		}
	}
	
</script>
</head>
<body>
	<form method='get' action='G_requestInsert.do' name='request'>
		<div id="faqF">
			<div id="faqF2">
				<div id="faq_title2">문의사항</div>
				<img alt="고객의소리" src="guest/images/infoqna.png"> <hr>
				<table id="faq_tableF2">
					<tr>
						<td class="faqB"><span class="ast">*</span> 문의구분</td>
						<td><select name="fselect" class="faqS">
								<option>ACCOMODATION</option>
								<option>FACILITIES</option>
								<option>ETC</option>
						</select></td>
					</tr>
					<tr>
						<td class="faqB"><span class="ast">*</span> 제목</td>
						<td><input type='text' id='ftitle' name='ftitle' class="faqS" maxlength="19">(20자
							미만)</td>
					</tr>
					<tr>
						<td class="faqB"><span class="ast">*</span> 이름</td>
						<td><input type='text' id='fname' name='fname' class="faqS" maxlength="9">(10자
							미만)</td>
					</tr>
					<tr>
						<td class="faqB"><span class="ast">*</span> 연락처</td>
						<td><input type='text' onkeydown="return showKeyCode(event)" id='ftel' name='ftel' class="faqS">(숫자만
							입력)</td>
					</tr>
					<tr>
						<td class="faqB"><span class="ast">*</span> 이메일</td>
						<td><input type='text' id='fmail' name='femail' class="faqS"></td>
					</tr>
					<tr>
						<td class="faqB" style="vertical-align: top;">문의 내용</td>
						<td><textarea id='fcontents' name='fcontents' rows=5 cols=50 class="faqS"
								style="vertical-align: bottom; maxlength="399"></textarea>(400자 미만)</td>
					</tr>
				</table>
			</div>
			<textarea name='fcontents' rows=5 cols=87 class="faqS"
				style="vertical-align: bottom;">
- THE MONT BLANC HOTEL -
고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및 이용하는데 동의합니다.
1. 필수적인 개인정보의 수집 ㆍ이용에 관한 사항
① 수집ㆍ이용 항목 | 성명,  이메일, 휴대전화번호, 유선 전화번호(자택 또는 직장)
② 수집ㆍ이용 목적 | 문의에 대한 안내 및 서비스 제공
③ 보유ㆍ이용 기간 | 수집ㆍ이용 동의일로부터 5년간
※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 문의에 대한 안내 및 서비스 제공과 관련된 제반 절차 진행이 불가능 할 수 있음을 알려드립니다.</textarea>
			<br> <input type="checkbox" name="agree" value="1"> 동의함
			<hr>
			<!-- 버튼 -->
			<div style="text-align: center">
				<input type="image" src="guest/images/submit.png" name="submit" value="확인" class="bt" onclick="onSubmit()"> 
			</div>
		</div>
	</form>
</body>
</html>