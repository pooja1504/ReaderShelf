package com.cc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cc.Dao.UserDao;
import com.cc.model.*;

public class Editmydetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao uDao;
	public Editmydetails() {
		super();
		uDao= new UserDao();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uid ="";
		Loginbean user=null;
		HttpSession session=request.getSession(true);
		if ( request.getSession().getAttribute("user") != null)
		{
			user = (Loginbean)(session.getAttribute("user"));
			uid = user.getUserID();
		}
		Membersbean member=new Membersbean();
		member.setMemberName(request.getParameter("name"));
		member.setCity(request.getParameter("city"));
		member.setContactNo(request.getParameter("contactno"));
		member.setUserID(uid);
		uDao.UpdateMydetails(member);
        response.sendRedirect("../Profiledetails.jsp?er=1");
	}
}
