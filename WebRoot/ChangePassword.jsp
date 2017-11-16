<%@ page import="java.sql.*"%>
<form method="post" action="servlet/Changepassword">
<link rel="stylesheet" type="text/css" href="MainPage.css">
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
<div id="section">
<table>
<h4 style="color:green;font-family=Comic Sans MS;">CHANGE PASSWORD</h4>
<tr><td> &nbsp &nbsp &nbsp</td></tr>
<tr>
<td>Old Password:</td>
<td><input type="password" name="oldpassword" id="oldpassword"></td>
</tr>
<tr>
<td>New Password:</td>
<td><input type="password" name="newpassword" id="newpassword"></td>
</tr>
<tr>
<td>Confirm Password:</td>
<td><input type="password" name="confirmpassword" id="confirmpassword"></td>
</tr>
<tr>
<td><input type="submit" class="button" name="submit" id="submit"></td></tr>
</table>
</div>
</div>
</div>
</div></form>
<div width='100%'>
	<%@ include file="Footer.jsp"%>
	</div>