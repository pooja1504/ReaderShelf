package com.cc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cc.model.*;
import com.cc.Dao.UserDao;
import javax.servlet.http.HttpSession;


public class Suggestions extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserDao uDao;
	public Suggestions() {
		super();
		uDao= new UserDao();	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userid;
		SuggestionBean suggest=new SuggestionBean();
		suggest.setsuggestion(request.getParameter("suggestion"));
		suggest.setContactNo(request.getParameter("contactno"));
		Loginbean loginuser=null;
		HttpSession session=request.getSession(true);
        loginuser = (Loginbean)(session.getAttribute("user"));
	    userid = loginuser.getUserID();
	    suggest.setUserID(userid);
		uDao.addSuggestions(suggest);
		response.sendRedirect("../MainPage.jsp?er=1");
	}

}
