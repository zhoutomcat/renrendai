package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {

	private static final long serialVersionUID = -4750369623346428567L;

	private Integer u_id;
	private String u_name;
	private String u_password;
	private Integer u_creditnumber;
	private String u_creditdegree;
	private Date u_registerdate;
	private String u_tel;
	private String u_email;
	
	private String reu_password;
	
	
	
	public String getReu_password() {
		return reu_password;
	}
	public void setReu_password(String reu_password) {
		this.reu_password = reu_password;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public Integer getU_creditnumber() {
		return u_creditnumber;
	}
	public void setU_creditnumber(Integer u_creditnumber) {
		this.u_creditnumber = u_creditnumber;
	}
	public String getU_creditdegree() {
		return u_creditdegree;
	}
	public void setU_creditdegree(String u_creditdegree) {
		this.u_creditdegree = u_creditdegree;
	}
	public Date getU_registerdate() {
		return u_registerdate;
	}
	public void setU_registerdate(Date u_registerdate) {
		this.u_registerdate = u_registerdate;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_name=" + u_name + ", u_password=" + u_password + ", u_creditnumber="
				+ u_creditnumber + ", u_creditdegree=" + u_creditdegree + ", u_registerdate=" + u_registerdate
				+ ", u_tel=" + u_tel + ", u_email=" + u_email + "]";
	}
}
