<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<script src="info/css/jquery-1.7.2.js"></script>
<script type="text/javascript" src="info/css/jquery.lightbox-0.5.js"></script>
<link rel="stylesheet" type="text/css" href="info/css/jquery.lightbox-0.5.css" media="screen" />
<style type="text/css">
	#montblancF{
		background-image:url(info/images/world.jpg);
		height:373px;
	   	padding:20px;
	   	color:black;
	   	line-height:700px;
	}
	#mapkorea{
		position: absolute;
		top:70px;
		left: 800px;
	}
	#maprussia{
		position: absolute;
		top:20px;
		left: 690px;
	}
	#mapchina{
		position: absolute;
		top:75px;
		left: 710px;
	}
	#mapusa{
		position: absolute;
		top:60px;
		left: 240px;
}
</style>
</head>
<body>
<div id="container">
	<div id="content_left">
	<div id="montblancF">Find a hotel</div>
		<jsp:include page="findhotel_tab.jsp" flush="false" />
	    <div id="mapkorea">
	      <a href="info/images/1.jpg" title="Lorem Ipsum is simply and typesetting industry" >
	      <img src="info/images/map.png" width="40" height="40" border="0" alt="" class="pic_right" /></a>
	    </div>
	    <div id="maprussia">
	      <a href="info/images/1.jpg" title="Lorem Ipsum is simply and typesetting industry">
	      <img src="info/images/map.png" width="40" height="40" border="0" alt="" class="pic_left" /></a>
	    </div>
	    <div id="mapchina">
	      <a href="info/images/5.jpg" title="Lorem Ipsum is simply and typesetting industry">
	      <img src="info/images/map.png" width="40" height="40" border="0" alt="" class="pic_left" /></a>
	    </div>
	    <div id="mapusa">
	      <a href="info/images/5.jpg" title="Lorem Ipsum is simply and typesetting industry">
	      <img src="info/images/map.png" width="40" height="40" border="0" alt="" class="pic_left" /></a>
	    </div>
	</div>
</div>
<!-- jQuery , javaScript Code ----->
<script>
  $("#content_left a").lightBox();
</script>		
</body>
</html>