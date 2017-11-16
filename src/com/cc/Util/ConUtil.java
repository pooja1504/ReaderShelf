package com.cc.Util;
import java.sql.*;

public class ConUtil {

	private static Connection con= null;
	
	static{
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/reader'sshelf", "root", "root");
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
	}
	private ConUtil(){
		
	}
	public static Connection getConnection(){
		
		return con;
	}
}
