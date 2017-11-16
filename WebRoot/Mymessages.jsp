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
<h4 style="color:green;">Your Messages..!</h4>
<div class="col-md-1">
<table class="table table-hover table-bordered">
        <thead>
          <tr> 
            <th>
              EmailID
            </th>                     
            <th >
              Message
            </th> 
            <th>
              Reply
            </th>                                
          </tr>
        </thead>
        <tbody>
			<%	String userid="",bookid,msgid="",reply="";
			String sender="";
		    sender=request.getParameter("sender");
            Loginbean loginuser=null;
            loginuser = (Loginbean)(session.getAttribute("user"));
		    userid = loginuser.getUserID();
		    UserDao uDao= new UserDao();
		    List<Messagebean> msg= uDao.getIndividualMessages(userid,sender);
		    Messagebean book= new Messagebean();
		    ListIterator<Messagebean> iter = msg.listIterator();
		    while(iter.hasNext())
		    {  	
		    book = iter.next();
		    bookid=book.getbookid();
		    msgid=book.getID();
		    reply=book.getreply();
            %>
			<tr>
			<td><%out.println(sender);%></a></td>
			<td><a href='Replymessage.jsp?msgid=<%=msgid%>'><%out.println(book.getmessage());%></td>
			<td><%out.println(reply);%></td>
			<td><a href='servlet/Deletemymessages?msgid=<%=msgid%>' style="color:red;">Delete</a></td>
			</tr>
			<%} %>
</tbody>
</table>
</div>
</div>
</div>
</div>
<div width='100%'>
<%@ include file="Footer.jsp"%>
</div>