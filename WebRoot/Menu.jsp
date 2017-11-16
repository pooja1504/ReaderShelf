<%@page import="com.cc.model.*" %>
<%@page import="com.cc.Dao.UserDao" %>
<% String uid ="",username="";
	Loginbean user=null;
	if(request.getSession().getAttribute("user") != null)
	{
		user = (Loginbean)(session.getAttribute("user"));
		uid = user.getUserID();
		username=(String)session.getAttribute("uname");
	}
 %>
 <html>
 <form method="get" action="Search.jsp">
<link rel="stylesheet" type="text/css" href="Menu.css">
<nav width="300px">
<!--  <div width="30%">
<img src="Logo.png" width='60%'>
</div>-->
<body><h4 style="color:green;font-family="Comic Sans MS;">
 <%if(username!=null)
 {
 out.println("Hii "+username);
 } 
 %>
 </h4></body>
 <ul>
  <li><a href='MainPage.jsp'> Home </a>  </li>
  <li><a href='PostABook.jsp'>PostaBook</a></li>
  <li> <a href='IntentReq.jsp'>Requestabook</a></li>
  <li> <a href='RequestedBooks.jsp'>RequestedBooks</a></li>
  <li> <a href='MyBooks.jsp'>MyBooks</a></li>
   <li><a href='SentMessages.jsp'>Sent Messages</a></li>
  <li><a href='Conversations.jsp'>Messages</a></li>
  <li><a href='Suggestions.jsp'>Suggestions</a></li>
  <li><a href='Profiledetails.jsp'>MyAccount</a></li>
 </ul>
</nav>
</form>
</html>