package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

public class UserLogger implements Serializable {

	private static final long serialVersionUID = 8110269207163450226L;

	private Integer ul_id;
	private Integer u_id;
	private Integer ul_optype;
	private Double ul_money;
	private Date ul_time;
	public Integer getUl_id() {
		return ul_id;
	}
	public void setUl_id(Integer ul_id) {
		this.ul_id = ul_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Integer getUl_optype() {
		return ul_optype;
	}
	public void setUl_optype(Integer ul_optype) {
		this.ul_optype = ul_optype;
	}
	public Double getUl_money() {
		return ul_money;
	}
	public void setUl_money(Double ul_money) {
		this.ul_money = ul_money;
	}
	public Date getUl_time() {
		return ul_time;
	}
	public void setUl_time(Date ul_time) {
		this.ul_time = ul_time;
	}
	@Override
	public String toString() {
		return "UserLogger [ul_id=" + ul_id + ", u_id=" + u_id + ", ul_optype=" + ul_optype + ", ul_money=" + ul_money
				+ ", ul_time=" + ul_time + "]";
	}
	
	

}
