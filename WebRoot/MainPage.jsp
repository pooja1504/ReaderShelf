<%@ page import="java.sql.*,com.cc.model.*,java.util.*,com.cc.Dao.UserDao" %>
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
<div id="page-wrapper" style="min-height:616px;">
<div class="row">
</div>
<div class="row-qoute">
<div class="col-md-6 col-md-offset-3">
<center> 
<span class="box_title mtopten quote_main"><i class="fa fa-quote-left"></i> I attribute my success to this: I never gave or took any excuse. <i class="fa fa-quote-right"></i> </span>
</center>           
<br> <span class="pull-right quote_by"> - Florence Nightingale </span>
</div>
</div>
<br>
<div class="row" style="width:60%;">
<div id="section">
<table>
<tr>
<%
			String booktitle="",intenttype="",bookid="",url="";
			int count=0;
    		int n=0,i_rate;
   			 UserDao uDao= new UserDao();
		    List<PostaBookbean> books= uDao.getAllBooks();
		    PostaBookbean book= new PostaBookbean();
		    ListIterator<PostaBookbean> iter = books.listIterator();
		    while(iter.hasNext())
		    {
		    book = iter.next();
		    bookid=book.getBookid();
		    url=book.getUrl();
            %>
            <td>
				<table width='100'>
				<tr>
				<td><a href='BookDetails.jsp?bookid=<%=bookid%>'><img src="<%=url%>" alt="try again" height="100" width="100"/></a></td>
				</tr>
				<tr>
				<td><a href='BookDetails.jsp?bookid=<%=bookid%>' style="color:green;"><%out.println(book.getBooktitle());%></a></td>
				</tr>
				<tr>
				<td><input type="hidden" name="bookid" value="<%out.println(book.getBookid());%>">
				</td>
				</tr>
				<tr>
			    <td><%out.println("For"+" "+book.getIntenttype());%></td>
				</tr>
				</table>
				</td>
				<% if ( ++count%5 == 0)
				{%>
				</tr>
				<tr>
			<%}}%>
	</tr>
	</table>
	</div>
	</div>
	</div>
	<br>
	<div width='100%'>
	<%@ include file="Footer.jsp"%>
	</div>
	</html>