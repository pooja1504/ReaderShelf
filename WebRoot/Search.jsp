<%@ page import="java.sql.*,com.cc.model.*,java.util.*,com.cc.Dao.UserDao" %>
<link rel="stylesheet" type="text/css" href="MainPage.css">
<div class="main" width="100%">
<div class="Header">
<nav itemprop="breadcrumb" role="navigation" class="navbar navbar-default header_color">
<h1><%@ include file="Header.jsp" %></h1>
</nav>
</div>
<%
if(request.getSession().getAttribute("user")!= null)
{
%>
<nav class="navbar-default navbar-static-side prof_sidebar" style="background:white" role="navigation">
<div class="sidebar-collapse">
<%@ include file="Menu.jsp" %>
</div>
</nav>
<%} %>
<div id="page-wrapper" style="min-height: 616px;">
<div class="row">
</div>
<div class="row" style="width:60%;">
<div id="section">
<table>
<%
			String bookname,bookid,url;
			bookname=request.getParameter("search");
 			UserDao uDao= new UserDao();
		    List<PostaBookbean> books= uDao.SearchBooks(bookname); 
		     PostaBookbean book= new PostaBookbean();
		    ListIterator<PostaBookbean> iter = books.listIterator();
		    while(iter.hasNext())
		    {
		    book = iter.next();
		    bookid=book.getBookid();
		    url=book.getUrl();
		    if(request.getSession().getAttribute("user")==null)
            {%>
            <tr>
			<td><a href='Login.jsp'><img src="<%=url%>" alt="try again" height="100" width="100"/></a></td>
			</tr>
		    <tr>
			<td><a href="Login.jsp" style="color:green;"><%out.println(book.getBooktitle());%></a></td></tr>
			<tr><td>By <%out.println(book.getAuthorname());%></td></tr>
           <%} 
           else
           {%>
		    <tr>
			<td><a href='BookDetails.jsp?bookid=<%=bookid%>'><img src="<%=url%>" alt="try again" height="100" width="100"/></a></td>
			</tr>
		    <tr>
			<td><a href="BookDetails.jsp?bookid=<%=bookid%>" style="color:green;"><%out.println(book.getBooktitle());%></a></td></tr>
			<tr><td>By <%out.println(book.getAuthorname());%></td></tr>
			<%}
			}%>
</table>
</div>
</div>
</div>
<div width='100%'>
	<%@ include file="Footer.jsp"%>
	</div>