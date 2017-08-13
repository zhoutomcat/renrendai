package com.yc.web.model;

import java.io.Serializable;
import java.util.List;

public class JsonModel<T> implements Serializable {
	private static final long serialVersionUID = -1947607909350498604L;
	private int code;
	private String msg;
	private Object obj;

	private Integer total; // *总记录数
	private Integer page; // * 当前为第几页
	private Integer pagesize; // *每页xx条
	private List<T> rows; // 记录集合
	
	private String sort;
	private String order;
	
	

	


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

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	
	
	
}
