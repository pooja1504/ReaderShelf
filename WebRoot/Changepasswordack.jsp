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
<h1 style="color:green;">Your Password has been changed..!!</h1>
</div>
</div>
</div>
</div>
<div width='100%'>
<%@ include file="Footer.jsp"%>
</div>