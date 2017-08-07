package com.yc.bean;

import java.io.Serializable;

public class VoteUser implements Serializable {

	private static final long serialVersionUID = 6436400249436939684L;
	private Integer uid;
	private String uname;
	private String pwd;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "Voteuser [uid=" + uid + ", uname=" + uname + ", pwd=" + pwd + "]";
	}
	
	

}
