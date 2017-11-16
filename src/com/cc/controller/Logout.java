package com.cc.controller;

import java.io.IOException;
//import java.io.PrintWriter;
import javax.servlet.http.Cookie;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cookie loginCookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("LoginCookie")) {
                    loginCookie = cookie;
                    break;
                }
            }
        }
        if (loginCookie != null) {
            loginCookie.setMaxAge(0);
            response.addCookie(loginCookie);
        }
        response.sendRedirect("../Login.jsp");
    }
}
