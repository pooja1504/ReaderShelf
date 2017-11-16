package com.cc.model;

public class SuggestionBean {
	private String userID,suggestion,contactNo;
	public String getUserID() {
		return userID;
	}
	public void  setUserID(String mailId) {
		this.userID = mailId;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getsuggestion() {
		return suggestion;
	}
	public void setsuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
}
