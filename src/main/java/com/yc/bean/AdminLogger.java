package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

public class AdminLogger implements Serializable {

	private static final long serialVersionUID = 180510972733667991L;
	
	private Integer al_id;
	private Integer a_id;
	private String al_content;
	private Integer al_optype;
	private String al_opclassname;
	private Date al_time;
	public Integer getAl_id() {
		return al_id;
	}
	public void setAl_id(Integer al_id) {
		this.al_id = al_id;
	}
	public Integer getA_id() {
		return a_id;
	}
	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}
	public String getAl_content() {
		return al_content;
	}
	public void setAl_content(String al_content) {
		this.al_content = al_content;
	}
	public Integer getAl_optype() {
		return al_optype;
	}
	public void setAl_optype(Integer al_optype) {
		this.al_optype = al_optype;
	}
	public String getAl_opclassname() {
		return al_opclassname;
	}
	public void setAl_opclassname(String al_opclassname) {
		this.al_opclassname = al_opclassname;
	}
	public Date getAl_time() {
		return al_time;
	}
	public void setAl_time(Date al_time) {
		this.al_time = al_time;
	}
	@Override
	public String toString() {
		return "AdminLogger [al_id=" + al_id + ", a_id=" + a_id + ", al_content=" + al_content + ", al_optype="
				+ al_optype + ", al_opclassname=" + al_opclassname + ", al_time=" + al_time + "]";
	}
	
	

}
