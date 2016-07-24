<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "mont.blanc.common.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<body>
	<div id=adminF>
		<div id=adminF2>
			<div id="admin_title2">예약 현황</div>
	<%
		List revBoard = new ArrayList() ;
		revBoard = (List)request.getAttribute("revBoard");
	%>
			<form method="get" action="revBoard.do">
				<div id="adminF3">
					<a href="revCal.do"><input type="button" value=예약캘린더 class="bt2"></a>
					<select name="order" class="ta">
						<option value="revDate">예약일
						<option value="revIn">체크인
						<option value="revOut">체크아웃
						<option value="revID">예약번호
						<option value="revRoomID">룸번호
						<option value="roomType">룸타입
					</select> 			
					<select name="sort" class="ta">
						<option value="desc">오름차순
						<option value="asc">내림차순
					</select>			 				
					<input type="submit" value="정렬" class="bt">
				</div>
				<table id=admin_tableF>
					<tr class="admin_tableB">
						<td>예약번호</td>
						<td>ID</td>
						<td>이름</td>
						<td>Room</td>
						<td>RoomType</td>
						<td>Check-In</td>
						<td>Check-Out</td>
						<td>숙박기간</td>
						<td>예약일</td>
						<td>숙박인원</td>
						<td>총금액</td>
						<td>삭제</td>
					</tr>
	<%
		for(int i=0 ; i<revBoard.size(); i++){
			DBbean bean = (DBbean)revBoard.get(i) ;
			int revID = bean.getRevId() ;
			String revMember = bean.getRevMember() ;
			String revName = bean.getRevName() ;
			int revRoomID = bean.getRevRoomID() ;
			String roomType = bean.getRevRoomType() ;
			String revIn = (bean.getRevIn()).substring(0, 11) ;
			String revOut = (bean.getRevOut()).substring(0, 11) ;
			int revTerm = bean.getRevTerm() ;
			java.util.Date revDate = bean.getRevDate() ;
			int revCap = bean.getRevCap();
			int revCost = bean.getRevCost();
	%>
					<tr>
						<td><%=revID%></td>
						<td><%=revMember%></td>
						<td><%=revName%></td>
						<td><%=revRoomID%></td>
						<td><%=roomType%></td>
						<td><%=revIn%></td>
						<td><%=revOut%></td>
						<td><%=revTerm%></td>
						<td><%=revDate%></td>
						<td><%=revCap%></td>
						<td><%=revCost%></td>
						<td><a href="revDelete.do?revID=<%=revID%>"><input type="button" name="delete" value="삭제"></a></td>
					</tr>
	<%		
		}
	%>
					<tr class="cal9"><td colspan="12"></td></tr>
				</table>
			</form>	
		</div>
	</div>
</body>
</html>