<%@ page import="java.sql.*,com.cc.model.*,java.util.*,com.cc.Dao.UserDao" %>
<link rel="stylesheet" type="text/css" href="MainPage.css">
<form method="post" action="servlet/Editmydetails">
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
<tr>
<td style="color:blue" colspan=2>Your Details have been changed successfully</td>
</tr>
<%}%>
<%   		String userid="";
            Loginbean loginuser=null;
            loginuser = (Loginbean)(session.getAttribute("user"));
		    userid = loginuser.getUserID();
		    UserDao uDao= new UserDao();
		    Membersbean member= uDao.MyDetails(uid);
		    String name,city,contactno;
		    name=member.getMemberName();
		    city=member.getCity();
		    contactno=member.getContactNo(); %>
<tr>
<h4 style="color:green;">Edit Your Profile</h4>
</tr>
<tr>
<td>Name:</td>
<td><input type="text" name="name" value="<%out.println(name);%>"></td>
</tr>
<tr>
<td>Email id:</td>
<td><input type="text" name="userid" value="<%out.println(userid);%>"></td>
</tr>
<tr>
<td>City:</td>
<td><input type="text" name="city" value="<%out.println(city);%>"></td>
</tr>
<tr>
<td>Contact No:</td>
<td><input type="text" name="contactno" value="<%out.println(contactno);%>"></td>
</tr>
<tr>
<td><input type="submit" class="button" value="submit"></td>
</tr>
</table>
</div>
</div>
</div>
</div>
</form>
<div width='100%'>
	<%@ include file="Footer.jsp"%>
	</div>