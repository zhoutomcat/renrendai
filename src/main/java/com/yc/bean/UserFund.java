package com.yc.bean;

import java.io.Serializable;

public class UserFund implements Serializable {

	private static final long serialVersionUID = 5665208972780385502L;

	private Integer uf_id;
	private Integer u_id;
	private Double uf_balance;
	private Double uf_available;
	private Double uf_freeze;
	public Integer getUf_id() {
		return uf_id;
	}
	public void setUf_id(Integer uf_id) {
		this.uf_id = uf_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Double getUf_balance() {
		return uf_balance;
	}
	public void setUf_balance(Double uf_balance) {
		this.uf_balance = uf_balance;
	}
	public Double getUf_available() {
		return uf_available;
	}
	public void setUf_available(Double uf_available) {
		this.uf_available = uf_available;
	}
	public Double getUf_freeze() {
		return uf_freeze;
	}
	public void setUf_freeze(Double uf_freeze) {
		this.uf_freeze = uf_freeze;
	}
	@Override
	public String toString() {
		return "UserFund [uf_id=" + uf_id + ", u_id=" + u_id + ", uf_balance=" + uf_balance + ", uf_available="
				+ uf_available + ", uf_freeze=" + uf_freeze + "]";
	}
	
	

}
