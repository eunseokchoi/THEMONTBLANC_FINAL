<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="main/css/roomslide/style.css" />
<script src="main/css/roomslide/modernizr.custom.63321.js"></script>
<title>mainEvent</title>
<style type="text/css">
.mainNotice{
	width: 500px;
	margin-left: 10px;
}
.title{
	font-size: 0.8em;
	color:#FFF;
	padding:5px;
	text-align:center;
}
.tabtable{
	color: #FFF;
	line-height: 20px;
	font-size: 0.8em;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #fff;
	padding: 5px;
}
.td1{
	width: 100px;
	text-align: left;
	float: left;
}
.td2{
	width: 150px;
	text-align: left;
	text-overflow:ellipsis; overflow:hidden; white-space:nowrap;
}
</style>
</head>
<body>
<div class="mainNotice">
	<div class="container">	
		<div class="main">
			<div id="mi-slider" class="mi-slider">
				<ul>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=banquet"><img src="main/css/roomslide/images/banquet_1.jpg" >IRIS</a></li>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=banquet"><img src="main/css/roomslide/images/banquet_2.jpg" >LOTUS</a></li>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=banquet"><img src="main/css/roomslide/images/banquet_3.jpg" >YI YUAN</a></li>
				</ul>
				<ul>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=wedding"><img src="main/css/roomslide/images/wedding_1.jpg" >GARDEN</a></li>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=wedding"><img src="main/css/roomslide/images/wedding_2.jpg" >BALLROOM</a></li>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=wedding"><img src="main/css/roomslide/images/wedding_3.jpg" >ORCHID</a></li>
				</ul>
				<ul>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=fitness"><img src="main/css/roomslide/images/facility_1.jpg">SPORTING</a></li>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=fitness"><img src="main/css/roomslide/images/facility_2.jpg">YOGA</a></li>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=fitness"><img src="main/css/roomslide/images/facility_3.jpg">TRANNING</a></li>
				</ul>
				<ul>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=dining"><img src="main/css/roomslide/images/dining_1.jpg">COCKTAIL</a></li>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=dining"><img src="main/css/roomslide/images/dining_2.jpg">BAR</a></li>
					<li><a href="./index.jsp?page=facilities/m_facilities&list=dining"><img src="main/css/roomslide/images/dining_3.jpg">BUFFET</a></li>
				</ul>
				<nav>
					<a href="#">Banquet</a>
					<a href="#">Wedding</a>
					<a href="#">Fitness</a>
					<a href="#">Dining</a>
				</nav>
			</div>
		</div>
	</div><!-- /container -->
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
	<script src="main/css/roomslide/jquery.catslider.js"></script>
	<script>
		$(function() {

			$( '#mi-slider' ).catslider();

		});
	</script>
</div>			
</body>
</html>