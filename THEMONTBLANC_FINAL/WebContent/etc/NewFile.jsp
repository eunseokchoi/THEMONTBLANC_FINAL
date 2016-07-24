<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
img.bg {
  /* Set rules to fill background */
  min-height: 100%;
  min-width: 1024px;
	
  /* Set up proportionate scaling */
  width: 100%;
  height: auto;
	
  /* Set up positioning */
  position: fixed;
  top: 0;
  left: 0;
}

@media screen and (max-width: 1024px) { /* Specific to this particular image */
  img.bg {
    left: 50%;
    margin-left: -512px;   /* 50% */
  }
}


a.mButton{
  display:block; 
  width:40px;
  height:40px;
  filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/facebook_on.png', sizingMethod='scale');
  -ms-filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/facebook_on.png', sizingMethod='scale')";
}
a:hover.mButton{
  filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/facebook_off.png', sizingMethod='scale');
  -ms-filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/facebook_off.png', sizingMethod='scale')";
}
a.mButton span{
  display:none;
}
</style>
</head>
<body>
	<a href="링크주소" class="mButton"><span>마우스오버버튼</span></a>
</body>
</html>