package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

public class PerRefund implements Serializable {

	private static final long serialVersionUID = 1149652437827431067L;

	private Integer pr_id;
	private Integer udi_id;
	private Integer pr_status;
	private Double pr_money;
	private Date pr_date;
	public Integer getPr_id() {
		return pr_id;
	}
	public void setPr_id(Integer pr_id) {
		this.pr_id = pr_id;
	}
	public Integer getUdi_id() {
		return udi_id;
	}
	public void setUdi_id(Integer udi_id) {
		this.udi_id = udi_id;
	}
	public Integer getPr_status() {
		return pr_status;
	}
	public void setPr_status(Integer pr_status) {
		this.pr_status = pr_status;
	}
	public Double getPr_money() {
		return pr_money;
	}
	public void setPr_money(Double pr_money) {
		this.pr_money = pr_money;
	}
	public Date getPr_date() {
		return pr_date;
	}
	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}
	@Override
	public String toString() {
		return "PerRefund [pr_id=" + pr_id + ", udi_id=" + udi_id + ", pr_status=" + pr_status + ", pr_money="
				+ pr_money + ", pr_date=" + pr_date + "]";
	}
	
	

}
