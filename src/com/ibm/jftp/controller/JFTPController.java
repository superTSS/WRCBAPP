package com.ibm.jftp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.beans.AlertInfo;
import com.ibm.beans.DeviceInfo;
import com.ibm.jftp.dao.IAlertHandlerDao;
import com.ibm.jftp.dao.impl.AlertHandlerImpl;

import common.Logger;
import net.sf.json.JSONArray;

@Controller
public class JFTPController {
	private ObjectMapper om = new ObjectMapper();
	private IAlertHandlerDao alertHandler = new AlertHandlerImpl();
	private static Logger logger = Logger.getLogger(JFTPController.class);

	public JFTPController() {

	}

	@RequestMapping("/zzx.do")
	public String logOnzzx() {
		return "zzx";
	}

	@RequestMapping("/fzx.do")
	public String logOnfzx() {
		return "fzx";
	}

	@RequestMapping("/yd.do")
	public String logOnyidi() {
		return "yd";
	}

	@RequestMapping("/zzxok.do")
	public String logOnzzxok() {
		return "zzxok";
	}

	@RequestMapping("/fzxok.do")
	public String logOnfzxok() {
		return "fzxok";
	}

	@RequestMapping("/ydok.do")
	public String logOnyidiok() {
		return "ydok";
	}

	// 删除告警
	@RequestMapping("deleteAlertInfo.do")
	@ResponseBody
	public JsonNode deleteAlertInfo(HttpServletRequest request) throws IOException {
		String Serial = request.getParameter("name");
		String[] Serials = Serial.split(",");
		int serialSize = Serials.length;//获取数组长度
		int[] serialArray = new int[serialSize];
 		for (int i = 0; i < Serials.length; i++)
			serialArray[i] = Integer.valueOf(Serials[i]);
		JsonNode jn = alertHandler.deleteAlertInfo(serialArray);
		return jn;
	}

	// 处理页面轮询请求，并返回告警的机柜和告警等级
	@RequestMapping(value = "getAlert.do")
	@ResponseBody
	public JSONArray getAlert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String location = request.getParameter("location");// 获取哪个机房
		JSONArray jsonArray2 = null;
		List<AlertInfo> list = new ArrayList<AlertInfo>();
		list = alertHandler.getAlertInfo(location);
		if (list == null)
			return new JSONArray();
		jsonArray2 = JSONArray.fromObject(list);
		return jsonArray2;
	}

	// 处理页面轮询请求，并返回告警的机柜和告警等级
	@RequestMapping(value = "getAlertDetail.do")
	@ResponseBody
	public ArrayNode getAlertDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ArrayNode an = om.createArrayNode();
		String jgbh = request.getParameter("jgbh");
		String devOrganization = request.getParameter("devOrganization");
		List<AlertInfo> list = alertHandler.getAlertInfoBydevLocation(jgbh, devOrganization);
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				ObjectNode temp = om.createObjectNode();
				temp.put("Node", list.get(i).getNode());
				temp.put("devName", list.get(i).getDevName());
				temp.put("devType", list.get(i).getDevType());
				temp.put("lastOccurrence", list.get(i).getLastOccurrence());
				temp.put("summary", list.get(i).getSummary());
				temp.put("Acknowledged", list.get(i).getAcknowledged());
				temp.put("severity", list.get(i).getSeverity());
				temp.put("identifier", list.get(i).getIdentifier());
				temp.put("Serial", list.get(i).getSerial());
				an.add(temp);
			}
			return an;
		} else
			return om.createArrayNode();
	}

	// 处理页面轮询请求，并返回告警的机柜和告警等级
	@RequestMapping(value = "getDeviceInfo.do")
	@ResponseBody
	public ArrayNode getDeviceInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ArrayNode arr1 = om.createArrayNode();
		String devLocation = request.getParameter("jgbh"); // 机柜编号 devLocation
		String devOrganization = request.getParameter("devOrganization");
		List<DeviceInfo> list = alertHandler.getDeviceInfo(devLocation, devOrganization);
		if (list != null)
			Collections.sort(list);
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				ObjectNode temp = om.createObjectNode();
				temp.put("devName", list.get(i).getDevName());
				temp.put("devLocation", list.get(i).getDevLocation());
				temp.put("Node", list.get(i).getNode());// ip
				temp.put("devType", list.get(i).getDevType());
				temp.put("devModel", list.get(i).getDevModel());
				arr1.add(temp);
			}
			return arr1;
		} else
			return om.createArrayNode();
	}

	// 将告警信息进行确认，确认的意思是处理这个告警结束
	@RequestMapping(value = "updateAcknowledged.do")
	@ResponseBody
	public JsonNode updateAcknowledged(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String serial = request.getParameter("name");// 获取所有的identifiers
		String[] serials = serial.split(",");
		int serialSize = serials.length;//获取数组长度
		int[] serialArr = new int[serialSize];
		
		for (int i = 0; i < serials.length; i++)
			serialArr[i]=Integer.valueOf(serials[i]);
		JsonNode jn = alertHandler.makeAlertAcknowledges(serialArr);// 去数据库将字段更新掉
		return jn;
	}

	// 主副中心 转换为中文
	public static String getChinese(String location) {
		if (location.equalsIgnoreCase("zzx"))
			return "主中心";
		else if (location.equalsIgnoreCase("fzx"))
			return "副中心";
		else if (location.equals("yd"))
			return "异地";
		else
			return null;
	}

	// 实时更新是否有在后台删除的告警，但是前台还存在红色的机柜
	@RequestMapping(value = "updateJiGuiInfo.do")
	@ResponseBody
	public ArrayNode updateRedJiGui(HttpServletRequest request, HttpServletResponse response) {
		String location = request.getParameter("location");
		String[] redlist = request.getParameterValues("selectedList");
		
		ArrayNode an = om.createArrayNode();
		if (redlist != null) {
			for (String jigui : redlist) {
				//String devOrganization = getChinese(location);  //转换成中文 主中心
				IAlertHandlerDao dao = new AlertHandlerImpl();
				List<AlertInfo> alertList = dao.getAlertInfoBydevLocation(jigui, location);
				ObjectNode on = om.createObjectNode();
				if (alertList.size() <= 0) {
					on.put(jigui, 1);// 表示该机柜告警没有了，所以红色标识位需要修改为绿色
				} else {
					on.put(jigui, 0);// 表示该机柜告警仍然存在
				}
				an.addPOJO(on);
			}
		}
		logger.info("更新机柜信息"+an);
		return an;
	}

}
