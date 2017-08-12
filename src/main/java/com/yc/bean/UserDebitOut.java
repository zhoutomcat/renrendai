package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

public class UserDebitOut implements Serializable {

	private static final long serialVersionUID = -7917840645523333366L;
	
	private Integer udo_id;
	private Integer udi_id;
	private Integer u_id;
	private Date udo_startdate;
	private Date udo_date;
	private Double udo_money;
	private String udo_type;
	
	public Integer getUdo_id() {
		return udo_id;
	}
	public void setUdo_id(Integer udo_id) {
		this.udo_id = udo_id;
	}
	public Integer getUdi_id() {
		return udi_id;
	}
	public void setUdi_id(Integer udi_id) {
		this.udi_id = udi_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Date getUdo_startdate() {
		return udo_startdate;
	}
	public void setUdo_startdate(Date udo_startdate) {
		this.udo_startdate = udo_startdate;
	}
	public Date getUdo_date() {
		return udo_date;
	}
	public void setUdo_date(Date udo_date) {
		this.udo_date = udo_date;
	}
	public Double getUdo_money() {
		return udo_money;
	}
	public void setUdo_money(Double udo_money) {
		this.udo_money = udo_money;
	}
	public String getUdo_type() {
		return udo_type;
	}
	public void setUdo_type(String udo_type) {
		this.udo_type = udo_type;
	}
	@Override
	public String toString() {
		return "UserDebitOut [udo_id=" + udo_id + ", udi_id=" + udi_id + ", u_id=" + u_id + ", udo_startdate="
				+ udo_startdate + ", udo_date=" + udo_date + ", udo_money=" + udo_money + ", udo_type=" + udo_type
				+ "]";
	}
	
	

}
