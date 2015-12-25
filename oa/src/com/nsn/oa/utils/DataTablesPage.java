package com.nsn.oa.utils;

import java.util.List;

public class DataTablesPage<T> {
 
	/*
	服务器返回的数据的格式 :
	{
		"sEcho":1,
		"iTotalRecords":26,        //总数据条数
		"iTotalDisplayRecords":26,
		"aaData":[      //一页数据
				{"userId":"001","account":"dandan1","username":"dandan1","gender":"male"},
				{"userId":"002","account":"dandan2","username":"dandan2","gender":"male"},
				{"userId":"003","account":"dandan3","username":"dandan3","gender":"male"}
		]
	}
	*/
	
	private String sEcho;
	private int iDisplayStart;
	private int iDisplayLength;
	private int iTotalRecords;
	private int iTotalDisplayRecords;
	private List<T> data;
	
	
	public String getSEcho() {
		return sEcho;
	}
	public void setSEcho(String sEcho) {
		this.sEcho = sEcho;
	}
	public int getIDisplayStart() {
		return iDisplayStart;
	}
	public void setIDisplayStart(int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}
	public int getIDisplayLength() {
		return iDisplayLength;
	}
	public void setIDisplayLength(int iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}
	public int getITotalRecords() {
		return iTotalRecords;
	}
	public void setITotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}
	public int getITotalDisplayRecords() {
		return iTotalDisplayRecords;
	}
	public void setITotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}

	
}
