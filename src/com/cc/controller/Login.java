package com.cc.controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cc.Dao.UserDao;
import com.cc.model.Loginbean;
import javax.servlet.http.Cookie;

public class Login extends HttpServlet {
private static final long serialVersionUID = 1L;

	private UserDao uDao;
	public Login() {
		super();
		uDao= new UserDao();	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
		Loginbean LoginBean=new Loginbean();
		String userid=request.getParameter("userid");
		
		//String password=request.getParameter("password");		
		LoginBean.setUserID(request.getParameter("userid"));
		LoginBean.setPassword(request.getParameter("password"));
		//System.out.println(LoginBean.getUserID());
		if(uDao.getUser(LoginBean)){
			HttpSession session=request.getSession(true);
			session.setAttribute("user", LoginBean);
			session.setAttribute("uname", uDao.getUsername(LoginBean.getUserID()));
			//System.out.println(session.getAttribute("user"));
			Cookie LoginCookie = new Cookie("userid",userid);
			response.addCookie(LoginCookie);
			response.sendRedirect("../MainPage.jsp");
		}
		else
		{
			//System.out.println("Error");
			response.sendRedirect("../Login.jsp?er=1");
		}
		out.flush();
		out.close();
	}
	
}
