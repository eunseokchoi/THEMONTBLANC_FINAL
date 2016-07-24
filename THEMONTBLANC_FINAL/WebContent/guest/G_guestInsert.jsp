<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<script src='guest/js/jquery.MetaData.js' type="text/javascript"></script>
<script src='guest/js/jquery.rating.js' type="text/javascript"></script>
<link rel="stylesheet" href='guest/js/jquery.rating.css' type="text/css" />
<style type="text/css">
	#st {
		display: inline;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#radioa").on("click",function(){			
			if(this.checked){
				$("#star").hide();
			}
		});

		$("#radiob").on("click",function(){
			if(this.checked){
				$("#star").show();
			}
			});
		});
	</script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("NowUser");
	%>
	<div id="guestF">
		<form name=write action="G_guestInsert.do">
			<div id="guestF2">
				<div id="guest_title2">Board</div>
				<table id="guest_tableF2">
					<%
						if (id != null) {
					%>
					<tr>
						<td colspan="3"><input type=hidden name=writer value="<%=id%>"></td>
					</tr>
					<%
						}
					%>

			<tr height="30">
				<td class="guestB" width=20%>·카테고리</td>
				<td class="gom" width=30%>
				<input type="radio" id="radioa" name="category" value="자유글" > ·자유글 
				<input type="radio" id="radiob" name="category" value="이용후기" checked="checked"> ·이용후기
				</td>
				<td class="guestS-2">
				<label id="star">
				<font color="#6e6464" size="3"><b>만족도</b></font>
					<input type="radio" name=rate class="guestS" value="1">★ 
					<input type="radio" name=rate class="guestS" value="2">★★ 
					<input type="radio" name=rate class="guestS" value="3" checked="checked">★★★ 
					<input type="radio" name=rate class="guestS" value="4">★★★★ 
					<input type="radio" name=rate class="guestS" value="5">★★★★★
				</label>
				</td>
					</tr>
					<tr>
						<td class="guestB">·제목</td>
						<td colspan="2"><input type=text name=title class="guestS">(20자
							미만)</td>
						
					</tr>
					<tr>
						<td class="guestB" style="vertical-align: top;">·내용</td>
						<td colspan="2"><textarea name=contents rows=20 cols=60
								class="guestS" style="vertical-align: bottom;"></textarea>(3000자 미만)</td>
					</tr>
				</table>
			</div>
			<input type=submit value=확인 class="bt"> <a href='G_guest.do'><input
				type='button' value="취소" class="bt"></a>
		</form>
	</div>
</body>
</html>