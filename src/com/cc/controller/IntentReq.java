package com.cc.controller;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cc.Dao.UserDao;
import com.cc.model.IntentReqbean;
import com.cc.model.Loginbean;

public class IntentReq extends HttpServlet {
private UserDao uDao;
	
	public IntentReq() {
		super();
		uDao= new UserDao();
	}
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String intentid;
			intentid=request.getParameter("intentid");
		    uDao.deleteRequestedbooks(intentid);
		    response.sendRedirect("../RequestedBooks.jsp");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String submit = request.getParameter("submit");
		IntentReqbean req=new IntentReqbean();
		req.setBooktitle(request.getParameter("booktitle"));
		req.setAuthor(request.getParameter("author"));
		if (submit.equals("submit"))
		{
		String uid="";
		Loginbean user=null;
		HttpSession session=request.getSession(true);
		if ( request.getSession().getAttribute("user") != null)
		{
			user = (Loginbean)(session.getAttribute("user"));
			uid = user.getUserID();
		}
			req.setUserID(uid);
			uDao.IntentReq(req);
		}
		else if(submit.equals("update"))
		{
			req.setIntentid(request.getParameter("intentid"));
			uDao.UpdateRequestedBooks(req);
	    }
			response.sendRedirect("../RequestedBooks.jsp");
	}

}
