package com.cc.Util;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;


public class AppContextListener implements ServletContextListener
{
  public void contextInitialized(ServletContextEvent servletContextEvent)
  {
	  ServletContext ctx=servletContextEvent.getServletContext();
	  ctx.setAttribute("Connection",ConUtil.getConnection());
	  
	  System.out.println("Dtabse connection initialized");
	  
  }
  public void contextDestroyed(ServletContextEvent servletContextEvent)
  {
	 // ServletContext ctx=servletContextEvent.getServletContext();
     // DbManager dbManager=(DbManager)ctx.getAttribute();
      System.out.println("Database connection closed");
  }
}