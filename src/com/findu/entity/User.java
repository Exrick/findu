package com.findu.entity;

import java.util.Date;

public class User {
	
	private int id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String gender;
	private Date birthday;
	private String address;
	private String head;
	private String explain;
	private String qq;

	public User(int id, String name, String phone, String email, String gender,
			Date birthday, String qq, String address, String explain) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.explain = explain;
		this.qq = qq;
	}

	public User(String gender, Date birthday, String address, String explain,
			String qq) {
		super();
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.explain = explain;
		this.qq = qq;
	}

	public User(String password, String email, String phone, String gender,
			Date birthday, String address, String head, String explain,
			String qq) {
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.head = head;
		this.explain = explain;
		this.qq = qq;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getExplain() {
		return this.explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHead() {
		return this.head;
	}

	public void setHead(String head) {
		this.head = head;
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String toString() {
		return "User [id=" + this.id + ", name=" + this.name + ", password="
				+ this.password + ", email=" + this.email + ", phone="
				+ this.phone + ", gender=" + this.gender + ", birthday="
				+ this.birthday + ", address=" + this.address + ", head="
				+ this.head + ", explain=" + this.explain + ", qq=" + this.qq
				+ "]";
	}

	public User() {
	}

	public User(String name, String password, String email, String phone) {
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
	}
}