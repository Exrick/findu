package com.findu.entity;

public class Type {
	
	private int typeid;
	private String typename;

	public int getTypeid() {
		return this.typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}

	public String getTypename() {
		return this.typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public Type(int typeid, String typename) {
		this.typeid = typeid;
		this.typename = typename;
	}

	public Type() {
	}

	public String toString() {
		return "Type [typeid=" + this.typeid + ", typename=" + this.typename
				+ "]";
	}
}