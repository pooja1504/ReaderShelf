<%@ page import="java.sql.*"%>
<html>
<body>
<link rel="stylesheet" type="text/css" href="Menu.css">
<div id="wrap">
<div class="container">
<img src="Logo.png" width='30%'>
</div>
<div class="container">
<div class="row mtoptwe">
<div class="col"  id="rcorners2">
<div class="panel panel-default">
<div class="panel heading">
<h3 class="panel-title">Sign In</h3>
</div>
<div class="panel body">
<form id="signin" style="margin-top:30px" method="post" action="servlet/Login">
<%
int er1=-1;
try
{
er1=Integer.parseInt(request.getParameter("er"));
}
catch(Exception e)
{
	
}
 if ( er1==1)
{%>
<h4 style="color:red" colspan=2> Invalid Username or Password</h4>
<%}%>
<div class="form-group">
<input id="userid" class="form-control" placeholder="Email ID" type="text" name="userid">
</div>
<div class="form-group">
<input id="password" class="form-control" placeholder="Password" type="password" name="password">
</div>
<div class="form-group">
<input id="sign_btn" class="btn btn-success btn-block" type="submit" value="Sign In">
</div>
<div class="row" style="margin-top:5px">
<div class="colsubmit">
<a href="Register.jsp" style="text-decoration:none">Don't have an account yet? <span style="color:rgb(173, 34, 34);">Register now.</span></a>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</body></html>
<div width='100%'>
	<%@ include file="Footer.jsp"%>
	</div>