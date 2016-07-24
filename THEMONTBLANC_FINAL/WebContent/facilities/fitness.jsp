<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>fitness.jsp</title>
<link rel="stylesheet" type="text/css" href="facilities/css/styles.css"></link>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
</head>

<!--  문의사항 관련 링크와 스크립트  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<!--  문의사항 관련 스크립트  -->
<script>
	$(function() {
		$("#accordion").accordion({
			event : "click hoverintent"
		});
	});

	$.event.special.hoverintent = {
		setup : function() {
			$(this).bind("mouseover", jQuery.event.special.hoverintent.handler);
		},
		teardown : function() {
			$(this).unbind("mouseover",
					jQuery.event.special.hoverintent.handler);
		},
		handler : function(event) {
			var currentX, currentY, timeout, args = arguments, target = $(event.target), previousX = event.pageX, previousY = event.pageY;

			function track(event) {
				currentX = event.pageX;
				currentY = event.pageY;
			}
			;

			function clear() {
				target.unbind("mousemove", track).unbind("mouseout", clear);
				clearTimeout(timeout);
			}

			function handler() {
				var prop, orig = event;

				if ((Math.abs(previousX - currentX) + Math.abs(previousY
						- currentY)) < 7) {
					clear();

					event = $.Event("hoverintent");
					for (prop in orig) {
						if (!(prop in event)) {
							event[prop] = orig[prop];
						}
					}

					delete event.originalEvent;

					target.trigger(event);
				} else {
					previousX = currentX;
					previousY = currentY;
					timeout = setTimeout(handler, 100);
				}
			}

			timeout = setTimeout(handler, 100);
			target.bind({
				mousemove : track,
				mouseout : clear
			});
		}
	};
</script>

<!--  이미지 뷰어 시작  -->
<script type="text/javascript">
	$(document).ready(function() {

		/*시작할때 */
		var default_image = 'facilities/images/fitness/large/facilityimgs07.jpg';
		var default_caption = 'MJ Hotel Fitness Center';

		/*(시작) default 불러오기*/
		loadPhoto(default_image, default_caption);

		function loadPhoto($url, $caption) {
			/*Image pre-loader*/
			var img = new Image();
			jQuery(img).load(function() {
				jQuery(img).hide();
			}).attr({
				"src" : $url
			});
			$('#largephoto').css('background-image', 'url("' + $url + '")');
		}

		/* 썸네일 클릭 시*/
		$('.thumb_container').click(function() {
			var handler = $(this).find('.large_image');
			var newsrc = handler.attr('src');
			var newcaption = handler.attr('rel');
			loadPhoto(newsrc, newcaption);
		});

		/* 썸네일 애니 메이션 관련 지우기 너무 빡세다. */
		$('.thumb_container').hover(function() {
			$(this).find(".large_thumb").stop().animate({
				marginLeft : -5,
				marginTop : -5
			}, 200);

		}, function() {
			$(this).find(".large_thumb").stop().animate({
				marginLeft : 0,
				marginTop : 0
			}, 200);
		});
	});
</script>
<body>
<div id="faF3">
	<div id="fa_title2">Fitness</div>
</div>			
		<div id="container">
			<div id="containertitle">MJ Hotel Fitness Center</div>
			<div class="mainframe">
				<div id="largephoto">
					<div id="largetrans"></div>
				</div>
			</div>
			<div class="thumbnails">
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs01.jpg" class="large_thumb_image" alt="thumb" />
							<img src="facilities/images/fitness/large/facilityimgs01.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs02.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs02.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs03.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs03.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs04.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs04.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs05.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs05.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs06.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs06.jpg" class="large_image"  />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs07.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs07.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs08.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs08.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs09.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs09.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
		
				<div class="thumbnailimage">
					<div class="thumb_container">
						<div class="large_thumb">
							<img src="facilities/images/fitness/thumbnails/facilityimgs10.jpg" class="large_thumb_image" alt="thumb" /> 
							<img src="facilities/images/fitness/large/facilityimgs10.jpg" class="large_image" />
							<div class="large_thumb_border"></div>
							<div class="large_thumb_shine"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div>
			<h1 style="padding:20px; font-size: 2em; color:#6e6464;">More Information</h1>
			<div id="accordion">
				<h3 style="color: #FFFFFF; background: #DE0028;">About THE MONT BLANC Fitness Center</h3>
				<div>
					<p>THE MONT BLANC의 피트니스 센터는 65m의 조깅트랙과 런닝머신, 30여종의 최신 운동기구와 실내 수영장시설을
						보유하고 있으며 전문 트레이너가 상주하며, 체력증진을 위해 GX Room에서 요가, 필라테스, 스피닝등 각종 프로그램을
						제공합니다.</p>
				</div>
				<h3 style="color: #FFFFFF; background: #DE0028;">이용시간 및 휴일 안내</h3>
				<div>
					<p>헬스클럽은 06:00~22:00까지 운영하며, 수영장은 21:30까지 운영합니다.</p>
					<p>연중무휴로 운영되고 있는 피트니스 센터가 정부의 에너지 절약 시책 부응 및 정기시설 점검을 목적으로 매월 셋째주
						화요일 정기 휴관을 실시합니다.
				</div>
		
				<h3 style="color: #FFFFFF; background: #DE0028;">입장제안 및 문의 전화</h3>
				<div>
					<p>실내 수영장은 중학생 부터 이용가능 하며,피트니스 센터는 고등학생 부터 이용 가능합니다.</p>
					<p>*클럽 등급 이상의 객실 이용 시 수영장 무료 이용가능</p>
					<ul>
						<li>☎문의전화</li>
						<li>TEL> 02.555.5555</li>
						<li>PHONE> 010.1818.4444</li>
					</ul>
				</div>
		
				<h3 style="color: #FFFFFF; background: #DE0028;">GX 프로그램 안내</h3>
				<div>
					<ul>
						<li>19:00~20:00</li>
						<li>월 : 요가 (요기다니엘 선생님)</li>
						<li>화 : 머슬업 (아놀드 홍 선생님)</li>
						<li>수 : 바디피트니스 (숀 리 선생님)</li>
						<li>목 : 필라테스 (클라라 선생님)</li>
						<li>금 : 맨손체조 (여홍철 선생님)</li>
					</ul>
				</div>
			</div>
		</div>	
</body>
</html>
