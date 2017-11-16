package com.cc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cc.Dao.UserDao;
import com.cc.model.Loginbean;
import com.cc.model.Membersbean;

public class Registration extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	
	private UserDao uDao;
	
	public Registration() {
		super();
		uDao= new UserDao();
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Membersbean memberBean=new Membersbean();
		
		memberBean.setMemberName(request.getParameter("name"));
		memberBean.setUserID(request.getParameter("email"));
		memberBean.setCity(request.getParameter("city"));
		memberBean.setContactNo(request.getParameter("contactno"));
		memberBean.setPassword(request.getParameter("password"));
		String userid=request.getParameter("userid");	
			HttpSession session=request.getSession(true);
			
		Membersbean Member=uDao.getMember(memberBean);
		
		if(Member.getUserID()==null){
			uDao.addMember(memberBean);
			session.setAttribute("fullname",memberBean.getMemberName());
			session.setAttribute("password",memberBean.getPassword());
			session.setAttribute("email",memberBean.getUserID());
			session.setAttribute("contactno",memberBean.getContactNo());
			session.setAttribute("city",memberBean.getCity());
			session.setAttribute("user", memberBean);
			response.sendRedirect("../Login.jsp");
		}
		else
		{
			
			out.println("This user already exists");
			response.sendRedirect("../Register.jsp?er=1");
		}
		out.flush();
		out.close();
		
	}

}
