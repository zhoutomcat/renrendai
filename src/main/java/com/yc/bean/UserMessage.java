package com.yc.bean;

import java.io.Serializable;

public class UserMessage implements Serializable {

	private static final long serialVersionUID = -7772189967927864583L;

	private Integer um_id;
	private Integer u_id;
	private String um_reallyName;
	private String um_idCard;
	private String um_nowPlace;
	private String um_workinfo;
	private String um_incomeinfo;
	private String um_image;
	public Integer getUm_id() {
		return um_id;
	}
	public void setUm_id(Integer um_id) {
		this.um_id = um_id;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getUm_reallyName() {
		return um_reallyName;
	}
	public void setUm_reallyName(String um_reallyName) {
		this.um_reallyName = um_reallyName;
	}
	public String getUm_idCard() {
		return um_idCard;
	}
	public void setUm_idCard(String um_idCard) {
		this.um_idCard = um_idCard;
	}
	public String getUm_nowPlace() {
		return um_nowPlace;
	}
	public void setUm_nowPlace(String um_nowPlace) {
		this.um_nowPlace = um_nowPlace;
	}
	public String getUm_workinfo() {
		return um_workinfo;
	}
	public void setUm_workinfo(String um_workinfo) {
		this.um_workinfo = um_workinfo;
	}
	public String getUm_incomeinfo() {
		return um_incomeinfo;
	}
	public void setUm_incomeinfo(String um_incomeinfo) {
		this.um_incomeinfo = um_incomeinfo;
	}
	public String getUm_image() {
		return um_image;
	}
	public void setUm_image(String um_image) {
		this.um_image = um_image;
	}
	@Override
	public String toString() {
		return "UserMessage [um_id=" + um_id + ", u_id=" + u_id + ", um_reallyName=" + um_reallyName + ", um_idCard="
				+ um_idCard + ", um_nowPlace=" + um_nowPlace + ", um_workinfo=" + um_workinfo + ", um_incomeinfo="
				+ um_incomeinfo + ", um_image=" + um_image + "]";
	}

}
