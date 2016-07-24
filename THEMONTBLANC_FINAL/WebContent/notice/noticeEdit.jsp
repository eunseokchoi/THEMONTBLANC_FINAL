<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="mont.blanc.common.DBbean" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<link rel="stylesheet" type="text/css" href="notice/css/notice_board.css">
<script src="notice/css/jquery-1.7.2.js"></script>
<script type="text/javascript">
/* 공지사항 게시판 자바스크립트&제이쿼리 조작
 * css 부분
 * Query 폴더 따로 없이 noticeInsert.jsp 본 파일명에 같이저장함 
 */
 
 /*font-family*/  
 $(function(){
    
 $(function(){
   $("#font_family_type").on("change",function(){
     $("#asd").css("font-family",$(this).val()); 
   });
 });

 /*font-size*/
  var size=12;
 $(function(){
   $("#font_size_type").on("change",function(){
     $("#asd").css("font-size",$(this).val()); 
   });
 });

 /*line-height*/
 $(function(){
   $("#line_height_type").on("change",function(){
     $("#asd").css("line-height",$(this).val()); 
   });
 });
 
 /*font-style-reset*/
 $(function(){
  $("#left_bt").click(function(){
     $("#asd").css("font-size","12px");
       $("#asd").css("font-family","dotum"); 
       $("#asd").css("font-color","#000");
       $("#asd").css("text-decoration","none");
       $("#asd").css("font-style","NORMAL");
       $("#asd").css("font-weight","NORMAL");
       $("#asd").css("color", "#000");
       $("#asd").css("background-color", "#fff");
       $("#asd").css("line-height", "100%");
    
  });    
 });
 
$(function(){
  $("#fontcolor_layer").on("change", function(){
   $("#asd").css("color", $(this).val());  
  });   
});
 
$(function(){
  $("#bgcolor_layer").on("change", function(){
     $("#asd").css("background-color", $(this).val());  
  });   
});


/*bold*/
$(function(){
  $("#b_style").click("change",function(){
     $("#asd").css("font-weight","bold");
  });
});

/*underline*/
$(function(){
  $("#u_style").click("change",function(){
     $("#asd").css("text-decoration","underline"); 
  });
});

/*italic*/
$(function(){
  $("#i_style").click("change",function(){
     $("#asd").css("font-style","italic");
  });
});


}); //wrap
//]]>
</script> <!-- 공지사항게시판 글쓰기폼 자바스크립트 제이쿼리 조작 -->
</head>
<body>
   <%
   try{
      DBbean bean = (DBbean)request.getAttribute("edit");
   %>
<div id="adminF">
   <form method=get name=myform action="noticeEdit.do">
   <div id="adminF2">
      <div id="admin_title2">공지사항 수정</div>
      <table id="admin_tableF2">
         <tr>
            <td class="adminB" id="tb_title" style="border-top:5px solid #eceae1;">제목</td>
            <td class="bd_style" style="border-top:5px solid #eceae1;"><input type=text name=title class="adminS" id="tb_title2" value="<%=bean.getTitle() %>"></td>
         </tr>
         <tr>
            <td class="adminB" id="tb_title">이름</td>
            <td class="bd_style"><input type="text" name="name" class="adminS" id="tb_title2" value="<%=bean.getName() %>"></td>
         </tr>         
         <tr>
        <!-- boardEditor start -->
        <div id="bd_box"></div>
        <div class="board_editor"> 
         <ul class="editor_style1">
          <li class="ff">
            <select name="font_family_type" id="font_family_type">
               <option value="" >font-face</option>
               <option value="dotum,'돋움',sans-serif">Dotum</option>
               <option value="gulim, '굴림', sans-serif">Gulim</option>
               <option value="magun gothic, '맑은고딕', sans-serif">Magun gothic</option>
               <option value="AmeriGarmnd BT">AmeriGarmnd BT</option>
               <option value="Baskerville BT">Baskerville BT</option>
               <option value="BernhardFashion BT">BernhardFashion BT</option>
               <option value="Brush Script Std">Brush Script Std</option>
               <option value="HYSinMyeongJo">HYSinMyeongJo</option>
               <option value="HY크리스탈M">HY크리스탈M</option>
               <option value="HY울릉도M">HY울릉도M</option>
               <option value="HY엽서M">HY엽서M</option>
               <option value="HY나무M">HY나무M</option>
               <option value="HY견명조">HY견명조</option>
               <option value="HY궁서">HY궁서</option>
               
            </select>
          </li>
          <li class="fs">
            <select name="font_size_type" id="font_size_type">
                  <option value="">font-size</option>
                  <option value="9px" style="font-size:9px">9px</option>
                  <option value="10px" style="font-size:10px">10px</option>
                  <option value="12px" style="font-size:12px">12px</option>
                  <option value="14px" style="font-size:14px">14px</option>
                  <option value="16px" style="font-size:16px">16px</option>
                  <option value="18px" style="font-size:18px">18px</option>
                  <option value="20px" style="font-size:20px">20px</option>
                  <option value="22px" style="font-size:22px">22px</option>
                  <option value="24px" style="font-size:24px">24px</option>
                  <option value="26px" style="font-size:26px">26px</option>
                  <option value="28px" style="font-size:28px">28px</option>
                  <option value="30px" style="font-size:30px">30px</option>
            </select>
          </li>          
          <li class="lineh">
             <select name="line_height_type" id="line_height_type">   
                <option value="">line-height</option>
               <option value="1">100%</option>
               <option value="1.2">120%</option>
               <option value="1.4">140%</option>
               <option value="1.6">160%</option>
               <option value="1.8">180%</option>
               <option value="2">200%</option>
            </select>
          </li>
          
         <li class="color_l">
            <select name="fontcolor_layer" id="fontcolor_layer">
                <option value="" >font-color</option>
               <option value="red">red</option>
               <option value="orange">orange</option>
               <option value="yellow">yellow</option>
               <option value="green">green</option>
               <option value="blue">blue</option>
               <option value="purple">purple</option>
               <option value="black">black</option>
               <option value="white">white</option>            
            </select>
         </li>
         
         <li>
            <select name="bgcolor_layer" id="bgcolor_layer">
             <option value="" >background-color</option>
            <option value="#FFECEC">#FFECEC</option>
            <option value="#F0B3A5">#F0B3A5</option>
            <option value="#FFD7B2">#FFD7B2</option>
            <option value="#FFE69D">#FFE69D</option>
            <option value="#D9EFB9">#D9EFB9</option>
            <option value="#BDDCD9">#BDDCD9</option>
            <option value="#B3E5FF">#B3E5FF</option>
            <option value="#85B3FF">#85B3FF</option>
            <option value="#C1C1ED">#C1C1ED</option>
            <option value="#AF8FE8">#AF8FE8</option>
            <option value="#FFFFFF">#FFFFFF</option>
            </select>      
         </li>

             <li class="fontstyle_2"><a href="#" id="b_style"><b>B</b></a></li>
             <li class="fontstyle_2"><a href="#" id="u_style"><b>U</b></a></li>
             <li class="fontstyle_2"><a href="#" id="i_style"><b><i>i</i></b></a></li>

           <tr>
             <td class="left_bt"><button id="left_bt" type="button" class="left_bt">reset</button></td>
           </tr>

         </li>
      </ul>
        <!-- boardEditor end -->
         <tr>
              <td class="adminB" id="tb_title" style="vertical-align:top; border-bottom:4px solid #eceae1; ">내용</td>
            <td class="bd_style" style="border-bottom:4px solid #eceae1;"><textarea name='contents' id="asd" style="vertical-align:bottom; overflow-x: hidden; overflow-y: scroll" class="board_style"><%=bean.getContents() %></textarea></td>
         </tr>
      </div><!-- board_editor -->   
      </table>
   </div><!-- adminF2 -->   
   <!-- 버튼 -->
      <input type=hidden name="num" value=<%=bean.getNum() %> readonly>      
      <input type=submit value="수정" class="bt">
   </form>   
      <a href='notice.do'><input type='button' value="취소" class="bt"></a>   
      <%
      }catch(Exception ex){ ex.toString(); }
      %>
</div>
</body>
</html>