<%@ page import="java.sql.*,com.cc.model.*,com.cc.Dao.UserDao"%>
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
<%
			String bookid;
			bookid=request.getParameter("bookid");
			UserDao uDao= new UserDao();
            uDao.deletebooks(bookid); %>
</div>
</div>
</div>
</div>
