<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>banquet.jsp</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#tabs" ).tabs(
   		$(".thumbs a").click(function(){	
   			var path = $(this).attr("href");
   			$(this).parent().prev().find("img").attr({ src: path });
   			$(this).parent().prev().find("img").css("opacity","0.5").stop().animate({opacity:2},4000);
   			return false;
   		})		
    );
  });
</script>
</head>
<body>
<div id="faF">
	<div id="faF2">
		<div id="fa_title2">Banquet</div>
		<div id="tabs">
			<ul>
			  <li><a href="#tabs-1">IRIS</a></li>
			  <li><a href="#tabs-2">YI YUAN</a></li>
			  <li><a href="#tabs-3">LOTUS</a></li>
			</ul> 
			<div id="tabs-1">
				<div id="largeImg"><img src="facilities/images/banqnet/iris_01.jpg" alt="image1" /></div>
				<div class="thumbs">
					<a href="facilities/images/banqnet/iris_01.jpg" title="image1"><img src="facilities/images/banqnet/th_iris_01.jpg" /></a>
					<a href="facilities/images/banqnet/iris_02.jpg" title="image2"><img src="facilities/images/banqnet/th_iris_02.jpg" /></a>
				</div>
				<br>
			 	<p>편안하고 세련된 이미지의 아이리스 홀은 앞면 전체를 이루고 있는 유리너머의 소나무들이 돋보이는 장소로 로맨틱한 하우스 웨딩 파티는 물론 각종 세미나, 워크샵, 가족연회 등을 연출하기에 좋습니다.
				<br><br>* 예약 및 문의: (02)1234-1234 / wedding@montblanc.co.kr</p>
			</div>
			<div id="tabs-2">
				<div id="largeImg"><img src="facilities/images/banqnet/wyiyuan_01.jpg" alt="image1"/></div>
				<div class="thumbs">
				<a href="facilities/images/banqnet/wyiyuan_01.jpg" title="image1"><img src="facilities/images/banqnet/th_wyiyuan_01.jpg" /></a>
				<a href="facilities/images/banqnet/wyiyuan_02.jpg" title="image2"><img src="facilities/images/banqnet/th_wyiyuan_02.jpg" /></a>
				<a href="facilities/images/banqnet/wyiyuan_03.jpg" title="image2"><img src="facilities/images/banqnet/th_wyiyuan_03.jpg" /></a>        
				</div>
				<br>
				<p>MJ HOTEL의 아름다운 자연경관을 배경으로 프라이빗한 파티형 돌잔치,
				<br>가족연회, 하우스웨딩, 비즈니스 모임에 적합한 공간입니다.
				<br><br>* 예약 및 문의: (02)1234-1234 / wedding@montblanc.co.kr</p>
			</div> 
			<div id="tabs-3">
				<div id="largeImg"><img src="facilities/images/banqnet/Lotus_01.jpg" alt="image1"/></div>
				<div class="thumbs">
				<a href="facilities/images/banqnet/Lotus_01.jpg" title="image1"><img src="facilities/images/banqnet/th_Lotus_01.jpg" /></a>
				</div>
				<br>
				<p>소규모 파티와 비즈니스 모임이 가능한 다목적 연회장으로 아치형 천장이
				<br>아늑하고 세련된 분위기를 연출하여 고품격 프라이빗 모임에 적합한 장소입니다.
				<br><br>* 예약 및 문의: (02)1234-1234 / wedding@montblanc.co.kr</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>