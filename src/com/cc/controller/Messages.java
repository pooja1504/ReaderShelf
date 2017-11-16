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
 * Servlet implementation class Messages
 */
@WebServlet("/Messages")
public class Messages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao uDao; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Messages() {
        super();
        uDao= new UserDao();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String to="",message="",bookid;
		to=request.getParameter("to");
		bookid=request.getParameter("bookid");
		message=request.getParameter("message");
		Messagebean msg=new Messagebean();
		msg.setbookid(bookid);
		msg.setmessage(message);
		String uid ="";
		Loginbean user=null;
		HttpSession session=request.getSession(true);
		if ( request.getSession().getAttribute("user") != null)
		{
			user = (Loginbean)(session.getAttribute("user"));
			uid = user.getUserID();
		}
	    msg.setuserid(uid);
		uDao.addMessages(msg);
		response.sendRedirect("../SentMessages.jsp");
	}

}
