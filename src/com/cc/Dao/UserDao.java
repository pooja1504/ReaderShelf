package com.cc.Dao;
import com.cc.model.*;
import com.cc.Util.*;
import java.sql.*;
import java.util.*;

public class UserDao {
	
	private Connection con;
	
	public UserDao(){
		
		con=ConUtil.getConnection();
	}

	public Membersbean getMember(Membersbean user){
		
		Membersbean member=new Membersbean();
		
		try{
			
			PreparedStatement ps=con.prepareStatement("select * from Members where User_ID=?");
			ps.setString(1, user.getUserID());
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				member.setUserID(rs.getString("User_ID"));
				}
		}catch(SQLException e){
			e.printStackTrace();
		}
			return member;
		}
	
	public void addMember(Membersbean user){
		
		try{
			
			PreparedStatement ps1=con.prepareStatement("insert into Members(Full_Name,User_ID,City,Contact_No) values(?,?,?,?)");
			ps1.setString(1,user.getMemberName());
			ps1.setString(2,user.getUserID());
			ps1.setString(3,user.getCity());
			ps1.setString(4,user.getContactNo());
			ps1.executeUpdate();
			
			PreparedStatement ps2=con.prepareStatement("insert into login(User_ID,Password) values(?,?)");
			ps2.setString(1,user.getUserID());
			ps2.setString(2,user.getPassword());
			ps2.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		
		}
	}
		public Boolean getUser(Loginbean user)
		{
			Boolean status=false; 
			
			try{
				
				String sql="select * from LOGIN WHERE User_ID='"+user.getUserID()+"' and Password='"+user.getPassword()+"'";
				Statement st=con.createStatement();
				ResultSet rs = st.executeQuery(sql);
				status=rs.next();
			}catch(SQLException e){
				e.printStackTrace();
			}
				return status;
		}
		public String getUsername(String user)
		{
			String userName=null;
			try
			{
				String sql="select * from MEMBERS WHERE User_ID='"+user+"'";
				Statement st=con.createStatement();
				ResultSet rs = st.executeQuery(sql);
				rs.next();
				userName=rs.getString("Full_Name");
			}catch(SQLException e){
				e.printStackTrace();
			}
				return userName;
		}
		public void addBooks(PostaBookbean postbook)
		{
			try{
				
				PreparedStatement ps1=con.prepareStatement("insert into POSTEDBOOKS(Book_Title,Author_Name,Book_Description,Book_Condition,Intent_Type,Posted_On,User_ID,Image,MRP,Myprice,City,Contactno) values(?,?,?,?,?,CURDATE(),?,?,?,?,?,?)");
				ps1.setString(1,postbook.getBooktitle());
				ps1.setString(2,postbook.getAuthorname());
				ps1.setString(3,postbook.getBookdescription());
				ps1.setString(4,postbook.getBookcondition());
				ps1.setString(5,postbook.getIntenttype());
				ps1.setString(6,postbook.getUserID());
				ps1.setString(7,postbook.getUrl());
				ps1.setString(8,postbook.getBookMrp());
				ps1.setString(9,postbook.getBookMyprice());
				ps1.setString(10,postbook.getCity());
				ps1.setString(11,postbook.getContactno());
				ps1.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
			public List<PostaBookbean> getBooks(String user)
			{
				List<PostaBookbean> book=new ArrayList<PostaBookbean>();
				try
				{
					
					String sql="select * from POSTEDBOOKS WHERE User_ID='"+user+"'";
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery(sql);
					while(rs.next())
					{
						PostaBookbean postabookBean=new PostaBookbean();
						postabookBean.setBookid(rs.getString(1));
						postabookBean.setBooktitle(rs.getString(2));
						postabookBean.setIntenttype(rs.getString(6));
						postabookBean.setBookMyprice(rs.getString(11));
						postabookBean.setUserID(user);
						book.add(postabookBean);
					}
				}	
					catch(Exception e)
					{
						e.printStackTrace();
					}
				return book;
				
			}	
			public List<PostaBookbean> getAllBooks()
			{
				List<PostaBookbean> book=new ArrayList<PostaBookbean>();
				try
				{
					
					String sql="select * from POSTEDBOOKS";
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery(sql);
					while(rs.next())
					{
						PostaBookbean postabookbean=new PostaBookbean();
						postabookbean.setBookid(rs.getString(1));
						postabookbean.setBooktitle(rs.getString(2));
						postabookbean.setIntenttype(rs.getString(6));
						postabookbean.setUrl(rs.getString(9));
						postabookbean.setBookMyprice(rs.getString(11));
						postabookbean.setUserID(rs.getString(8));
						book.add(postabookbean);
					}
				}	
					catch(Exception e)
					{
						e.printStackTrace();
					}
				return book;
				
			}	
		public boolean ChangePassword(ChangePasswordbean Changepass)
		{ 
			boolean flag = false;
			try{
				if(Changepass.getNewpassword().equals(Changepass.getConfirmpassword()))
				{
				String sql="update LOGIN SET Password='" + Changepass.getNewpassword() + "' WHERE User_ID='" + Changepass.getUserid()+ "'";
				Statement st=con.createStatement();
			    if (st.executeUpdate(sql) > 0)
			    	flag=true;
				}
			}
				catch(SQLException e){
				e.printStackTrace();
			}
				return flag;
		}
		public boolean UpdateMydetails(Membersbean member)
		{ 
			boolean flag = false;
			try{
				
				String sql="update MEMBERS SET Full_Name='" + member.getMemberName()+"',City='" + member.getCity()+"',Contact_No='" + member.getContactNo() + "' WHERE User_ID='" + member.getUserID()+ "'";
				Statement st=con.createStatement();
			    if (st.executeUpdate(sql) > 0)
			    	flag=true;
				}
				catch(SQLException e){
				e.printStackTrace();
			}
				return flag;
		}
	   public Membersbean MyDetails(String user)
	   {
		   Membersbean member=new Membersbean();
			
			try{
				String sql="select * from MEMBERS where User_ID='"+user+"'";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				if(rs.next()){
					
					member.setMemberName(rs.getString(2));
					member.setCity(rs.getString(4));
					member.setContactNo(rs.getString(5));
					member.setUserID(user);
					}
			}catch(SQLException e){
				e.printStackTrace();
			}
				return member;   
	   }
	   public void deletebooks(String bookid)
	   {
		   try{
			   String sql="delete from POSTEDBOOKS WHERE PostBook_ID="+bookid;
			   Statement st=con.createStatement();
			   st.executeUpdate(sql);
		   }
		   catch(SQLException e){
				e.printStackTrace();
			}
	   }
	   public PostaBookbean getBookDetails(String bookid)
	   {
		   PostaBookbean postabook=new PostaBookbean();
			   try{
					String sql="select * from POSTEDBOOKS where PostBook_ID='"+bookid+"'";
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery(sql);
					if(rs.next()){
						postabook.setBookid(rs.getString(1));
						postabook.setBooktitle(rs.getString(2));
						postabook.setAuthorname(rs.getString(3));
						postabook.setBookdescription(rs.getString(4));
						postabook.setBookcondition(rs.getString(5));
						postabook.setIntenttype(rs.getString(6));
						postabook.setUserID(rs.getString(8));
						postabook.setUrl(rs.getString(9));
						postabook.setBookMrp(rs.getString(10));
						postabook.setBookMyprice(rs.getString(11));
						postabook.setCity(rs.getString(12));
						postabook.setContactno(rs.getString(13));
						}
				}catch(SQLException e){
					e.printStackTrace();
				}
		   
		   return postabook;
		   
	   }
	   public boolean UpdateBookDetails(PostaBookbean postabook)
		{ 
			boolean flag = false;
			try{
				
				String sql="update POSTEDBOOKS SET Book_Title='" + postabook.getBooktitle()+"',Author_Name='" + postabook.getAuthorname()+"',Book_Description='" + postabook.getBookdescription() + "',Book_Condition='" + postabook.getBookcondition() + "',Intent_Type='" + postabook.getIntenttype() + "',MRP='" + postabook.getBookMrp() + "',Myprice='" + postabook.getBookMyprice() + "',City='" + postabook.getCity() + "',Contactno='" + postabook.getContactno() + "' WHERE PostBook_ID=" + postabook.getBookid()+ "";
				Statement st=con.createStatement();
			    if (st.executeUpdate(sql) > 0)
			    	flag=true;
				}
				catch(SQLException e){
				e.printStackTrace();
			}
				return flag;
		}
	   public void IntentReq(IntentReqbean req)
	   {
		   try{
				
				PreparedStatement ps1=con.prepareStatement("insert into INTENTREQ(Book_Title,Author,User_ID) values(?,?,?)");
				ps1.setString(1,req.getBooktitle());
				ps1.setString(2,req.getAuthor());
				ps1.setString(3,req.getUserID());
				ps1.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
	   }
	   public List<IntentReqbean> getRequestedBooks(String user)
		{
			List<IntentReqbean> book=new ArrayList<IntentReqbean>();
			try
			{
				
				String sql="select * from INTENTREQ WHERE User_ID='"+user+"'";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next())
				{
					IntentReqbean req=new IntentReqbean();
					req.setIntentid(rs.getString(1));
					req.setBooktitle(rs.getString(2));
					req.setAuthor(rs.getString(3));
					req.setUserID(user);
					book.add(req);
				}
			}	
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return book;
			
		}
	   public void deleteRequestedbooks(String intentid)
	   {
		   try{
			   String sql="delete from INTENTREQ WHERE Intent_ID="+intentid;
			   Statement st=con.createStatement();
			   st.executeUpdate(sql);
		   }
		   catch(SQLException e){
				e.printStackTrace();
			}
	   }
	   public boolean UpdateRequestedBooks(IntentReqbean req)
		{ 
			boolean flag = false;
			try{
				
				String sql="update INTENTREQ SET Book_Title='" + req.getBooktitle()+"',Author='" + req.getAuthor()+"' WHERE Intent_ID=" + req.getIntentid()+ "";
				Statement st=con.createStatement();
			    if (st.executeUpdate(sql) > 0)
			    	flag=true;
				}
				catch(SQLException e){
				e.printStackTrace();
			}
				return flag;
		}
	   public IntentReqbean getRequestedBookDetails(String intentid)
	   {
		   IntentReqbean req=new IntentReqbean();
			   try{
					String sql="select * from INTENTREQ where Intent_ID='"+intentid+"'";
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery(sql);
					if(rs.next()){
						req.setIntentid(rs.getString(1));
						req.setBooktitle(rs.getString(2));
						req.setAuthor(rs.getString(3));
						}
				}catch(SQLException e){
					e.printStackTrace();
				}
		   
		   return req;
		 }
	   public List<PostaBookbean> SearchBooks(String bookname)
		{
			List<PostaBookbean> book=new ArrayList<PostaBookbean>();
			try
			{
				
				String sql="SELECT PostBook_ID,Book_Title,Author_Name,User_ID,Image FROM postedbooks WHERE Book_Title LIKE '%"+bookname+"%'";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next())
				{
					PostaBookbean postabookbean=new PostaBookbean();
					postabookbean.setBookid(rs.getString(1));
					postabookbean.setBooktitle(rs.getString(2));
					postabookbean.setAuthorname(rs.getString(3));
					postabookbean.setUserID(rs.getString(4));
					postabookbean.setUrl(rs.getString(5));
					book.add(postabookbean);
				}
			}	
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return book;
		}
	   public void addSuggestions(SuggestionBean suggest)
		{
			try{
				PreparedStatement ps1=con.prepareStatement("insert into SUGGESTIONS(UserID,Suggestion,Contactno) values(?,?,?)");
				ps1.setString(1,suggest.getUserID());
				ps1.setString(2,suggest.getsuggestion());
				ps1.setString(3,suggest.getContactNo());
				ps1.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	   public List<Messagebean> getMessages(String user)
		{
			List<Messagebean> book=new ArrayList<Messagebean>();
			try
			{
				
				String sql="select * from MESSAGES WHERE User_ID='"+user+"'";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next())
				{
					Messagebean msg=new Messagebean();
					msg.setID(rs.getString(1));
					msg.setuserid(user);
					msg.setbookid(rs.getString(3));
					msg.setmessage(rs.getString(4));
					book.add(msg);
				}
			}	
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return book;
			
		}
	   public List<Messagebean> getMyMessages(String user)
		{
			List<Messagebean> book=new ArrayList<Messagebean>();
			try
			{
				
				String sql="select * from MESSAGES WHERE Book_ID IN (select PostBook_ID from POSTEDBOOKS where User_ID='"+user+"')";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next())
				{
					Messagebean msg=new Messagebean();
					msg.setID(rs.getString(1));
					msg.setuserid(rs.getString(2));
					msg.setbookid(rs.getString(3));
					msg.setmessage(rs.getString(4));
					msg.setreply(rs.getString(5));
					book.add(msg);
				}
			}	
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return book;
		}
	   public List<Messagebean> getIndividualMessages(String user,String sender)
		{
			List<Messagebean> book=new ArrayList<Messagebean>();
			try
			{
				
				String sql="select * from MESSAGES WHERE user_id='" +sender+"' and  Book_ID IN (select PostBook_ID from POSTEDBOOKS where User_ID='"+user+"')";

				
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next())
				{
					Messagebean msg=new Messagebean();
					msg.setID(rs.getString(1));
					msg.setuserid(rs.getString(2));
					msg.setbookid(rs.getString(3));
					msg.setmessage(rs.getString(4));
					msg.setreply(rs.getString(5));
					book.add(msg);
				}
			}	
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return book;
		}
	   public List<Messagebean> getsentMessages(String user)
		{
			List<Messagebean> book=new ArrayList<Messagebean>();
			try
			{
				
				String sql="select * from MESSAGES WHERE user_id='" +user+"'";
//select * from MESSAGES WHERE user_id='poo@' and  Book_ID IN (select PostBook_ID from POSTEDBOOKS where User_ID='dev@dev')			
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next())
				{
					Messagebean msg=new Messagebean();
					msg.setID(rs.getString(1));
					msg.setuserid(rs.getString(2));
					msg.setbookid(rs.getString(3));
					msg.setmessage(rs.getString(4));
					msg.setreply(rs.getString(5));
					book.add(msg);
				}
			}	
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return book;
		}
	   
	   public void addMessages(Messagebean msg)
		{
			try{
				
				PreparedStatement ps1=con.prepareStatement("insert into MESSAGES(User_ID,Book_ID,Message) values(?,?,?)");
				ps1.setString(1,msg.getuserid());
				ps1.setString(2,msg.getbookid());
				ps1.setString(3,msg.getmessage());
				ps1.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	   public Messagebean getuseridfrommsg(String msgid)
	   {
		  Messagebean req=new Messagebean();
			   try{
					String sql="select User_ID from MESSAGES where ID='"+msgid+"'";
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery(sql);
					if(rs.next()){
						req.setuserid(rs.getString(1));
						}
				}catch(SQLException e){
					e.printStackTrace();
				}
		   
		   return req;
		 }
	   public boolean addReply(Messagebean msg)
		{
		   boolean flag = false;
			try{
				String sql="update MESSAGES SET Reply='" + msg.getreply()+"' WHERE ID=" + msg.getID()+ "";
				Statement st=con.createStatement();
			    if (st.executeUpdate(sql) > 0)
			    	flag=true;
				}
				catch(SQLException e){
				e.printStackTrace();
			}
			return flag;
		}	
	   public PostaBookbean getuseridfrombookid(String bookid)
	   {
		  PostaBookbean req=new PostaBookbean();
			   try{
					String sql="select User_ID from postedbooks where PostBook_ID='"+bookid+"'";
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery(sql);
					if(rs.next()){
						req.setUserID(rs.getString(1));
						}
				}catch(SQLException e){
					e.printStackTrace();
				}
		   
		   return req;
		 }
	   public void deleteSentbooks(String msgid)
	   {
		   try{
			   String sql="delete from Messages WHERE ID="+msgid;
			   Statement st=con.createStatement();
			   st.executeUpdate(sql);
		   }
		   catch(SQLException e){
				e.printStackTrace();
			}
	   }
	   
	   
}