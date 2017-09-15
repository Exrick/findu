package com.findu.entity;

import java.sql.Timestamp;

public class Apply {
	
	private int id;
	private Timestamp applytime;
	private String explain;
	private String state;
	private int goodid;
	private int userid;
	private String contact;
	private String picture;

	public Apply(String explain, String contact, String picture) {
		this.explain = explain;
		this.contact = contact;
		this.picture = picture;
	}

	public Apply(String explain, int goodid, int userid, String contact,
			String picture) {
		this.explain = explain;
		this.goodid = goodid;
		this.userid = userid;
		this.contact = contact;
		this.picture = picture;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Apply(String explain, int goodid, int userid, String contact) {
		this.explain = explain;
		this.goodid = goodid;
		this.userid = userid;
		this.contact = contact;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getApplyTime() {
		return this.applytime;
	}

	public void setApplyTime(Timestamp applytime) {
		this.applytime = applytime;
	}

	public String getExplain() {
		return this.explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getGoodid() {
		return this.goodid;
	}

	public void setGoodid(int goodid) {
		this.goodid = goodid;
	}

	public int getUserid() {
		return this.userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Apply() {
	}

	public String toString() {
		return "Apply [id=" + this.id + ", applytime=" + this.applytime
				+ ", explain=" + this.explain + ", state=" + this.state
				+ ", goodid=" + this.goodid + ", userid=" + this.userid
				+ ", contact=" + this.contact + ", picture=" + this.picture
				+ "]";
	}
}