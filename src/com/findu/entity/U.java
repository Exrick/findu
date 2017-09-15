package com.findu.entity;

import java.util.Date;

public class U {
	private int userid;
	private String username;
	private String userpassword;
	private String useremail;
	private String userphone;
	private String usergender;
	private Date userbirthday;
	private String useraddress;
	private String userhead;
	private String userexplain;
	private String userqq;
	@Override
	public String toString() {
		return "U [userid=" + userid + ", username=" + username
				+ ", userpassword=" + userpassword + ", useremail=" + useremail
				+ ", userphone=" + userphone + ", usergender=" + usergender
				+ ", userbirthday=" + userbirthday + ", useraddress="
				+ useraddress + ", userhead=" + userhead + ", userexplain="
				+ userexplain + ", userqq=" + userqq + "]";
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	public Date getUserbirthday() {
		return userbirthday;
	}
	public void setUserbirthday(Date userbirthday) {
		this.userbirthday = userbirthday;
	}
	public String getUseraddress() {
		return useraddress;
	}
	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}
	public String getUserhead() {
		return userhead;
	}
	public void setUserhead(String userhead) {
		this.userhead = userhead;
	}
	public String getUserexplain() {
		return userexplain;
	}
	public void setUserexplain(String userexplain) {
		this.userexplain = userexplain;
	}
	public String getUserqq() {
		return userqq;
	}
	public void setUserqq(String userqq) {
		this.userqq = userqq;
	}
	
}
