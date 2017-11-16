<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="index.css">
  </head>
  <body id="homebody" itemscope="" itemtype="http://schema.org/WebPage" class="nooverflow">
  <div id="wrap">
  <header>
    <nav itemprop="breadcrumb" role="navigation" class="navbar navbar-default home_nav header_color">
      <div class="container"> 
          <div class="navbar-header">
          <img itemprop="logo" src="Logo.png" alt="Reader's Shelf.in" width="250px" height="80px" class="navbar-left">
          </div>
          <div class="row">  

         <ul class="nav navbar-right">
         <ul class="nav navbar-left">
          <a class="btn home_button" href="Login.jsp"><i class="fa fa-book"></i>Sign In</a>        
          <a class="btn home_button" href="Register.jsp"><i class="fa fa-sign-in"></i>Sign up</a>
         </ul>
         </ul>
          </div>
          </div>
          </nav>
          </header>
          <div class="container">
          <form method="POST" action="Search.jsp" accept-charset="UTF-8">
          <div class="row home_note">
          <div class="col-md-8 col-md-offset-2 mtoptwe">
          <center><h2 class="headline">The only place to buy, sell, exchange books<br> within your Institute/City.</h2></center>      
          </div>
          </div>  
           <div class="row home_note">
            <div class="col-md-6 col-md-offset-3 searchbg">
            <div class="form-group">
            <div class="input-group input-group-lg col-md-offset-12">
            <span class="twitter-typeahead" style="position: relative; display: inline-block;"><input class="tt-hint" type="text" autocomplete="off" spellcheck="off" disabled="" style="position: absolute; top: 4px; left: 0px; border-color: transparent; box-shadow: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);">
            <input id="th" class="form-control books tt-query" placeholder="Search by book title" style="height: 41px; position: relative; vertical-align: top;" type="text" name="search" value="" autocomplete="off" spellcheck="false" dir="auto">
            <span style="position: absolute; left: -9999px; visibility: hidden; white-space: nowrap; font-family:Comic Sans MS; font-size: 13px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></span>           
            </span> <span class="input-group-btn">
            <button id="find" type="submit" class="searchbtn_home btn" value="search" style="font-color:white;height:41px; width:50px"><i class="fa fa-search"></i></button>
            </span>
             </div>
          </div>
          </div>
          </div>
          </form>
          </div>
          </div>
          
      </body>
</html>
<div>
          <%@ include file="Footer.jsp" %></div>