package com.ibm.beans;


//ldszx 带宽利用率Bean
public class UseAgeBean {
     private String date;//时间
     private float useage;//使用率
     private String linename;//哪个线路
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public float getUseage() {
		return useage;
	}
	public void setUseage(float useage) {
		this.useage = useage;
	}
	public String getLinename() {
		return linename;
	}
	public void setLinename(String linename) {
		this.linename = linename;
	}
	
}
