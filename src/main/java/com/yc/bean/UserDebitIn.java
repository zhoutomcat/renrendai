package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

public class UserDebitIn implements Serializable {

	private static final long serialVersionUID = 7977228914132597585L;

	private Integer udi_id;
	private String udi_title;
	private Integer u_id;
	private Double udi_money;
	private Integer udi_status;
	private Double udi_profit;
	private Date udi_date;
	private Date udi_refundnormaldate;
	private Date udi_refundrealitydate;
	private String udi_use;
	private Integer udi_refundway;
	private String udi_type;
	public Integer getUdi_id() {
		return udi_id;
	}
	public void setUdi_id(Integer udi_id) {
		this.udi_id = udi_id;
	}
	public String getUdi_title() {
		return udi_title;
	}
	public void setUdi_title(String udi_title) {
		this.udi_title = udi_title;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Double getUdi_money() {
		return udi_money;
	}
	public void setUdi_money(Double udi_money) {
		this.udi_money = udi_money;
	}
	public Integer getUdi_status() {
		return udi_status;
	}
	public void setUdi_status(Integer udi_status) {
		this.udi_status = udi_status;
	}
	public Double getUdi_profit() {
		return udi_profit;
	}
	public void setUdi_profit(Double udi_profit) {
		this.udi_profit = udi_profit;
	}
	public Date getUdi_date() {
		return udi_date;
	}
	public void setUdi_date(Date udi_date) {
		this.udi_date = udi_date;
	}
	public Date getUdi_refundnormaldate() {
		return udi_refundnormaldate;
	}
	public void setUdi_refundnormaldate(Date udi_refundnormaldate) {
		this.udi_refundnormaldate = udi_refundnormaldate;
	}
	public Date getUdi_refundrealitydate() {
		return udi_refundrealitydate;
	}
	public void setUdi_refundrealitydate(Date udi_refundrealitydate) {
		this.udi_refundrealitydate = udi_refundrealitydate;
	}
	public String getUdi_use() {
		return udi_use;
	}
	public void setUdi_use(String udi_use) {
		this.udi_use = udi_use;
	}
	public Integer getUdi_refundway() {
		return udi_refundway;
	}
	public void setUdi_refundway(Integer udi_refundway) {
		this.udi_refundway = udi_refundway;
	}
	public String getUdi_type() {
		return udi_type;
	}
	public void setUdi_type(String udi_type) {
		this.udi_type = udi_type;
	}
	@Override
	public String toString() {
		return "UserDebitIn [udi_id=" + udi_id + ", udi_title=" + udi_title + ", u_id=" + u_id + ", udi_money="
				+ udi_money + ", udi_status=" + udi_status + ", udi_profit=" + udi_profit + ", udi_date=" + udi_date
				+ ", udi_refundnormaldate=" + udi_refundnormaldate + ", udi_refundrealitydate=" + udi_refundrealitydate
				+ ", udi_use=" + udi_use + ", udi_refundway=" + udi_refundway + ", udi_type=" + udi_type + "]";
	}

	
		
}
