package com.yc.web.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JsonModel<T> implements Serializable {
	private static final long serialVersionUID = -1947607909350498604L;
	private int code;
	private String msg;
	private Object obj;

	private Integer total; // *总记录数
	private Integer pages; // * 当前为第几页
	private Integer pagesize; // *每页xx条
	private List<T> rows; // 记录集合
	
	private String sort;
	private String order;
	
	private double makeMoney;
	private double totalMoney;
	private int peopleCount;
	
	//新增
	Map<String ,Object> map = new HashMap<>();
	
	
	
	


	public int getPeopleCount() {
		return peopleCount;
	}

	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}

	public double getMakeMoney() {
		return makeMoney;
	}

	public void setMakeMoney(double makeMoney) {
		this.makeMoney = makeMoney;
	}

	public double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void makeMoney(Map<String, Object> map) {
		this.map = map;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public JsonModel(int code, String msg, Object obj) {
		super();
		this.code = code;
		this.msg = msg;
		this.obj = obj;
	}

	public JsonModel() {
		super();
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public Integer getTotal() {
		return total;
	}

	// 设置总记录数 要先调用 setPageSize(),setPages();
	public void setTotal(Integer total) {
		this.total = total;
	}


	public Integer getPagesize() {
		return pagesize;
	}

	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	@Override
	public String toString() {
		return "JsonModel [code=" + code + ", msg=" + msg + ", obj=" + obj + ", total=" + total + ", pages=" + pages
				+ ", pagesize=" + pagesize + ", rows=" + rows + ", sort=" + sort + ", order=" + order + ", makeMoney="
				+ makeMoney + ", totalMoney=" + totalMoney + ", peopleCount=" + peopleCount + ", map=" + map + "]";
	}

	
	


	
	

	
	
	
}
