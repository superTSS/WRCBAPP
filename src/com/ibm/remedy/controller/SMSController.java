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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.utils.HttpClientUtil;
import com.ibm.utils.PropertyUtil;

import net.sf.json.JSONObject;

@Controller
public class SMSController {
	public static ObjectMapper om = new ObjectMapper();
	Properties amsprop = PropertyUtil.getResourceFile("config/properties/remedy.properties");
	@RequestMapping("sms.do")
	@ResponseBody
	public JSONObject sms(HttpServletRequest request) throws IOException {
		if (request.getMethod().equalsIgnoreCase("post")) {
			// post 方法去更新短信联系人
			String telephones = request.getParameter("telephones");
			ObjectNode inNode = om.createObjectNode();
			inNode.put("telephones",telephones);
			String smsPath = amsprop.getProperty("smsPath");//获取短信发送地址
			String retMsg= HttpClientUtil.postMethod(smsPath, inNode.toString());
			System.out.println(retMsg);
			JSONObject obj = new JSONObject();
			obj.put("status", "ok");
			return obj;
		}
		if (request.getMethod().equalsIgnoreCase("get")) {
			// get 方法去获取当前联系人
			String response =  httpGet();
			JSONObject obj = JSONObject.fromObject(response);
			return obj;
		}
		return null;
	}
	private static HttpMethod getGetMethod(){ 
	      return new GetMethod("/sms"); 
	   } 
	public String httpGet() throws HttpException, IOException {
		HttpClient client = new HttpClient();
		String smsHost = amsprop.getProperty("smsHost");
		String smsPort = amsprop.getProperty("smsPort");
		client.getHostConfiguration().setHost(smsHost, Integer.valueOf(smsPort), "http");
		HttpMethod method = getGetMethod(); // 使用 POST 方式提交数据
		client.executeMethod(method); // 打印服务器返回的状态
		String response = new String(method.getResponseBodyAsString().getBytes("8859_1"));
		// 打印返回的信息
		method.releaseConnection();
		return response;
	}

}
