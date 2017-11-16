package com.cc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cc.Dao.UserDao;

/**
 * Servlet implementation class DeleteMessages
 */
@WebServlet("/DeleteMessages")
public class Deletemymessages extends HttpServlet {
	private static final long serialVersionUID = 1L;
private UserDao uDao;
	
	public Deletemymessages() {
		super();
		uDao= new UserDao();
	}
    public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String msgid;
			msgid=request.getParameter("msgid");
		    uDao.deleteSentbooks(msgid);
		    response.sendRedirect("../Mymessages.jsp");
	}

}
