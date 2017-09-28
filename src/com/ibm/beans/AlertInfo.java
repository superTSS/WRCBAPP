package com.ibm.beans;


/*
 * 这是机房图告警信息Bean
 * */
public class AlertInfo {
	private String Identifier; // 告警唯一ID
	private int Serial;//唯一索引 数值
	private String Node;//设备IP
	private String devName;//设备名
	private String devType;//设备类型
	private String devOrganization;//设备所在中心 主中心-副中心-异地
	private String devRoom;//设备机房   //前置机房//网络机房
	private String devLocation;//设备所处机柜机架号 Q48
	private int Acknowledged;// 0 未确认  1 已确认
	private String alertType;//告警类型
	private String LastOccurrence;// 告警时间  最后发生时间   
	private String Summary;//告警内容
	private int Severity;// 告警内容    0绿色,3黄色,4橙色,5红色
	public String getIdentifier() {
		return Identifier;
	}
	public void setIdentifier(String identifier) {
		Identifier = identifier;
	}
	public String getNode() {
		return Node;
	}
	public void setNode(String node) {
		Node = node;
	}
	public String getDevName() {
		return devName;
	}
	public void setDevName(String devName) {
		this.devName = devName;
	}
	public String getDevType() {
		return devType;
	}
	public void setDevType(String devType) {
		this.devType = devType;
	}
	public String getDevOrganization() {
		return devOrganization;
	}
	public void setDevOrganization(String devOrganization) {
		this.devOrganization = devOrganization;
	}
	public String getDevRoom() {
		return devRoom;
	}
	public void setDevRoom(String devRoom) {
		this.devRoom = devRoom;
	}
	public String getDevLocation() {
		return devLocation;
	}
	public void setDevLocation(String devLocation) {
		this.devLocation = devLocation;
	}
	public int getAcknowledged() {
		return Acknowledged;
	}
	public void setAcknowledged(int acknowledged) {
		Acknowledged = acknowledged;
	}
	public String getAlertType() {
		return alertType;
	}
	public void setAlertType(String alertType) {
		this.alertType = alertType;
	}
	public String getLastOccurrence() {
		return LastOccurrence;
	}
	public void setLastOccurrence(String lastOccurrence) {
		LastOccurrence = lastOccurrence;
	}
	public String getSummary() {
		return Summary;
	}
	public void setSummary(String summary) {
		Summary = summary;
	}
	public int getSeverity() {
		return Severity;
	}
	public void setSeverity(int severity) {
		Severity = severity;
	}
	public int getSerial() {
		return Serial;
	}
	public void setSerial(int serial) {
		Serial = serial;
	}
	
}