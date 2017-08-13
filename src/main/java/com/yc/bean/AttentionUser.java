package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

public class AttentionUser implements Serializable {

	private static final long serialVersionUID = -6541918650425402247L;

	private Integer au_id;
	private Integer u_id;
	private Integer u_idbyAttention;
	private long au_time;
	private Integer au_status;
	public Integer getAu_id() {
		return au_id;
	}
	public void setAu_id(Integer au_id) {
		this.au_id = au_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Integer getU_idbyAttention() {
		return u_idbyAttention;
	}
	public void setU_idbyAttention(Integer u_idbyAttention) {
		this.u_idbyAttention = u_idbyAttention;
	}
	public long getAu_time() {
		return au_time;
	}
	public void setAu_time(long au_time) {
		this.au_time = au_time;
	}
	public Integer getAu_status() {
		return au_status;
	}
	public void setAu_status(Integer au_status) {
		this.au_status = au_status;
	}
	@Override
	public String toString() {
		return "AttentionUser [au_id=" + au_id + ", u_id=" + u_id + ", u_idbyAttention=" + u_idbyAttention
				+ ", au_time=" + au_time + ", au_status=" + au_status + "]";
	}
	
	

}
