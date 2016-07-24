<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="mont.blanc.common.*" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">
<script type="text/javascript">
	var size=14;
	
	function font_ori() {  $("#guest_contents").css("font-weight","normal"); }
	
	function font_bold() { $("#guest_contents").css("font-weight","bold"); }
	
	function font_plus() { size++; $("#guest_contents").css("font-size",size+1+"px"); }

	function font_minus() { size--;  $("#guest_contents").css("font-size",size-1+"px"); }

	function font_init() {  $("#guest_contents").css("font-size","14px"); size=14; }
	
	$( document ).ready(function() {
		$("#fs").on("change",function(){
			$("#guest_contents").css("font-family",$(this).val()); //글자 모양을 바꿉니다.
	    });
	});
</script>
</head>
<body>
	<%
		try{
			String id=(String)session.getAttribute("NowUser");
			DBbean bb=(DBbean)request.getAttribute("detail");
			List data=(List)request.getAttribute("colist");
			String pageNUM=(String)request.getAttribute("detail_pageNUM"); 
			if(pageNUM==null){pageNUM ="1";}
			String category_type = request.getParameter("category_type");
			if(category_type==null){category_type ="" ;}
			String type2 = request.getParameter("type2");
			if(type2 ==null){type2="";}
			String keyword = request.getParameter("keyword");
			if(keyword==null){keyword="";};
			String returnPage = "&category_type="+category_type+"&type2="+type2+"&keyword="+keyword;
	%>

	<div id="guestF">
		<div id="guestF2">
			<div id="guest_title3">Board
				<table align="right">
				 <tr>
				   <td>
				    <font size=3; font-weight=bold>폰트 변경</font>
				    <select name="fs" id="fs">
			      		 <option value="dotum,'돋움',sans-serif">돋움</option>
	           			 <option value="gulim, '굴림', sans-serif">굴림</option>
	          			 <option value="magun gothic, '맑은고딕', sans-serif" >맑은고딕</option>
	         			 <option value="magun gothic, '맑은고딕', serif">궁서</option>
			      	</select>
				   </td>
				 </tr>
				 <tr>
				   <td>
					<button onclick='font_plus()' style="width:15%; height:75%;">+</button>
					<button onclick='font_minus()' style="width:15%; height:75%;">-</button>
					<button onclick='font_init()' style="width:15%; height:75%;" >0</button>
					<button onclick='font_ori()' style="width:15%; height:73%;">가</button>
				    <button onclick='font_bold()' style="width:15%; height:73%; font-weight:bold; ">가</button>
			       </td>
				 </tr> 
				</table>	
			</div>		
			<table id="guest_tableF">
				<tr class="guest_tableB" height="30">
					<td width=10%>NO</td>
					<td width=10%>CATEGORY</td>
					<td width=20%>TITLE</td>
					<td width=10%>NAME</td>
					<td width=20%>DATE</td>
					<td width=10%>COUNT</td>
					<td width=20%>REVIEW</td>
				</tr>
				<tr height="30">
					<td><%= bb.getRn() %></td>
					<td><%= bb.getCategory()%></td>
					<td><%= bb.getTitle() %></td>
					<td><%= bb.getWriter() %></td>
					<td><%= bb.getWdate() %></td>
					<td style="color:#ff6600"><%=bb.getCount() %></td>
					<td>
						<%	if(bb.getCategory().equals("이용후기")){
							int s =1;
							for (s = 1; s<=bb.getRate(); s++) {
							%>
							<div id=star1></div><!-- 별점 --> 
							<%  }for(int k=0; k<=5-s; k++){%>
							<div id=star2></div><!-- 별점 -->
							<% }}  %>
					</td>
				</tr>
			</table>	
			<div id="guest_contents" ><%=bb.getContents( ).replaceAll("\r\n", "<br>")%></div>
			
			<!-- 버튼 -->	
			<div id="guest_bottom">
				<a href='G_guest.do?pageNUM=<%=pageNUM%><%=returnPage%>'><input type='button' value="목록" class="bt"></a>
				<a href='G_guestPreInsert.do?num=<%=bb.getNum()%>'><input type='button' value="글쓰기" class="bt"></a>
				<% if(id!=null&&id.equals(bb.getWriter())||id!=null&&id.equals("admin")){ %>
				<a href="G_guestPreEdit.do?num=<%=bb.getNum()%><%=returnPage%>"><input type='button' value="수정" class="bt"></a>		
				<form name="reviewlist">
					<a href="G_guestDelete.do?num=<%=bb.getNum()%>"><input type='button' value="삭제" class="bt"></a>
				</form>
				<%} %>
				&nbsp;
				<a href="G_guestDetail.do?num=<%=bb.getNum()%>&reco=<%=bb.getReco()%>&pageNUM=<%=pageNUM%><%=returnPage%>">
				<input type="image" src="guest/images/like2.png" style="vertical-align: middle; border:1" width=40px height=35px >
				</a>
				<b><%=bb.getReco() %> 명이 공감했습니다</b>
			</div>
			<div id="guest_comment">
				덧글 <%=data.size() %>개<jsp:include page="G_guestCoInsert.jsp" flush="false" />	
				<%
				for(int i=0; i<data.size(); i++){
					DBbean cc=(DBbean)data.get(i);		
				%>		
				<table class="guest_commentF">		
				<tr>
					<td class="comment1"><%=cc.getCowriter() %></td>
					<td class="comment2"><%=cc.getCodate() %></td>
					<td class="comment3" rowspan="2">
					<%	if(id!=null&&id.equals(cc.getCowriter())||id!=null&&id.equals("admin")){	%>
					<form name=jin method=get action=G_guestCoDelete.do>
						<input type=hidden name=conum value=<%=cc.getConum()%>>
						<input type=hidden name=num value=<%=bb.getNum()%>>				
						<input type=submit value="삭제" class="bt" style="float:right;">
					</form>	
					<%	} %>
					</td>
				</tr>	
				<tr>
					<td class="comment4" colspan="2"><%=cc.getCmt() %></td>
				</tr>
				</table>
				<%	} %>
			</div>
		</div>	
	<%
		}catch(Exception ex){   }
	%>
</div>	
</body>
</html>