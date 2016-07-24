<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	session.invalidate();
%>
<html>
<head>
<script>
	alert("로그아웃 되었습니다. 이용해 주셔서 감사합니다.");
</script>
</head>
<body>
	<%
		response.sendRedirect("../index.jsp");
	%>
</body>
</html>