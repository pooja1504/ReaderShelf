<link rel="stylesheet" type="text/css" href="MainPage.css">
<html>
<div class="main" width="100%">
<div class="Header">
<nav itemprop="breadcrumb" role="navigation" class="navbar navbar-default header_color">
<h1><%@ include file="Header.jsp" %></h1>
</nav>
</div>
<nav class="navbar-default navbar-static-side prof_sidebar" style="background:white" role="navigation">
<div class="sidebar-collapse">
<%@ include file="Menu.jsp" %>
</div>
</nav>
<div id="page-wrapper" style="min-height: 616px;">
<div class="row">
</div>
<div class="row" style="width:60%;">
<div id="section"><form method="post" action="servlet/Suggestions">
<body>
<h4 style="color:green;">We would love to hear from you..!!</h4>
</body>
<table>
<tr>
<td>Suggestion:</td>
<td><TEXTAREA rows="6" cols="20" name="suggestion" id="suggestion"/></TEXTAREA></td>
</tr>
<tr>
<td>Contact no:</td>
<td><input type="text" name="contactno" id="contactno"/></td>
</tr>
<tr><td><input type="submit" style="background-color: #4CAF50;font-size: 16px;color: white;" name="submit" value="submit"/></td>
</tr>
</table>
</form>
</div>
</div>
</div>
</div>
</html>
<div width='100%'>
	<%@ include file="Footer.jsp"%>
	</div>