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

<form method="post" action="servlet/IntentReq">
<table>
<tr>
<h4 style="color:green;">Enter the details of the book..!!</h4>
</tr>
<tr>
<td>Book Title</td>
<td><input type="text" name="booktitle"></td>
</tr>
<tr>
<td>Author</td>
<td><input type="text" name="author"></td>
</tr>
<tr>
<td><input type="submit" style="background-color: #4CAF50;font-size: 16px;color: white;" name="submit" value="submit"></td>
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