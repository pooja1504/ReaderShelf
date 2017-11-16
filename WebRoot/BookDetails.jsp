<%@ page import="java.sql.*,com.cc.model.*,java.util.*,com.cc.Dao.UserDao" %>
<html>
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
<%%>
<%   		String bookid="";
			if ( request.getParameter("bookid") == null)
			{
				response.sendRedirect("MainPage.jsp");
				return;
			}
			bookid=request.getParameter("bookid");
			String userid="";
            Loginbean loginuser=null;
            loginuser = (Loginbean)(session.getAttribute("user"));
		    userid = loginuser.getUserID();
		    UserDao uDao= new UserDao();
		    PostaBookbean postabook= uDao.getBookDetails(bookid);
		    String userId,booktitle,city,contactno,bookdescription,bookcondition,intenttype,author,bookmrp,bookmyprice,url;
		    booktitle=postabook.getBooktitle();
		    userId=postabook.getUserID();
		    author=postabook.getAuthorname();
		    bookmrp=postabook.getBookMrp();
		    bookmyprice=postabook.getBookMyprice();
		    intenttype=postabook.getIntenttype();
		    url=postabook.getUrl();
		    bookcondition=postabook.getBookcondition();
		    bookdescription=postabook.getBookdescription();
		    city=postabook.getCity();
		    contactno=postabook.getContactno();
%>
<tr>
<td><input type="hidden" name="bookid" value="bookid"></td>
</tr>
<tr>
<td><img src="<%=url%>" alt="try again" height="100" width="100"/></td>
<td>
<tr>
<td>Book Title: </td>
<td><%out.println(booktitle);%></td>
</tr>
<tr>
<td>Book condition: </td>
<td><%out.println(bookcondition);%></td>
</tr>
<tr>
<td>Intent Type: </td>
<td><%out.println(intenttype);%></td>
</tr>
<tr>
<td>Author:</td>
<td><%out.println(author);%></td>
</tr>
<tr>
<td>Book Description: </td>
<td><%out.println(bookdescription);%></td>
</tr>
<tr>
<td>Book M.R.P: </td>
<td><%out.println(bookmrp);%></td>
</tr>
<tr>
<td>My Price: </td>
<td><%out.println(bookmyprice);%></td>
</tr>
<tr>
<td>City </td>
<td><%out.println(city);%></td>
</tr>
<tr>
<td>Contact No</td>
<td><%out.println(contactno);%></td>
</tr>
<tr>
<td>Email ID</td>
<td><%out.println(userId);%></td>
</tr>
<tr>
<td><a href='Messages.jsp?bookid=<%=bookid%>' class="button">Send Message</a></td>
</tr>
</table>
</div>
</div>
</div>
</div>
</html>
	<div width='100%'>
	<%@ include file="Footer.jsp"%>
	</div>