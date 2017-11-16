package com.cc.controller;
import java.io.*;
import javax.servlet.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cc.Dao.UserDao;
import com.cc.model.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
public class PostaBook extends HttpServlet {
	private UserDao uDao;
	public PostaBook() {
		super();
		uDao= new UserDao();
	}
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String bookid;
			bookid=request.getParameter("bookid");
		    uDao.deletebooks(bookid);
		    response.sendRedirect("../MyBooks.jsp");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String submit ="";
		PrintWriter out = response.getWriter();
		File file;
        int maxFileSize = 5000 * 1024;
        int maxMemSize = 5000 * 1024;
        String name="",booktitle="",bookdescription="",intenttype="",bookcondition="",bookmrp="",bookmyprice="",author="",city="",contactno="";
        ServletContext context = getServletContext();
        String filePath = context.getInitParameter("file-upload");
   // Verify the content type
        String contentType = request.getContentType();
        String fileUrl = "./images/";
        if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("./images/"));
	//factory.setRepository(new File("D:/workspaceproject/ReadersShelf/WebRoot/images/"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List <FileItem> fileItems = upload.parseRequest(request);
         // Process the uploaded file items
         Iterator i = fileItems.iterator();
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
              if( fileName.lastIndexOf("\\") >= 0 )
              {
               file = new File( filePath +fileName.substring( fileName.lastIndexOf("\\"))) ;
			   fileUrl += fileName.substring( fileName.lastIndexOf("\\"));
              }
              else
              {
               file = new File( filePath +fileName.substring(fileName.lastIndexOf("\\")+1)) ;
			   fileUrl += fileName.substring(fileName.lastIndexOf("\\") + 1);
               }
			
            fi.write( file ) ;
              }
		 else{
			 
			   if ( fi.getFieldName().equals("name"))
					name = fi.getString();
			   if ( fi.getFieldName().equals("booktitle"))
					booktitle = fi.getString();
			   if ( fi.getFieldName().equals("bookdescription"))
					bookdescription = fi.getString();
			   if ( fi.getFieldName().equals("intenttype"))
					intenttype = fi.getString();
			   if ( fi.getFieldName().equals("bookcondition"))
					bookcondition = fi.getString();
			   if ( fi.getFieldName().equals("bookmrp"))
					bookmrp = fi.getString();
			   if ( fi.getFieldName().equals("bookmyprice"))
					bookmyprice = fi.getString();
			   if ( fi.getFieldName().equals("author"))
					author = fi.getString();
			   if ( fi.getFieldName().equals("city"))
					city = fi.getString();
			   if ( fi.getFieldName().equals("contactno"))
					contactno = fi.getString();
			   if ( fi.getFieldName().equals("submit"))
					submit = fi.getString();
			}
         
         }
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      
   }
		PostaBookbean postabookBean=new PostaBookbean();
		postabookBean.setUrl(fileUrl);
		postabookBean.setBooktitle(booktitle);
		postabookBean.setBookdescription(bookdescription);
		postabookBean.setIntenttype(intenttype);
		postabookBean.setBookcondition(bookcondition);
		postabookBean.setBookMrp(bookmrp);
		postabookBean.setBookMyprice(bookmyprice);
		postabookBean.setAuthorname(author);
		postabookBean.setCity(city);
		postabookBean.setContactno(contactno);
		if(submit.equals("Post"))
		{
		String uid ="";
		Loginbean user=null;
		HttpSession session=request.getSession(true);
		if ( request.getSession().getAttribute("user") != null)
		{
			user = (Loginbean)(session.getAttribute("user"));
			uid = user.getUserID();
		}
			postabookBean.setUserID(uid);
			uDao.addBooks(postabookBean);
	    }
		else if(submit.equals("update"))
		{
			postabookBean.setBookid(request.getParameter("bookid"));
			uDao.UpdateBookDetails(postabookBean);
	    }
		response.sendRedirect("../MyBooks.jsp");
	}
}
