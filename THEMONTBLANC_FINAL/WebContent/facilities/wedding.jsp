<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>wedding.jsp</title>
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
		<div id="fa_title2">Wedding</div>
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">BALLROOM</a></li>
				<li><a href="#tabs-2">GARDEN</a></li>
				<li><a href="#tabs-3">ATRIUM</a></li>
				<li><a href="#tabs-4">CALLA</a></li>
				<li><a href="#tabs-5">ORCHID</a></li>
				<li><a href="#tabs-6">TRADITIONAL</a></li>
			</ul>
			<div id="tabs-1">
			<div id="largeImg"><img src="facilities/images/wedding/weddingballroom1.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/weddingballroom1.jpg" title="image1"><img src="facilities/images/wedding/th_weddingballroom1.jpg" /></a>
			<a href="facilities/images/wedding/weddingballroom2.jpg" title="image2"><img src="facilities/images/wedding/th_weddingballroom2.jpg" /></a>
			<a href="facilities/images/wedding/weddingballroom3.jpg" title="image3"><img src="facilities/images/wedding/th_weddingballroom3.jpg" /></a>
			</div>
			<br>
			<p>고아한 다크 그레이 톤으로 기품 있고 세련된 분위기를 연출하는 MJ HOTEL 볼룸은 웅장한 공간에서 많은 하객의 축복 속에 펼쳐지는 웨딩을 꿈꾸는 신랑, 신부에게 아름다운 순간을 약속합니다.
			<br><br>* 예약 및 문의: (02)1234-1234 / wedding@montblanc.co.kr</p>
			</div>
			  
			<div id="tabs-2">
			<div id="largeImg"><img src="facilities/images/wedding/bell_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/bell_01.jpg" title="image1"><img src="facilities/images/wedding/th_bell_01.jpg" /></a>
			<a href="facilities/images/wedding/bell_02.jpg" title="image2"><img src="facilities/images/wedding/th_bell_02.jpg" /></a>
			</div>
			<br>
			<p>종탑의 종소리를 시작으로 영화에서 본 듯한 결혼식을 할 수 있는 곳으로써 자연의 아름다움을 그대로 즐길 수 있는 독특한 결혼식으로 오래 기억될 수 있습니다.
			<br><br>* 예약 및 문의: (02)1234-1234 / wedding@montblanc.co.kr</p>
			</div>
			  
			<div id="tabs-3">
			<div id="largeImg"><img src="facilities/images/wedding/atrium_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/atrium_01.jpg" title="image1"><img src="facilities/images/wedding/th_atrium_01.jpg" /></a>
			</div><br>
			<p>아트리움은 분수가 연달아 이어져 유럽의 성을 연상케 함으로써 우아하고 기품이 느껴지는 공간입니다.<br>낭만이 가득한 유럽식 성 스타일의 종탑과 회랑에 둘러쌓인 아트리움은 세상에서 가장 특별한 분을 위한 웨딩 공간입니다.
			<br><br>* 예약 및 문의: (02)1234-1234 / wedding@montblanc.co.kr</p>
			</div>
			  
			<div id="tabs-4">
			<div id="largeImg"><img src="facilities/images/wedding/calla_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/calla_01.jpg" title="image1"><img src="facilities/images/wedding/th_calla_01.jpg" /></a>
			<a href="facilities/images/wedding/calla_02.jpg" title="image2"><img src="facilities/images/wedding/th_calla_02.jpg" /></a>
			<a href="facilities/images/wedding/calla_03.jpg" title="image3"><img src="facilities/images/wedding/th_calla_03.jpg" /></a>
			<a href="facilities/images/wedding/calla_04.jpg" title="image3"><img src="facilities/images/wedding/th_calla_04.jpg" /></a>
			</div><br>
			<p>화이트 톤의 고급스럽고 순수한 이미지를 표현한 카라 홀은<br>전동 블라인드로 개폐가 가능한 천장을 통해 자연의 빛을 느낄 수 있으며, 여기에 신비로운 음색의 파이프 오르간이 장중함을 더하여 성스러운 채플식 웨딩을 연출할 수 있습니다.
			<br><br>* 예약 및 문의: (02)1234-1234 / wedding@montblanc.co.kr</p>
			</div>
			  
			<div id="tabs-5">
			<div id="largeImg"><img src="facilities/images/wedding/orchid_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/orchid_01.jpg" title="image1"><img src="facilities/images/wedding/th_orchid_01.jpg" /></a>
			<a href="facilities/images/wedding/orchid_02.jpg" title="image2"><img src="facilities/images/wedding/th_orchid_02.jpg" /></a>
			</div>
			<br>
			<p>그레이와 아이보리 톤의 조화로 고급스럽고 모던한 분위기를 자아내는 오키드 홀은 순백의 신부를 더욱 빛나게 해줄 품격 있고 클래식한 웨딩을 선보입니다.
			<br><br>* 예약 및 문의: (02)1234-1234 / wedding@montblanc.co.kr</p>
			</div>
			  
			<div id="tabs-6">
			<div id="largeImg"><img src="facilities/images/wedding/traditional_01.jpg" alt="image1"/></div>
			<div class="thumbs">
			<a href="facilities/images/wedding/traditional_01.jpg" title="image1"><img src="facilities/images/wedding/th_traditional_01.jpg" /></a>
			<a href="facilities/images/wedding/traditional_02.jpg" title="image2"><img src="facilities/images/wedding/th_traditional_02.jpg" /></a>
			<a href="facilities/images/wedding/traditional_03.jpg" title="image3"><img src="facilities/images/wedding/th_traditional_03.jpg" /></a>
			<a href="facilities/images/wedding/traditional_04.jpg" title="image3"><img src="facilities/images/wedding/th_traditional_04.jpg" /></a>       
			</div>
			<br>
			<p>한국의 전통문화와 아름다움을 알리며, 한국적인 의식과 혼이 담긴 완성도 높은 예식을 선보이고 있습니다. 경복궁 복원에 참여한 문화재 기능자 이일구 대목수가 지은 초레청에서 옛 격식을 그대로 재현한 혼례식은 MJ HOTEL 전통 혼례만의 매력입니다.
			<br><br>* 예약 및 문의: (02)1234-1234 / wedding@montblanc.co.kr</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>