<%@ page import="java.sql.*,com.cc.model.*,java.util.*,com.cc.Dao.UserDao" %>
<link rel="stylesheet" type="text/css" href="MainPage.css">
<link rel="stylesheet" type="text/css" href="MyBooks.css">
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
<form method="post" action="Editmydetails.jsp">
<table>
<tr>
  <td> <a href='Profiledetails.jsp' class="button"> Profile Details </a>  </td>
  <td> <a href='ChangePassword.jsp' class="button">Privacy</a></td>
</tr>
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
<th style="color:green;">Profile Details</th>
</tr>
<tr>
<td>Name:</td>
<td><%out.println(name);%></td>
</tr>
<tr>
<td>Email id:</td>
<td><%out.println(userid);%></td>
</tr>
<tr>
<td>City:</td>
<td><%out.println(city);%></td>
</tr>
<tr>
<td>Contact No:</td>
<td><%out.println(contactno);%></td>
</tr>
<tr>
<td><input type="submit" class="button" value="Edit"></td>
</tr>
</table>
</form>
</div>
</div>
</div>
</div>
<div width='100%'>
<%@ include file="Footer.jsp"%>
</div>