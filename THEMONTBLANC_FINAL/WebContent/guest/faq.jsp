<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>faq</title>
<link rel="stylesheet" type="text/css" href="guest/css/faq.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	function view(num, count) {
		if ($("#view" + num).css("display") == "none") {
			$("#view" + num).attr("style", "display:");
		} else {
			$("#view" + num).attr("style", "display: none");
		}
	}
</script>
</head>
<body>
	<div id="roomF">
		<div class="headTit">
			<h4 id="room_title2">F A Q</h4>
		</div>
		<div class="msgBox">
			<img alt="고객의소리" src="guest/images/faqMsg1.png">
		</div>
		<div class="hTit hTit1">
			<img alt="FAQ_자주하는 질문" src="guest/images/faqTit1.gif">
		</div>

		<div class="faqList">
			<ul>
				<li class="first">
					<a href="javascript:view('1','7');" class="fTit">
						<h3 class="tit">
							<em class="icoQ">Q.</em> 4인이 한 방에서 사용 가능한가요?
						</h3>
					</a>
					<div style="display: none" class="msg" id="view1">
						<em class="icoA">A.</em>
						<p>
							호텔은 기본적으로 2인 1실을 기준으로 하고 있습니다. <br> 어린이를 동반할 경우, 4인 1실이 가능하나
							성인인 경우 3인 1실까지 가능합니다. <br> 이 경우, 싱글침대와 더블침대가 함께 있는 ‘스탠다드 룸’을
							추천합니다. <br> 어린이를 동반한 4인 1실일 경우 온돌과 침대가 함께 있는 ‘디럭스 룸'이 활용도가
							높습니다.<br> 자세한 룸 정보는 홈페이지를 참조하시기 바랍니다.
						</p>
					</div>
				</li>

				<li><a href="javascript:view('2','7');" class="fTit">
						<h3 class="tit">
							<em class="icoQ">Q.</em> 반려동물의 입장이 가능한가요?
						</h3>
				</a>
					<div style="display: none" class="msg" id="view2">
						<em class="icoA">A.</em>
						<p>
							안내견을 제외한 애완견 등 동물입장은 불가합니다. <br> 이점 양해 부탁드립니다.
						</p>
					</div></li>

				<li><a href="javascript:view('3','7');" class="fTit">
						<h3 class="tit">
							<em class="icoQ">Q.</em> 객실예약은 어떻게 하나요?
						</h3>
				</a>
					<div style="display: none" class="msg" id="view3">
						<em class="icoA">A.</em>
						<p>
							전화로 예약하실 경우 아래로 전화주시면, 담당직원이 친절하게 안내해 드립니다. <br> 홈페이지를 통해
							예약을 하실 경우에는, 호텔 사이트의 상단에 있는 "Reservations"을 클릭하시고, 안내되는 프로세스에 따라
							정보를 입력하시면 됩니다.<br> 접수된 예약에 대해서는 이메일로 내역을 받아보실 수 있습니다.
						</p>
					</div></li>

				<li><a href="javascript:view('4','7');" class="fTit">
						<h3 class="tit">
							<em class="icoQ">Q.</em> THE MONT BLANC 호텔에서 결혼식을 하면 어떤 혜택을 주나요?
						</h3>
				</a>
					<div style="display: none" class="msg" id="view4">
						<em class="icoA">A.</em>
						<p>THE MONT BLANC 호텔에서 결혼식을 올리시면, 결혼식 당일 호텔에서의 1박을 무료로 제공해
							드립니다.</p>
					</div></li>

				<li><a href="javascript:view('5','7');" class="fTit">
						<h3 class="tit">
							<em class="icoQ">Q.</em> THE MONT BLANC 호텔에서 결혼을 하려면 어떻게 해야 하나요?
						</h3>
				</a>
					<div style="display: none" class="msg" id="view5">
						<em class="icoA">A.</em>
						<p>
							웨딩 행사는 하객수에 따라 대연회장인 2층의 다이너스티홀과 영빈관 등에서 열 수 있습니다. <br> 결혼식
							비용은 음식 값과 꽃장식, 무대장치 등에 따라 다양하게 달라질 수 있습니다. <br> 최근에는 일반적인 웨딩
							행사가 아닌 특별한 기획에 따른 행사를 원하는 고객이 많으셔서 몽블랑호텔의 웨딩 전담 매니저가 고급스러운 기획으로
							행사 진행을 도와드립니다. <br> 몽블랑호텔에서의 웨딩은, 집안의 경사이자 큰 행사인 웨딩행사에 초청된
							손님들에게 예를 갖추는 데 손색이 없는 음식과 행사 진행으로 정평이 나 있습니다.<br> 홈페이지를 통해서도
							신청하실 수 있으며, 메인화면 아래에 Wedding를 클릭하시고, 정보를 입력하시면 48시간 이내에 웨딩 전담
							매니저가 고객께서 요청하신 내용에 대한 정보를 토대로 상담 전화를 드립니다.
						</p>
					</div></li>

				<li><a href="javascript:view('6','7');" class="fTit">
						<h3 class="tit">
							<em class="icoQ">Q.</em> 피트니스 클럽 이용시, 대여물품 (운동복, 운동화 등)은 매일 대여를
							해야 하나요?
						</h3>
				</a>
					<div style="display: none" class="msg" id="view6">
						<em class="icoA">A.</em>
						<p>
							대여물품은 1회 사용 후, 반납하셔야 합니다. <br> 이후 사용을 원하실 경우에는 다시 대여를 하셔야
							합니다.
						</p>
					</div></li>

				<li class="last"><a href="javascript:view('7','7');"
					class="fTit">
						<h3 class="tit">
							<em class="icoQ">Q.</em> 객실에 공통으로 적용되는 서비스는 무엇인가요?
						</h3>
				</a>
					<div style="display: none" class="msg" id="view7">
						<em class="icoA">A.</em>
						<p>THE MONT BLANC 호텔에서 제공해 드리는 공통 서비스는 다음과 같습니다.</p>
						<p>&nbsp;</p>
						<p>
							객실 시설<br> - 고급 린넨, 거위털 이불, 오리털 베개, 모던한 욕실<br> - 객실에 따라
							다양한 형태의 욕실 : Shower-booth type / Bath-tub type<br> - 아로마테라피
							고급 욕실용품 : 샴푸, 컨티셔터, 샤워젤, 비누<br> - 42” Full HD TV<br> -
							무료 인터넷 전용선<br> - 무료생수, 커피
						</p>
						<p>&nbsp;</p>
						<p>
							부대 시설<br> - Modern & Delight Banquet (SOYOO premium buffet)<br>
							- BBQ Loft Garden (HEGUNL 해그늘)<br> - Real Espresso Cafe
							(Cafe ARCO)<br> - Body & Foot Skincare (강남스킨케어)<br> -
							상상력을 자극하는 키즈클럽 (KIDS CLUB)<br> - 다양한 미팅이 가능한 미팅룸 (VIP Room,
							Conference Room)
						</p>
					</div></li>
			</ul>
		</div>
		<div class="hTit hTit2">
			<img alt="문의하기" src="guest/images/faqTit2.gif">
		</div>
		<div class="msg1">
			<img alt="문의하기2" src="guest/images/faqMsg2.png">
		</div>
		<center>
			<div class="linkBox">
				<ul class="list">
					<li class="first last">
					<a class="btnAcmd2" href="./index.jsp?page=guest/m_guest&list=G_requestInsert">
						<img alt="문의하기3" src="guest/images/faqLinkBoxAcmd2.gif"></a></li>
				</ul>
			</div>
		</center>
</body>
</html>