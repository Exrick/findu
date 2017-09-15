package com.findu.entity;

import java.sql.Timestamp;
import java.util.Date;

public class G {
	private int goodid;
	private String goodname;
	private String goodsite;
	private String goodexplain;
	private int goodtype;
	private int fabuid;
	private String goodstate;
	private String goodpicture;
	private String fabucontact;
	private Timestamp goodtime;
	private Timestamp fabutime;
	private int goodvalue;
	public int getGoodid() {
		return goodid;
	}
	public void setGoodid(int goodid) {
		this.goodid = goodid;
	}
	public String getGoodname() {
		return goodname;
	}
	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}
	public String getGoodsite() {
		return goodsite;
	}
	public void setGoodsite(String goodsite) {
		this.goodsite = goodsite;
	}
	public String getGoodexplain() {
		return goodexplain;
	}
	public void setGoodexplain(String goodexplain) {
		this.goodexplain = goodexplain;
	}
	public int getGoodtype() {
		return goodtype;
	}
	public void setGoodtype(int goodtype) {
		this.goodtype = goodtype;
	}
	public int getFabuid() {
		return fabuid;
	}
	public void setFabuid(int fabuid) {
		this.fabuid = fabuid;
	}
	public String getGoodstate() {
		return goodstate;
	}
	public void setGoodstate(String goodstate) {
		this.goodstate = goodstate;
	}
	public String getGoodpicture() {
		return goodpicture;
	}
	public void setGoodpicture(String goodpicture) {
		this.goodpicture = goodpicture;
	}
	public String getFabucontact() {
		return fabucontact;
	}
	public void setFabucontact(String fabucontact) {
		this.fabucontact = fabucontact;
	}
	public Timestamp getGoodtime() {
		return goodtime;
	}
	public void setGoodtime(Timestamp goodtime) {
		this.goodtime = goodtime;
	}
	public Timestamp getFabutime() {
		return fabutime;
	}
	public void setFabutime(Timestamp fabutime) {
		this.fabutime = fabutime;
	}
	public int getGoodvalue() {
		return goodvalue;
	}
	public void setGoodvalue(int goodvalue) {
		this.goodvalue = goodvalue;
	}
	@Override
	public String toString() {
		return "G [goodid=" + goodid + ", goodname=" + goodname + ", goodsite="
				+ goodsite + ", goodexplain=" + goodexplain + ", goodtype="
				+ goodtype + ", fabuid=" + fabuid + ", goodstate=" + goodstate
				+ ", goodpicture=" + goodpicture + ", fabucontact="
				+ fabucontact + ", goodtime=" + goodtime + ", fabutime="
				+ fabutime + ", goodvalue=" + goodvalue + "]";
	}
}
