package com.cc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cc.Dao.UserDao;
import com.cc.model.ChangePasswordbean;
import com.cc.model.Loginbean;

public class Changepassword extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserDao uDao;
	public Changepassword() {
		super();
		uDao= new UserDao();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if ( request.getSession().getAttribute("user") == null)
		{
		
			response.sendRedirect("");
			return;
		}
		ChangePasswordbean changepassBean=new ChangePasswordbean();
        String uid ="";
		Loginbean user=null;
		HttpSession session=request.getSession(true);
		user = (Loginbean)(session.getAttribute("user"));
		uid = user.getUserID();
		String oldpassword,newpassword,confirmpassword;
		oldpassword=request.getParameter("oldpassword");
		newpassword=request.getParameter("newpassword");
		confirmpassword=request.getParameter("confirmpassword");
		if(oldpassword.equals("") || newpassword.equals("") || confirmpassword.equals(""))
		{
			response.sendRedirect("../ChangePassword.jsp");
		}
		else
		{
		changepassBean.setOldpassword(oldpassword);
        changepassBean.setNewpassword(newpassword);
        changepassBean.setConfirmpassword(confirmpassword);
        changepassBean.setUserid(uid);
		}
		PrintWriter out = response.getWriter();
		if (uDao.ChangePassword(changepassBean))
		{
			response.sendRedirect("../Changepasswordack.jsp");
		}
		else
		{
			out.println("Error.Try again..!!");
		}
		out.flush();
		out.close();
	}

}
