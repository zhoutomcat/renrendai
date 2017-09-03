package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

public class AdminToUserMessage implements Serializable {

	private static final long serialVersionUID = 7938475313136541328L;

	private Integer atum_id;
	private Integer u_id;
	private long atum_time;
	private String atum_content;
	private Integer atum_status;
	private String atum_title;
	
	public String getAtum_title() {
		return atum_title;
	}
	public void setAtum_title(String atum_title) {
		this.atum_title = atum_title;
	}
	public Integer getAtum_id() {
		return atum_id;
	}
	public void setAtum_id(Integer atum_id) {
		this.atum_id = atum_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public long getAtum_time() {
		return atum_time;
	}
	public void setAtum_time(long atum_time) {
		this.atum_time = atum_time;
	}
	public String getAtum_content() {
		return atum_content;
	}
	public void setAtum_content(String atum_content) {
		this.atum_content = atum_content;
	}
	public Integer getAtum_status() {
		return atum_status;
	}
	public void setAtum_status(Integer atum_status) {
		this.atum_status = atum_status;
	}
	@Override
	public String toString() {
		return "AdminToUserMessage [atum_id=" + atum_id + ", u_id=" + u_id + ", atum_time=" + atum_time
				+ ", atum_content=" + atum_content + ", atum_status=" + atum_status + ", atum_title=" + atum_title
				+ "]";
	}

	
	

}
