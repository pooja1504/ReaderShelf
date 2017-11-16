package com.cc.controller;

import java.io.IOException;
//import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import com.cc.Dao.UserDao;
//import com.cc.model.*;

public class DeleteBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao uDao;
	public DeleteBooks() {
		super();
		uDao= new UserDao();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String bookid;
			bookid=request.getParameter("bookid");
		    uDao.deletebooks(bookid);
		    response.sendRedirect("../MyBooks.jsp");
	}

}
