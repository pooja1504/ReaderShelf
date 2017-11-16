
<%@ page import="java.sql.*"%>

<link rel="stylesheet" type="text/css" href="Menu.css">
<html>
<body>
<div id="wrap">
<div class="container">
<img src="Logo.png" width='30%'>
</div>
<div class="container">
<div class="row mtoptwe">
<div class="col" id="rcorners3">
<div class="panel panel-default">
<div class="panel heading">
<h3 class="panel-title">Create an account</h3>
</div>
<div class="panel body">
<form id="signin" style="margin-top:30px" method="post" action="servlet/Registration">
<table><% 
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
        <input id="name" class="form-control" placeholder="Name" type="text" name="name">
		</div>
		<div class="form-group">
		<input id="email" class="form-control" placeholder="Email-ID" type="text" name="email">
		</div>
		<div class="form-group">
		<input id="city" class="form-control" placeholder="City" type="text" name="city">
		</div>
		<div class="form-group">
		<input id="contactno" class="form-control" placeholder="Contact No" type="text" name="contactno">
		</div>
		<div class="form-group">
		<input id="password" class="form-control" placeholder="Password" type="password" name="password">
		</div>
		<div class="form-group">
		<input id="submit" class="btn btn-success btn-block" type="submit" value="Register">
		</div>
		<div class="row" style="margin-top:5px">
		<div class="colsubmit">
		<a href="Login.jsp" style="text-decoration:none">Already have an account? <span style="color:rgb(173, 34, 34);">Sign In.</span></a>
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