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
<h4 style="color:green;">Your Posted Books..!</h4>
<div class="col-md-1">
<table class="table table-hover table-bordered">
        <thead>
          <tr>
            <th>
              Name
            </th>
            <th>
              Intent
            </th>                      
            <th  colspan='2'>
              Action
            </th>            
          </tr>
        </thead>
        <tbody>
<%	String userid="",bookid;
            Loginbean loginuser=null;
            //System.out.println(uid);
            loginuser = (Loginbean)(session.getAttribute("user"));
		    userid = loginuser.getUserID();
		    UserDao uDao= new UserDao();
		    List<PostaBookbean> books= uDao.getBooks(userid);
		    PostaBookbean book= new PostaBookbean();
		    ListIterator<PostaBookbean> iter = books.listIterator();
		    while(iter.hasNext())
		    {
		    book = iter.next();
		    bookid=book.getBookid();
            %>
			<tr>
			<td><%out.println(book.getBooktitle());%></td>
			<td><%out.println(book.getIntenttype());%></td>
			<td><a href='EditBookDetails.jsp?bookid=<%=bookid%>' style="color:green;">Edit</a></td>
			<td><a href='servlet/PostaBook?bookid=<%=bookid%>' style="color:red;">Delete</a></td>
			</tr>
			<%} %>
</tbody>
</table>
<form action="PostABook.jsp" method="post">
<table>		
<input type="submit" class="button" id="submit" name="submit" value="Post another Book">
</table>
</form>
</div>
</div>
</div>
</div>
<div width='100%'>
	<%@ include file="Footer.jsp"%>
	</div>	