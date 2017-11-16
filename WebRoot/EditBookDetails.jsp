<%@ page import="java.sql.*,com.cc.model.*,java.util.*,com.cc.Dao.UserDao" %>
<link rel="stylesheet" type="text/css" href="MainPage.css">
<form method="post" action="servlet/PostaBook">
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
				response.sendRedirect("MyBooks.jsp");
				return;
			}
			bookid=request.getParameter("bookid");
			String userid="";
            Loginbean loginuser=null;
            loginuser = (Loginbean)(session.getAttribute("user"));
		    userid = loginuser.getUserID();
		    UserDao uDao= new UserDao();
		    PostaBookbean postabook= uDao.getBookDetails(bookid);
		    String booktitle,city,contactno,bookdescription,bookcondition,intenttype,author,bookmrp,bookmyprice;
		    booktitle=postabook.getBooktitle();
		    author=postabook.getAuthorname();
		    bookmrp=postabook.getBookMrp();
		    bookmyprice=postabook.getBookMyprice();
		    intenttype=postabook.getIntenttype();
		    bookcondition=postabook.getBookcondition();
		    bookdescription=postabook.getBookdescription();
		    city=postabook.getCity();
		    contactno=postabook.getContactno(); %>
<tr>
<td><input type="hidden" name="bookid" value="<%out.println(bookid);%>">
</td>
</tr>
<tr>
<td>Book Title: </td>
<td><input type="text" name="booktitle" value="<%out.println(booktitle);%>"/></td>
</tr>
<tr>
<td>Book condition: </td>
<td>
<select id="bookcondition" name="bookcondition">
<option value="New" <% if ( bookcondition.equals("New")){%>
 selected='selected'<%} %> >New
<option value="Used"<% if(bookcondition.equals("Used")){%>
selected='selected' <%}%> >Used
</option>
</select>
</td>
</tr>
<tr>
<td>Intent Type: </td>
<td>
<select id="intenttype" name="intenttype">
<option value="Sale" <% if (intenttype.equals("Sale")){%>
 selected='selected'<%} %> >Sale
<option value="Rent"<% if(intenttype.equals("Rent")){%>
selected='selected' <%}%> >Rent
<option value="Donate"<% if(intenttype.equals("Donate")){%>
selected='selected' <%}%> >Donate
<option value="Exchange"<% if(intenttype.equals("Exchange")){%>
selected='selected' <%}%> >Exchange
</option>
</select>
</td>
</tr>
<tr>
<td>Author:</td>
<td><input type="text" name="author" value="<%out.println(author);%>"/></td>
</tr>
<tr>
<td>Book Description: </td>
<td><TEXTAREA rows="3" cols="20" name="bookdescription" />
<%out.println(bookdescription);%>
</TEXTAREA></td>
</tr>
<tr>
<td>Book M.R.P: </td>
<td><input type="text" name="bookmrp" value="<%out.println(bookmrp);%>"/></td>
</tr>
<tr>
<td>My Price: </td>
<td><input type="text" name="bookmyprice" value="<%out.println(bookmyprice);%>"/></td>
</tr>
<tr>
<th> Edit Contact details</th>
</tr>
<tr>
<td>City </td>
<td><input type="text" name="city" value="<%out.println(city);%>"/></td>
</tr>
<tr>
<td>Contact No</td>
<td><input type="text" name="contactno" value="<%out.println(contactno);%>"/></td>
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