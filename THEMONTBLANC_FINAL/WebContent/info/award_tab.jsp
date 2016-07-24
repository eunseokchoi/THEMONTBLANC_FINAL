<html>
<head>
<title>award_tab</title>
<script src="info/css/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="info/css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">2010s'</li>
    <li class="TabbedPanelsTab" tabindex="0">2000s'</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent"><jsp:include page="../info/award2010.jsp" flush="false" /></div>
    <div class="TabbedPanelsContent"><jsp:include page="../info/award2000.jsp" flush="false" /></div>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1", {defaultTab:0});
</script>
</body>
</html>

