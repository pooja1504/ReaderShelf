<%@ page import="java.sql.*,com.cc.model.*,java.util.*,com.cc.Dao.UserDao" %>
<link rel="stylesheet" type="text/css" href="MainPage.css">
<form method="post" action="servlet/IntentReq">
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
<%%>
<%   		String intentid="";
			if ( request.getParameter("intentid") == null)
			{
				response.sendRedirect("RequestedBooks.jsp");
				return;
			}
			intentid=request.getParameter("intentid");
			String userid="";
            Loginbean loginuser=null;
            loginuser = (Loginbean)(session.getAttribute("user"));
		    userid = loginuser.getUserID();
		    UserDao uDao= new UserDao();
		    IntentReqbean req= uDao.getRequestedBookDetails(intentid);
		    String booktitle,author;
		    booktitle=req.getBooktitle();
		    author=req.getAuthor();
		   %>
<tr>
<td><input type="hidden" name="intentid" value="<%out.println(intentid);%>">
</td>
</tr>
<tr>
<td>Book Title: </td>
<td><input type="text" name="booktitle" value="<%out.println(booktitle);%>"/></td>
</tr>
<tr>
<td>Author: </td>
<td><input type="text" name="author" value="<%out.println(author);%>"/></td>
</tr>
<tr>
<td><input type="submit" name="submit" value="update"></td>
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