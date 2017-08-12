package com.yc.bean;

import java.io.Serializable;

public class Admin implements Serializable {

	private static final long serialVersionUID = 371525309521087732L;

	private Integer a_id;
	private String a_name;
	private String a_password;
	private Integer a_role;
	private Integer a_status;
	public Integer getA_id() {
		return a_id;
	}
	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_password() {
		return a_password;
	}
	public void setA_password(String a_password) {
		this.a_password = a_password;
	}
	public Integer getA_role() {
		return a_role;
	}
	public void setA_role(Integer a_role) {
		this.a_role = a_role;
	}
	public Integer getA_status() {
		return a_status;
	}
	public void setA_status(Integer a_status) {
		this.a_status = a_status;
	}
	@Override
	public String toString() {
		return "Admin [a_id=" + a_id + ", a_name=" + a_name + ", a_password=" + a_password + ", a_role=" + a_role
				+ ", a_status=" + a_status + "]";
	}
	
}
