package com.ibm.jftp.dao;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.ibm.beans.AlertInfo;
import com.ibm.beans.DeviceInfo;

public interface IAlertHandlerDao {
	// 与页面显示相关
	public List<AlertInfo> getAlertInfo(String devOrganization); //根据机房，展示告警信息
	// 收到告警信息，存储

	public JsonNode deleteAlertInfo(int[] identifier); // 删除告警信息，入参是数组

	public List<AlertInfo> getAlertInfoBydevLocation(String devLocation,String devOrganization);//根据机柜编号查找所有的告警

	public List<DeviceInfo> getDeviceInfo(String devLocation, String devOrganization); // 获取某个机柜设备信息 
	
	public JsonNode makeAlertAcknowledges(int[] identifiers);//根据唯一ID 确认事件  返回更新的条数
}
