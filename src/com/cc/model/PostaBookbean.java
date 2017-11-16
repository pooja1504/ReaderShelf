package com.cc.model;

//import java.io.File;

public class PostaBookbean {
	
	private String booktitle,bookdescription,bookcondition,intenttype,mrp,myprice,author,userID,bookid,city,contactno,url;
	
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getBooktitle() {
		return booktitle;
	}
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	public String getBookdescription() {
		return bookdescription;
	}
	public void setBookdescription(String bookdescription) {
		this.bookdescription = bookdescription;
	}
	public String getAuthorname() {
		return author;
	}
	public void setAuthorname(String author) {
		this.author = author;
	}
	public String getBookcondition() {
		return bookcondition;
	}
	public void  setBookcondition(String bookcondition) {
		this.bookcondition = bookcondition;
	}
	public String getIntenttype() {
		return intenttype;
	}
	public void setIntenttype(String intenttype) {
		this.intenttype = intenttype;
	}
	public String getBookMrp() {
		return mrp;
	}
	public void setBookMrp(String mrp) {
		this.mrp = mrp;
	}
	public String getBookMyprice() {
		return myprice;
	}
	public void setBookMyprice(String myprice) {
		this.myprice = myprice;
	}
	public String getUserID() {
		return userID;
	}
	public void  setUserID(String mailId) {
		this.userID = mailId;
	}
	public String getCity() {
		return city;
	}
	public void  setCity(String city) {
		this.city = city;
	}
	public String getContactno() {
		return contactno;
	}
	public void  setContactno(String contactno) {
		this.contactno = contactno;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
