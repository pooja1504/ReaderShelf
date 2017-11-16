<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Header.css">
</head>
<body>
<div class="container" style="width:90%; align:left">
<div class="navbar-header" style="width:300">
<img src="Logo.png" width='75%' >
</div>
<div class="row" >
<div class="col-md-6">
<form id="list_form" method="POST" action="Search.jsp" accept-charset="UTF-8">
            <div class="input-group input-group-lg col-md-12">
            <span class="twitter-typeahead" style="position: relative; display: inline-block;"><input class="tt-hint" type="text" autocomplete="off" spellcheck="off" disabled="" style="position: absolute; top: 4px; left: 0px; border-color: transparent; box-shadow: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);">
            <input id="th" class="form-control books tt-query" placeholder="Search by book title" style="height: 41px; position: relative; vertical-align: top;" type="text" name="search" value="" autocomplete="off" spellcheck="false" dir="auto">
            <span style="position: absolute; left: -9999px; visibility: hidden; white-space: nowrap; font-family:Comic Sans MS; font-size: 13px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></span>           
            </span> 
            <span class="input-group-btn">
            <!--   <button id="find" type="submit" class="searchbtn_home btn" value="search" style="font-color:white;height:41px; width:50px"><i class="fa fa-search"></i></button>-->
            <button value="search" id="submit" type="submit" style="color: white;height:41px;padding:8px 16px;background:#589340" class="btn btn-success"><i class="fa fa-search"></i></button></span>
            </div>
            </form>
</div>
<%if(request.getSession().getAttribute("user")!=null)
 {%>
<ul class="nav navbar-right">
<a class="btn home_button" href="servlet/Logout"><i class="fa fa-book"></i>Logout</a>
</ul>
<%} %>
</div>
</div>
</body>
</html>