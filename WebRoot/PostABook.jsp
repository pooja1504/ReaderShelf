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
<h3 align="center" class="box_title" style="margin-bottom:20px;color:green;">Book Details</h3>
<form method="post" action="servlet/PostaBook" enctype="multipart/form-data">
<table>
<tr>
<td>Book Title: </td>
<td><input type="text" name="booktitle" id="booktitle"/></td>
</tr>
<tr>
<td>Book condition: </td>
<td><input type="radio" name="bookcondition" value="New"/>New
<input type="radio" name="bookcondition" value="Used"/>Used </td>
</tr>
<tr>
<td>Intent Type: </td>
<td><select name="intenttype" id="intenttype">
     <option>Sale</option>
     <option>Rent</option>
     <option>Donate</option> 
     <option>Exchange</option>  
</select></td>
</tr>
<tr>
<td>Author:</td>
<td><input type="text" name="author" id="author"/></td>
</tr>
<tr>
<td>Book Description: </td>
<td><TEXTAREA rows="3" cols="20" name="bookdescription" id="bookdescription"/></TEXTAREA></td>
</tr>
<tr>
<td>Book M.R.P: </td>
<td><input type="text" name="bookmrp" id="bookmrp"/></td>
</tr>
<tr>
<td>My Price: </td>
<td><input type="text" name="bookmyprice" id="bookmyprice"/></td>
</tr>
<tr>
<td>Book Image:</td>
<td>
<input type="file" name="bookimage"/>
</td>
</tr>
</table>
<h4 style="color:green;">Give your contact details</h4>
<table>
<tr>
<td>City: </td>
<td><input type="text" name="city" id="city"/></td>
</tr>
<tr>
<td>Phone No: </td>
<td><input type="text" name="contactno" id="contactno"/></td>
</tr>
<tr>
<td><input type="submit" style="background-color: #4CAF50;font-size: 16px;color: white;" name="submit" id="submit" value="Post"/></td>
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