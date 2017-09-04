package com.yc.bean;

import java.io.Serializable;
import java.util.List;

public class UserDebitInType implements Serializable {

	private static final long serialVersionUID = -9065220931412935386L;
	
	private Integer udit_id;
	private String udit_name;
	private Double udit_profit;
	private Double udit_month;


	public Integer getUdit_id() {
		return udit_id;
	}
	public void setUdit_id(Integer udit_id) {
		this.udit_id = udit_id;
	}
	public String getUdit_name() {
		return udit_name;
	}
	public void setUdit_name(String udit_name) {
		this.udit_name = udit_name;
	}
	public Double getUdit_profit() {
		return udit_profit;
	}
	public void setUdit_profit(Double udit_profit) {
		this.udit_profit = udit_profit;
	}
	public Double getUdit_month() {
		return udit_month;
	}
	public void setUdit_month(Double udit_month) {
		this.udit_month = udit_month;
	}
	@Override
	public String toString() {
		return "UserDebitInType [udit_id=" + udit_id + ", udit_name=" + udit_name + ", udit_profit=" + udit_profit
				+ ", udit_month=" + udit_month + "]";
	}
	
	



	
	
	
}
