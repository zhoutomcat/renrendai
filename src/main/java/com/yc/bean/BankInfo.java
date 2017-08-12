package com.yc.bean;

import java.io.Serializable;

public class BankInfo implements Serializable {

	private static final long serialVersionUID = 2355587416896342158L;

	private Integer bi_id;
	private 	String bi_name;
	private String bi_idCard;
	private Integer u_id;
	private Integer bi_status;
	public Integer getBi_id() {
		return bi_id;
	}
	public void setBi_id(Integer bi_id) {
		this.bi_id = bi_id;
	}
	public String getBi_name() {
		return bi_name;
	}
	public void setBi_name(String bi_name) {
		this.bi_name = bi_name;
	}
	public String getBi_idCard() {
		return bi_idCard;
	}
	public void setBi_idCard(String bi_idCard) {
		this.bi_idCard = bi_idCard;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Integer getBi_status() {
		return bi_status;
	}
	public void setBi_status(Integer bi_status) {
		this.bi_status = bi_status;
	}
	@Override
	public String toString() {
		return "BankInfo [bi_id=" + bi_id + ", bi_name=" + bi_name + ", bi_idCard=" + bi_idCard + ", u_id=" + u_id
				+ ", bi_status=" + bi_status + "]";
	}
	
	

}
