package com.cc.model;

public class ChangePasswordbean {
	
	
	private String oldpassword,newpassword,confirmpassword,userid;
	public String getOldpassword() {
		return oldpassword;
	}
	public void  setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void  setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void  setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	public String getUserid() {
		return userid;
	}
	public void  setUserid(String userid) {
		this.userid = userid;
	}
}