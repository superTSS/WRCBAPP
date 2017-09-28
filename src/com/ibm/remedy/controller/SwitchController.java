package com.ibm.remedy.controller;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.utils.HttpClientUtil;
import com.ibm.utils.PropertyUtil;

import net.sf.json.JSONObject;

/**
 * 在页面上做个可以控制脚本是否发送数据到Remedy 的开关 y 表示发送 y 表示不发送
 * 
 * @author Admin
 *
 */
@Controller
public class SwitchController {
	public static ObjectMapper om = new ObjectMapper();
	Properties p = PropertyUtil.getResourceFile("config/properties/remedy.properties");

	@RequestMapping("changeRemedy.do")
	@ResponseBody
	public JSONObject sendAlertInfo2Remedy(HttpServletRequest request) throws IOException {
		if (request.getMethod().equalsIgnoreCase("post")) {
			String ID = request.getParameter("id");
			String isOn = request.getParameter("on");
			ObjectNode inNode = om.createObjectNode();
			inNode.put("id", ID);
			inNode.put("on", isOn);
			String response = null;
			if(ID.equalsIgnoreCase("chRemedy1"))
			{
				response = HttpClientUtil.postMethod(p.getProperty("remedy_path"), inNode.toString());
			}
			if(ID.equalsIgnoreCase("chRemedy2"))
			{
				response = HttpClientUtil.postMethod(p.getProperty("remedy_standby_path"), inNode.toString());
			}
			JsonNode retNode = om.readTree(response);
			JSONObject finalNode = new JSONObject();
			finalNode.put("id", ID);
			finalNode.put("changed", "yes");
			finalNode.put("status", retNode.get("status").asText());
			return finalNode;
		}
		if (request.getMethod().equalsIgnoreCase("get")) {
			String response = httpGet();
			JSONObject obj = JSONObject.fromObject(response);
			return obj;
		}
		return null;
	}

	private static HttpMethod getGetMethod() {
		return new GetMethod("/remedy");
	}

	public String httpGet() throws HttpException, IOException {
		HttpClient client = new HttpClient();
		String remedyHost = p.getProperty("remedyHost");
		String remedyPort = p.getProperty("remedyPort");
		client.getHostConfiguration().setHost(remedyHost, Integer.valueOf(remedyPort), "http");
		HttpMethod method = getGetMethod(); // 使用 POST 方式提交数据
		client.executeMethod(method); // 打印服务器返回的状态
		String response = new String(method.getResponseBodyAsString().getBytes("8859_1"));
		// 打印返回的信息
		method.releaseConnection();
		return response;
	}
}
