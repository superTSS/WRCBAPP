package com.ibm.beans;

public class LineStatusBean {
	private String lineName; // 线路名
	private int lineStatus; //25 green 75 red
	public String getLineName() {
		return lineName;
	}
	public void setLineName(String lineName) {
		this.lineName = lineName;
	}
	public int getLineStatus() {
		return lineStatus;
	}
	public void setLineStatus(int lineStatus) {
		this.lineStatus = lineStatus;
	}
	
}
