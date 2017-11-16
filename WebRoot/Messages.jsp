<%@ page import="java.sql.*,com.cc.model.*,java.util.*,com.cc.Dao.UserDao" %>
<link rel="stylesheet" type="text/css" href="MainPage.css">
<form method="post" action="servlet/Messages">
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
<%
String bookid="";
String userid="";
 bookid=request.getParameter("bookid"); 
 UserDao uDao= new UserDao();
 PostaBookbean postabook= uDao.getBookDetails(bookid);
 userid=postabook.getUserID();
 %>
<br>
<br>
<table>
<tr>
<td><input type="hidden" name="bookid" value="<%=bookid%>"></td></tr>
<tr>
<td>To</td>
<td><input type="text" name="to" value="<%=userid%>"></td>
</tr>
<tr>
<td>Message</td>
<td><TEXTAREA rows="3" cols="20" name="message" id="message"/></TEXTAREA></td>
</tr>
<tr>
<td><input type="submit" class="button" name="submit" id="submit" value="Send" /></td>
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