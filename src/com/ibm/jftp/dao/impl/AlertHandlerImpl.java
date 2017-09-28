package com.ibm.jftp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ibm.beans.AlertInfo;
import com.ibm.beans.DeviceInfo;
import com.ibm.jftp.dao.IAlertHandlerDao;
import com.ibm.utils.DateUtil;
import com.ibm.utils.SqlUtil;

import common.Logger;

public class AlertHandlerImpl implements IAlertHandlerDao {
	private ObjectMapper om = new ObjectMapper();
	private static Logger logger = Logger.getLogger(AlertHandlerImpl.class);

	// 方法是产生delete 语句sql 动态变化?
	/*
	public static String createDelSql(String[] identifiers) {
		StringBuffer buf = new StringBuffer();
		buf.append("delete from alerts.status where Identifier in (");
		for (int m = 0; m < identifiers.length; m++) {
			if (m != 0)
				buf.append(',');
			buf.append("'" + identifiers[m] + "'");
		}
		buf.append(')');
		return buf.toString();
	}
	*/
	// 方法是产生delete 语句sql 动态变化?
		public static String createDelSql(int[] serials) {
			StringBuffer buf = new StringBuffer();
			buf.append("delete from alerts.status where Serial in (");
			for (int m = 0; m < serials.length; m++) {
				if (m != 0)
					buf.append(',');
				buf.append("" + serials[m] + "");
			}
			buf.append(')');
			return buf.toString();
		}


	// 动态生成UPDATE SQL
	/*public static String createUpdateSql(String[] identifiers) {
		StringBuffer sb = new StringBuffer();
		sb.append("update  alerts.status set Acknowledged = 1 where Identifier in (");
		for (int m = 0; m < identifiers.length; m++) {
			if (m != 0)
				sb.append(',');
			sb.append("'" + identifiers[m] + "'");
		}
		sb.append(')');
		return sb.toString();
	}*/
	
	public static String createUpdateSql(int[] Serials) {
		StringBuffer sb = new StringBuffer();
		sb.append("update  alerts.status set Acknowledged = 1 where Serial in (");
		for (int m = 0; m < Serials.length; m++) {
			if (m != 0)
				sb.append(',');
			sb.append("" + Serials[m] + "");
		}
		sb.append(')');
		return sb.toString();
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

	@Override
	public List<AlertInfo> getAlertInfo(String devOrganization) {
		List<AlertInfo> list = new ArrayList<AlertInfo>();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;

		String devOrganization1 = getChinese(devOrganization);
		String sql_getAlert = "select devLocation,Severity from status where Severity > 3 and ((AlertClass='snmp' and AlertGroup != 'TPC') or (AlertGroup='Ping') or (devType = '交换机') or (devType = '防火墙') or (devType = '路由器') or (devType = '负载均衡')) and devOrganization = '"+ devOrganization1 + "'";
		logger.info(sql_getAlert);
		try {
			conn = SqlUtil.getConnection();
			if (conn == null)
				return null;
			ps = conn.prepareStatement(sql_getAlert);
			rs = ps.executeQuery();
			while (rs.next()) {
				AlertInfo ai = new AlertInfo();
				ai.setDevLocation(rs.getString("devLocation").trim());
				ai.setSeverity(rs.getInt("Severity"));
				list.add(ai);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtil.CloseResource(rs, ps, conn);
		}
		return list;
	}

	@Override
	public JsonNode deleteAlertInfo(int[] serials) {
		ObjectNode on = om.createObjectNode();
		Connection conn = null;
		int total = 0;
		PreparedStatement ps = null;
		String sql_delAlert = createDelSql(serials);
		try {
			conn = SqlUtil.getConnection();
			ps = conn.prepareStatement(sql_delAlert);
			total = ps.executeUpdate();
			on.put("status", 1);
		} catch (SQLException e) {
			e.printStackTrace();
			on.put("status", 0);
		} finally {
			SqlUtil.CloseResource(null, ps, conn);
		}
		on.put("total", total);
		return on;
	}

	// jgbh 机柜编号
	// isNetworkDevice 是否是网络设备 yes / no
	// devOrganization 主中心、副中心、异地
	@Override
	public List<DeviceInfo> getDeviceInfo(String devLocation, String devOrganization) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<DeviceInfo> list = new ArrayList<DeviceInfo>();
		String devOrganization1 = getChinese(devOrganization);
		String sql = "SELECT T2.IP,T1.HOSTNAME \"devName\",T5.NAME \"devType\",T1.Model \"devModel\", T6.NAME \"devOrgnization\",T3.NAME \"devRoom\",T1.DEVLOCATION \"devLocation\",T1.DEVRACK \"devRack\" FROM SYSTEM_SERVER_INFO T1 INNER JOIN SERVER_IP_LIST T2 ON T2.SERVERID=T1.ID LEFT JOIN SYSTEM_CODE_INFO T3 ON T3.ID=T1.DEVROOMID  LEFT JOIN SYSTEM_CODE_INFO T5 ON T5.ID=T1.TYPE LEFT JOIN SYSTEM_CODE_INFO T6 ON T6.ID=T1.ROOM LEFT JOIN SYSTEM_SERVER_GROUP T7 ON T1.GROUPID=T7.ID WHERE T7.GROUPNAME='硬件' AND T6.NAME='"
				+ devOrganization1 + "' AND T1.DEVLOCATION='" + devLocation
				+ "' UNION ALL SELECT T1.IP,T1.NAME \"devName\",T1.CATEGORYNAME \"devName\",T1.TYPENAME \"devType\",T3.NAME \"devOrgnaization\",T2.NAME \"devRoom\",T1.DEVLOCATION \"devLocation\",T1.DEVRACK \"devRack\" FROM NETWORK_DEVICE_INFO T1 LEFT JOIN SYSTEM_CODE_INFO T2 ON T2.ID=T1.DEVROOMID LEFT JOIN SYSTEM_CODE_INFO T3 ON T3.ID=T1.AREAID WHERE T3.NAME='"
				+ devOrganization1 + "' AND T1.DEVLOCATION='" + devLocation + "'";
		logger.info(sql);
		try {
			conn = SqlUtil.getCMDBConnection();
			if (conn == null) {
				return null;
			}
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				DeviceInfo di = new DeviceInfo();
				di.setNode(rs.getString("IP"));// ip
				di.setDevName(rs.getString("devName"));
				di.setDevType(rs.getString("devType"));
				di.setDevModel(rs.getString("devModel"));
				di.setDevLocation(rs.getString("devLocation") + " " + rs.getString("devRack"));
				String formatDevRack = Str2Format(rs.getString("devRack"));
				di.setDevRack(formatDevRack);
				/*Clob clob = rs.getClob("description");
				if (clob != null) {
					String detailinfo = "";
					detailinfo = clob.getSubString((long) 1, (int) clob.length());
					if (detailinfo.equalsIgnoreCase("hardware")) {
						di.setDescrption(detailinfo);
					}
				}
			    */
				list.add(di);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtil.CloseResource(rs, ps, conn);
		}
		return list;
	}

	// 根据机柜编号找到所有的该机柜告警 devLocation = Q48 不 需要截获字符串
	// devOrganization=主中心、副中心、异地
	@Override
	public List<AlertInfo> getAlertInfoBydevLocation(String devLocation, String devOrganization) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String devOrganization1=getChinese(devOrganization);
		//String sql_getAlert = "select devLocation,Severity from status where Severity > 3 and ((AlertClass='snmp' and AlertGroup != 'TPC') or AlertGroup='Ping') and devOrganization = '"+ devOrganization1 + "'";
		String sql_getAlert = "select Node,sysName , devType,devLocation,LastOccurrence,Summary,Severity,Identifier,Acknowledged,Serial from status where Severity > 3 and ((AlertClass='snmp' and AlertGroup != 'TPC') or (AlertGroup='Ping') or (devType = '交换机') or (devType = '防火墙') or (devType = '路由器') or (devType = '负载均衡'))  and devOrganization = '"+ devOrganization1 + "' and devLocation = '" + devLocation + "' order by Severity desc";
		logger.info(sql_getAlert);
		List<AlertInfo> list = new ArrayList<AlertInfo>();
		try {
			conn = SqlUtil.getConnection();
			if (conn == null)
				return null;
			ps = conn.prepareStatement(sql_getAlert);
			rs = ps.executeQuery();
			while (rs.next()) {
				AlertInfo ai = new AlertInfo();
				ai.setNode(rs.getString("Node"));
				ai.setDevName(rs.getString("sysName")); // sysName 又是系统名要是设备名
				ai.setDevType(rs.getString("devType"));
				ai.setDevLocation(rs.getString("devLocation"));
				ai.setLastOccurrence(DateUtil.TimeStamp2Date(rs.getLong("LastOccurrence"), "yyyy-MM-dd HH:mm:ss"));
				ai.setIdentifier(rs.getString("Identifier"));
				ai.setAcknowledged(rs.getInt("Acknowledged"));
				ai.setSummary(rs.getString("Summary"));
				ai.setSeverity(rs.getInt("Severity"));
				ai.setSerial(rs.getInt("Serial"));   // 唯一序列号
				list.add(ai);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			SqlUtil.CloseResource(rs, ps, conn);
		}

		return list;
	}

	// 选择事件进行确认是否处理完毕
	@Override
	public JsonNode makeAlertAcknowledges(int[] serials) {
		int total = 0;
		ObjectNode on = om.createObjectNode();
		Connection conn = null;
		PreparedStatement ps = null;

		String update_sql = createUpdateSql(serials);
		try {
			conn = SqlUtil.getConnection();
			ps = conn.prepareStatement(update_sql);
			total = ps.executeUpdate();
			on.put("status", 1);
		} catch (SQLException e) {
			e.printStackTrace();
			on.put("status", 0);
		} finally {
			SqlUtil.CloseResource(null, ps, conn);
		}
		on.put("total", total);
		return on;
	}

	/*
	 * 将 2U 这种转换为 02U 将3-12U 转换为03-12U 将15-25U不转换
	 */
	public static String Str2Format(String inStr) {
		if (inStr == null)
			return "";
		if (inStr.length() == 2) { // 2U
			return "0" + inStr.toUpperCase();
		} else if (inStr.length() == 3) {// 12U
			return inStr.toUpperCase();
		} else if (inStr.indexOf("-") > -1) {
			StringBuffer sb = new StringBuffer();
			String[] splitStr = inStr.split("-");
			if (splitStr[0].length() == 1) { // 如果第一个字符串是2u 需要改成02u
				sb.append("0").append(splitStr[0].toUpperCase()).append("-");
			} else {
				sb.append(splitStr[0].toUpperCase()).append("-");
			}
			if (splitStr[1].length() == 2) {
				sb.append("0").append(splitStr[1].toUpperCase());
			} else {
				sb.append(splitStr[1].toUpperCase());
			}
			return sb.toString();
		}
		return inStr;
	}

	public static void main(String[] args) {
		int[] serial = new int[3];
		serial[0]=1;
		serial[1]=2;
		serial[2]=3;
		System.out.println(createDelSql(serial));

	}
}
