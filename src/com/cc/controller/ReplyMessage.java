package com.cc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cc.Dao.UserDao;
import com.cc.model.Loginbean;
import com.cc.model.Messagebean;

/**
 * Servlet implementation class ReplyMessage
 */
@WebServlet("/ReplyMessage")
public class ReplyMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
private UserDao uDao;
	
	public ReplyMessage() {
		super();
		uDao= new UserDao();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String to="",reply="";
		to=request.getParameter("to");
	    reply=request.getParameter("reply");
		Messagebean msg=new Messagebean();
		msg.setreply(reply);
		msg.setID(request.getParameter("msgid"));
		String uid ="";
		Loginbean user=null;
		HttpSession session=request.getSession(true);
		if ( request.getSession().getAttribute("user") != null)
		{
			user = (Loginbean)(session.getAttribute("user"));
			uid = user.getUserID();
		}
		uDao.addReply(msg);
		response.sendRedirect("../Mymessages.jsp?sender=" + to);
	}

}
