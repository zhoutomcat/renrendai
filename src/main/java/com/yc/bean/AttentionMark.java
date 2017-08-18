package com.yc.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AttentionMark implements Serializable {

	private static final long serialVersionUID = -3869040411400417467L;

	private Integer am_id;
	private Integer u_id;
	private Integer udi_id;
	private long am_time;
	private Integer am_status;
	
/*	private User user;*/
	private UserDebitIn userDebitIn;
	
	
	

/*	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}*/
	public Integer getAm_id() {
		return am_id;
	}
	public void setAm_id(Integer am_id) {
		this.am_id = am_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Integer getUdi_id() {
		return udi_id;
	}
	public void setUdi_id(Integer udi_id) {
		this.udi_id = udi_id;
	}
	public long getAm_time() {
		return am_time;
	}
	public void setAm_time(long am_time) {
		this.am_time = am_time;
	}

	public Integer getAm_status() {
		return am_status;
	}
	public void setAm_status(Integer am_status) {
		this.am_status = am_status;
	}
	public UserDebitIn getUserDebitIn() {
		return userDebitIn;
	}
	public void setUserDebitIn(UserDebitIn userDebitIn) {
		this.userDebitIn = userDebitIn;
	}
	@Override
	public String toString() {
		return "AttentionMark [am_id=" + am_id + ", u_id=" + u_id + ", udi_id=" + udi_id + ", am_time=" + am_time
				+ ", am_status=" + am_status + ", userDebitIn=" + userDebitIn + "]";
	}






	


}
