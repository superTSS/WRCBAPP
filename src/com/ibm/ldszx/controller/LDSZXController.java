package com.ibm.ldszx.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.beans.LineStatusBean;
import com.ibm.beans.UseAgeBean;
import com.ibm.ldszx.dao.ILdszxDao;
import com.ibm.ldszx.dao.impl.LdszxDaoImpl;

@Controller
public class LDSZXController {
	private ObjectMapper om = new ObjectMapper();
	private ILdszxDao dao = new LdszxDaoImpl();

	@RequestMapping("/ldszx.do")
	public String logLDSZX() {
		return "ldszx";
	}

	// 处理页面轮询请求，并返回告警的机柜和告警等级
	@RequestMapping(value = "getNetworkData.do")
	@ResponseBody
	public ObjectNode getNetworkData(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		List<UseAgeBean> list = dao.getNetworkData();
		if (list != null) {
			ObjectNode totalNode = om.createObjectNode();// 总的node
			totalNode = setNetworkReturn(list);
			return totalNode;
		} else
			return om.createObjectNode();
	}

	// 处理页面轮询请求，并返回告警的机柜和告警等级
	@RequestMapping(value = "getGuangqianData.do")
	@ResponseBody
	public ObjectNode getGuangqianData(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		List<UseAgeBean> list = dao.getGuangqianData();

		if (list != null) {
			ObjectNode totalNode = om.createObjectNode();// 总的node
			totalNode = setGuangxianReturn(list);
			return totalNode;
		} else
			return om.createObjectNode();
	}

	private ObjectNode setNetworkReturn(List<UseAgeBean> list) {
		ObjectNode totalNode = om.createObjectNode();
		ObjectNode obj1001 = om.createObjectNode();
		ObjectNode obj1003 = om.createObjectNode();
		ObjectNode obj1005 = om.createObjectNode();
		ObjectNode obj10011 = om.createObjectNode();
		ObjectNode obj10012 = om.createObjectNode();
		ObjectNode obj10023 = om.createObjectNode();
		ObjectNode obj103254ae4 = om.createObjectNode();
		ObjectNode obj103254ae21 = om.createObjectNode();
		ObjectNode obj101240 = om.createObjectNode();
		ObjectNode obj10012po12 = om.createObjectNode();
		ObjectNode obj100112 = om.createObjectNode();

		ArrayNode obj1001_date_array = om.createArrayNode();
		ArrayNode obj1001_useage_array = om.createArrayNode();

		ArrayNode obj1003_date_array = om.createArrayNode();
		ArrayNode obj1003_useage_array = om.createArrayNode();

		ArrayNode obj1005_date_array = om.createArrayNode();
		ArrayNode obj1005_useage_array = om.createArrayNode();

		ArrayNode obj10011_date_array = om.createArrayNode();
		ArrayNode obj10011_useage_array = om.createArrayNode();

		ArrayNode obj10012_date_array = om.createArrayNode();
		ArrayNode obj10012_useage_array = om.createArrayNode();

		ArrayNode obj10023_date_array = om.createArrayNode();
		ArrayNode obj10023_useage_array = om.createArrayNode();

		ArrayNode obj103254ae4_date_array = om.createArrayNode();
		ArrayNode obj103254ae4_useage_array = om.createArrayNode();

		ArrayNode obj103254ae21_date_array = om.createArrayNode();
		ArrayNode obj103254ae21_useage_array = om.createArrayNode();

		ArrayNode obj101240_date_array = om.createArrayNode();
		ArrayNode obj101240_useage_array = om.createArrayNode();

		ArrayNode obj10012po12_date_array = om.createArrayNode();
		ArrayNode obj10012po12_useage_array = om.createArrayNode();

		ArrayNode obj100112_date_array = om.createArrayNode();
		ArrayNode obj100112_useage_array = om.createArrayNode();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getLinename().equalsIgnoreCase("166.3.100.1-Ethernet3/1")) {
				obj1001_date_array.add(list.get(i).getDate());
				obj1001_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.100.3-Ethernet3/21")) {
				obj1003_date_array.add(list.get(i).getDate());
				obj1003_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.100.5-Ethernet3/45")) {
				obj1005_date_array.add(list.get(i).getDate());
				obj1005_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.100.12-Po76")) {
				obj10012_date_array.add(list.get(i).getDate());
				obj10012_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.100.11-Po39")) {
				obj10011_date_array.add(list.get(i).getDate());
				obj10011_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.100.23-Gi1/1/1")) {
				obj10023_date_array.add(list.get(i).getDate());
				obj10023_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.103.254-ae4")) {
				obj103254ae4_date_array.add(list.get(i).getDate());
				obj103254ae4_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.103.254-ae21")) {
				obj103254ae21_date_array.add(list.get(i).getDate());
				obj103254ae21_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.101.240-ge0/0/47")) {
				obj101240_date_array.add(list.get(i).getDate());
				obj101240_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.100.12-Po12")) {
				obj10012po12_date_array.add(list.get(i).getDate());
				obj10012po12_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equalsIgnoreCase("166.3.100.112-Gi2/13")) {
				obj100112_date_array.add(list.get(i).getDate());
				obj100112_useage_array.add(list.get(i).getUseage());
			}
		}

		obj1001.putPOJO("capdate", obj1001_date_array);
		obj1001.putPOJO("useage", obj1001_useage_array);
		totalNode.putPOJO("ip16631001Ethernet31", obj1001);

		obj1003.putPOJO("capdate", obj1003_date_array);
		obj1003.putPOJO("useage", obj1003_useage_array);
		totalNode.putPOJO("ip16631003Ethernet321", obj1003);

		obj1005.putPOJO("capdate", obj1005_date_array);
		obj1005.putPOJO("useage", obj1005_useage_array);
		totalNode.putPOJO("ip16631005Ethernet345", obj1005);

		obj10011.putPOJO("capdate", obj10011_date_array);
		obj10011.putPOJO("useage", obj10011_useage_array);
		totalNode.putPOJO("ip166310011Po39", obj10011);

		obj10012.putPOJO("capdate", obj10012_date_array);
		obj10012.putPOJO("useage", obj10012_useage_array);
		totalNode.putPOJO("ip166310012Po76", obj10012);

		obj10023.putPOJO("capdate", obj10023_date_array);
		obj10023.putPOJO("useage", obj10023_useage_array);
		totalNode.putPOJO("ip166310023Gi111", obj10023);

		obj103254ae4.putPOJO("capdate", obj103254ae4_date_array);
		obj103254ae4.putPOJO("useage", obj103254ae4_useage_array);
		totalNode.putPOJO("ip1663103254ae4", obj103254ae4);

		obj103254ae21.putPOJO("capdate", obj103254ae21_date_array);
		obj103254ae21.putPOJO("useage", obj103254ae21_useage_array);
		totalNode.putPOJO("ip1663103254ae21", obj103254ae21);

		obj101240.putPOJO("capdate", obj101240_date_array);
		obj101240.putPOJO("useage", obj101240_useage_array);
		totalNode.putPOJO("ip1663101240ge0047", obj101240);

		obj10012po12.putPOJO("capdate", obj10012po12_date_array);
		obj10012po12.putPOJO("useage", obj10012po12_useage_array);
		totalNode.putPOJO("ip166310012Po12", obj10012po12);

		obj100112.putPOJO("capdate", obj100112_date_array);
		obj100112.putPOJO("useage", obj100112_useage_array);
		totalNode.putPOJO("ip1663100112Gi213", obj100112);

		System.out.println(totalNode);
		return totalNode;
	}

	private ObjectNode setGuangxianReturn(List<UseAgeBean> list) {
		ObjectNode totalNode = om.createObjectNode();
		ArrayNode guangqian_z2f_virtual_date_array = om.createArrayNode(); // 主到副的光纤虚拟化(SRDF)
		ArrayNode guangqian_z2f_virtual_useage_array = om.createArrayNode();

		ArrayNode guangqian_z2f_nbu_date_array = om.createArrayNode(); // 主到副的光纤NBU
		ArrayNode guangqian_z2f_nbu_useage_array = om.createArrayNode();

		ArrayNode guangqian_z2f_storage_date_array = om.createArrayNode(); // 主到副的光纤存储(mirrorView)
		ArrayNode guangqian_z2f_storage_useage_array = om.createArrayNode();

		ObjectNode guangqian_z2f_virtual_inner_obj = om.createObjectNode(); // 光纤主到副的虚拟化(SRDF)
		ObjectNode guangqian_z2f_nbu_inner_obj = om.createObjectNode(); // 光纤主到副的nbu
		ObjectNode guangqian_z2f_storage_inner_obj = om.createObjectNode(); // 主到副的光纤存储(mirrorView)

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getLinename().equals("MIRRORVIEW")) {
				guangqian_z2f_virtual_date_array.add(list.get(i).getDate());
				guangqian_z2f_virtual_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equals("NBU")) {
				guangqian_z2f_nbu_date_array.add(list.get(i).getDate());
				guangqian_z2f_nbu_useage_array.add(list.get(i).getUseage());
			} else if (list.get(i).getLinename().equals("SRDF")) {
				guangqian_z2f_storage_date_array.add(list.get(i).getDate());
				guangqian_z2f_storage_useage_array.add(list.get(i).getUseage());
			}
		}

		guangqian_z2f_virtual_inner_obj.putPOJO("capdate", guangqian_z2f_virtual_date_array);
		guangqian_z2f_virtual_inner_obj.putPOJO("useage", guangqian_z2f_virtual_useage_array);
		totalNode.putPOJO("guangqian_z2f_virtual", guangqian_z2f_virtual_inner_obj);

		guangqian_z2f_nbu_inner_obj.putPOJO("capdate", guangqian_z2f_nbu_date_array);
		guangqian_z2f_nbu_inner_obj.putPOJO("useage", guangqian_z2f_nbu_useage_array);
		totalNode.putPOJO("guangqian_z2f_nbu", guangqian_z2f_nbu_inner_obj);

		guangqian_z2f_storage_inner_obj.putPOJO("capdate", guangqian_z2f_storage_date_array);
		guangqian_z2f_storage_inner_obj.putPOJO("useage", guangqian_z2f_storage_useage_array);
		totalNode.putPOJO("guangqian_z2f_storage", guangqian_z2f_storage_inner_obj);
		return totalNode;
	}

	// 处理页面轮询请求，并返回告警的机柜和告警等级
	@RequestMapping(value = "getLineData.do")
	@ResponseBody
	public ObjectNode getLineData(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		List<LineStatusBean> list = dao.getLineData();

		if (list != null) {
			ObjectNode totalNode = om.createObjectNode();// 总的node
			totalNode = setLineDataReturn(list);
			return totalNode;
		} else
			return om.createObjectNode();
	}

	// 将线路状态返回给前端格式
	private ObjectNode setLineDataReturn(List<LineStatusBean> list) {
		ObjectNode total = om.createObjectNode();
		ObjectNode zfhxhl= om.createObjectNode();
		ObjectNode zfyghl= om.createObjectNode();
		ObjectNode zyyghl= om.createObjectNode();
		ObjectNode fyyghl = om.createObjectNode();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getLineName().equalsIgnoreCase("主副核心互联")) {
				zfhxhl.put("zfhxhl", list.get(i).getLineStatus());
			} else if (list.get(i).getLineName().equalsIgnoreCase("主副运管互联")) {
				zfyghl.put("zfyghl", list.get(i).getLineStatus());
			} else if (list.get(i).getLineName().equalsIgnoreCase("主异运管互联")) {
				zyyghl.put("zyyghl", list.get(i).getLineStatus());
			} else if (list.get(i).getLineName().equalsIgnoreCase("副异运管互联")) {
				fyyghl.put("fyyghl", list.get(i).getLineStatus());
			}
		}
		total.putPOJO("zfhxhl", zfhxhl);
		total.putPOJO("zfyghl",zfyghl);
		total.putPOJO("zyyghl",zyyghl);
		total.putPOJO("fyyghl",fyyghl);
		
		
		return total;
	}
}
