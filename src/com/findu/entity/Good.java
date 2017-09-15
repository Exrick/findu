package com.findu.entity;

import java.sql.Timestamp;

public class Good {
	
	private int id;
	private String name;
	private String site;
	private String explain;
	private int type;
	private int fabuid;
	private String state;
	private String picture;
	private String fabucontact;
	private Timestamp goodtime;
	private Timestamp fabutime;
	private int value;
	private String time;

	public Good(String name, String site, String explain, int type, int value,
			String fabucontact, String time) {
		this.name = name;
		this.site = site;
		this.explain = explain;
		this.type = type;
		this.value = value;
		this.fabucontact = fabucontact;
		this.time = time;
	}

	public Good(String name, String site, String explain, int type, int fabuid,
			String fabucontact, Timestamp goodtime, int value, String picture) {
		this.name = name;
		this.site = site;
		this.explain = explain;
		this.type = type;
		this.fabuid = fabuid;
		this.picture = picture;
		this.fabucontact = fabucontact;
		this.goodtime = goodtime;
		this.value = value;
	}

	public Good(String name, String site, String explain, int type, int fabuid,
			String fabucontact, String time, int value, String picture) {
		this.name = name;
		this.site = site;
		this.explain = explain;
		this.type = type;
		this.fabuid = fabuid;
		this.picture = picture;
		this.fabucontact = fabucontact;
		this.time = time;
		this.value = value;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getValue() {
		return this.value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public Timestamp getFabutime() {
		return this.fabutime;
	}

	public void setFabutime(Timestamp fabutime) {
		this.fabutime = fabutime;
	}

	public String getFabucontact() {
		return this.fabucontact;
	}

	public void setFabucontact(String fabucontact) {
		this.fabucontact = fabucontact;
	}

	public Timestamp getGoodtime() {
		return this.goodtime;
	}

	public void setGoodtime(Timestamp goodtime) {
		this.goodtime = goodtime;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSite() {
		return this.site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getExplain() {
		return this.explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public int getType() {
		return this.type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getFabuid() {
		return this.fabuid;
	}

	public void setFabuid(int fabuid) {
		this.fabuid = fabuid;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getState() {
		return this.state;
	}

	public Good() {
	}

	public String toString() {
		return "Good [id=" + this.id + ", name=" + this.name + ", site="
				+ this.site + ", explain=" + this.explain + ", type="
				+ this.type + ", fabuid=" + this.fabuid + ", state="
				+ this.state + ", picture=" + this.picture + ", fabucontact="
				+ this.fabucontact + ", goodtime=" + this.goodtime
				+ ", fabutime=" + this.fabutime + ", value=" + this.value + "]";
	}
}