<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/join.css">
</head>
<body id=join_center>
	<div id=join_title>
		<img src="images/logo.jpg">
	</div>
	<%
		String id = (String)session.getAttribute("NowUser");
	%>
	<div>
		<form method="get" name="myform" action="../index.jsp">
			<table id=join_tableF>
				<tr>
					<td align="center"><font size="5" b><b><%=id %>님 가입을 축하드립니다^_____________^</b></font></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit" value="메인화면으로"></td>
				</tr>
			</table>		
		</form>
	</div>
</body>
</html>