package com.yc.bean;

import java.io.Serializable;
import java.util.Date;

import com.yc.web.model.JsonModel;

public class User extends JsonModel  implements Serializable {

	private static final long serialVersionUID = -4750369623346428567L;

	private Integer u_id;
	private String u_name;
	private String u_password;
	private Integer u_creditnumber;
	private String u_creditdegree;
	private long u_registerdate;
	private String u_tel;
	private String u_email;
	private Integer u_status;
	private String reu_password;
	//用于用户投标关注
	private AttentionMark attentionMark;
	//用户查询借贷用户的信息
	private UserDebitIn userDebitIn;


	
	

	public UserDebitIn getUserDebitIn() {
		return userDebitIn;
	}
	public void setUserDebitIn(UserDebitIn userDebitIn) {
		this.userDebitIn = userDebitIn;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public Integer getU_creditnumber() {
		return u_creditnumber;
	}
	public void setU_creditnumber(Integer u_creditnumber) {
		this.u_creditnumber = u_creditnumber;
	}
	//定义积分规则                          积分到一定等级     信誉度等级会变化
	public String getU_creditdegree() {  // default('HR') in('AA','A','B','C','D','HR'), --信誉等级
		String str=null;
    	if(this.u_creditnumber>=160){
    		str="AA";
    	}else if(this.u_creditnumber>=150){
    		str="A";
    	}else if(this.u_creditnumber>=140){
    		str="B";
    	}else if(this.u_creditnumber>=130){
    		str="C";
    	}else if(this.u_creditnumber>=120){
    		str="D";
    	}else if(this.u_creditnumber>=110){
    		str="E";
    	}else{
    		str="HR";
    	}
    	return str;
	}
	public void setU_creditdegree(String u_creditdegree) {
		this.u_creditdegree = u_creditdegree;
	}
	public long getU_registerdate() {
		return u_registerdate;
	}
	public void setU_registerdate(long u_registerdate) {
		this.u_registerdate = u_registerdate;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public Integer getU_status() {
		return u_status;
	}
	public void setU_status(Integer u_status) {
		this.u_status = u_status;
	}
	public String getReu_password() {
		return reu_password;
	}
	public void setReu_password(String reu_password) {
		this.reu_password = reu_password;
	}
	public AttentionMark getAttentionMark() {
		return attentionMark;
	}
	public void setAttentionMark(AttentionMark attentionMark) {
		this.attentionMark = attentionMark;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_name=" + u_name + ", u_password=" + u_password + ", u_creditnumber="
				+ u_creditnumber + ", u_creditdegree=" + u_creditdegree + ", u_registerdate=" + u_registerdate
				+ ", u_tel=" + u_tel + ", u_email=" + u_email + ", u_status=" + u_status + ", reu_password="
				+ reu_password + ", attentionMark=" + attentionMark + ", userDebitIn=" + userDebitIn + "]";
	}



	
	
	
	


	
}
