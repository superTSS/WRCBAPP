package com.ibm.ldszx.dao.impl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibm.beans.LineStatusBean;
import com.ibm.beans.UseAgeBean;
import com.ibm.ldszx.dao.ILdszxDao;
import com.ibm.utils.SqlUtil;

import common.Logger;

public class LdszxDaoImpl implements ILdszxDao {
	private static Logger logger = Logger.getLogger(LdszxDaoImpl.class);

	// 大数相除的方法 a/4294967295L 只适用于nexus 7K交换机
	public static float divide(long a) {
		BigDecimal bdi1 = new BigDecimal(a * 800);
		BigDecimal bdi2 = new BigDecimal(4294967295L);
		BigDecimal bdi3 = bdi1.divide(bdi2, 2, BigDecimal.ROUND_HALF_EVEN);
		return Float.valueOf(bdi3.toString());
	}

	// 获取网络带宽率用率
	@Override
	public List<UseAgeBean> getNetworkData() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<UseAgeBean> list = new ArrayList<UseAgeBean>();
		String network_sql = SqlUtil.getNetworkSQL();
		//logger.info(network_sql);
		try {
			conn = SqlUtil.getNetworkConn();
			if (conn == null)
				return null;
			ps = conn.prepareStatement(network_sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				UseAgeBean uab = new UseAgeBean();
				int useage = rs.getInt("value");
				int curDatetime = rs.getInt("time");
				uab.setLinename(rs.getString("linename"));
				uab.setDate(SqlUtil.stampToDate(curDatetime + "000"));
				uab.setUseage(divide((long) useage));
				list.add(uab);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtil.CloseResource(rs, ps, conn);
		}
		return list;
	}

	// 获取光纤带宽利用率
	@Override
	public List<UseAgeBean> getGuangqianData() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<UseAgeBean> list = new ArrayList<UseAgeBean>();
		// String guangqian_sql = "select 'NBU' product , a.m_send_bndw_perc
		// percentage ,to_char(b.prf_timestamp,'MM-DD HH24:MI:SS') captime from
		// tpc.t_prf_switch_port a inner join tpc.t_prf_timestamp b on a.dev_id
		// = 39784 and a.time_id = b.time_id and a.element_id in ( select
		// port_id from tpc.t_res_port where name = '20C10027F8754400') and
		// b.prf_timestamp > current timestamp - 12 hour and b.prf_timestamp <
		// current timestamp union all select 'MIRRORVIEW' product,
		// a.m_send_bndw_perc percentage,to_char(b.prf_timestamp,'MM-DD
		// HH24:MI:SS') captime from tpc.t_prf_switch_port a inner join
		// tpc.t_prf_timestamp b on a.dev_id = 39779 and a.time_id = b.time_id
		// and a.element_id in ( select port_id from tpc.t_res_port where name =
		// '202B0027F8B823F0') and b.prf_timestamp > current timestamp - 12 hour
		// and b.prf_timestamp < current timestamp union all select 'SRDF'
		// product, a.m_send_bndw_perc percentage,
		// to_char(b.prf_timestamp,'MM-DD HH24:MI:SS') captime from
		// tpc.t_prf_switch_port a inner join tpc.t_prf_timestamp b on a.dev_id
		// = 39774 and a.time_id = b.time_id and a.element_id in ( select
		// port_id from tpc.t_res_port where name = '201C0027F8754A00') and
		// b.prf_timestamp > current timestamp - 12 hour and b.prf_timestamp <
		// current timestamp";
		String guangqian_sql = SqlUtil.getGuangqianSQL();
		//logger.info(guangqian_sql);
		try {
			conn = SqlUtil.getTPCConnection();
			if (conn == null)
				return null;
			ps = conn.prepareStatement(guangqian_sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				UseAgeBean uab = new UseAgeBean();
				uab.setDate(rs.getString("captime"));
				uab.setUseage((float) rs.getInt("percentage") / 100);
				uab.setLinename(rs.getString("product"));
				list.add(uab);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SqlUtil.CloseResource(rs, ps, conn);
		}

		return list;
	}

	// 返回链路状态，这个需要从omnibus 中获取 0- 50 是绿色 50 - 100 是红色
	@Override
	public List<LineStatusBean> getLineData() {
		List<LineStatusBean> llsb = new ArrayList<LineStatusBean>();
		LineStatusBean zfhxhl = new LineStatusBean(); // 主副核心互联
		LineStatusBean zfyghl = new LineStatusBean(); // 主副运管互联
		LineStatusBean zyyghl = new LineStatusBean(); // 主异运管互联
		LineStatusBean fyyghl = new LineStatusBean(); // 副异运管互联

		zfhxhl.setLineName("主副核心互联");
		zfhxhl.setLineStatus(5);

		zfyghl.setLineName("主副运管互联");
		zfyghl.setLineStatus(15);

		zyyghl.setLineName("主异运管互联");
		zyyghl.setLineStatus(25);

		fyyghl.setLineName("副异运管互联");
		fyyghl.setLineStatus(35);

		llsb.add(zfhxhl);
		llsb.add(zfyghl);
		llsb.add(zyyghl);
		llsb.add(fyyghl);

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		//String sql_getLinestatus = "select '主副核心互联' as lineName , Severity   from alerts.status where Severity = 5 and   sysName = '主副核心互联' and Node = '166.3.100.1' and Summary like 166.3.251.250' union all select '主副运管互联' as lineName , Severity   from alerts.status where Severity = 5 and   sysName = '主副运管互联' and Node = '166.3.103.254' and Summary like '166.3.125.129' union all select '副异运管互联' as lineName , Severity   from alerts.status where Severity = 5 and   sysName = '副异运管互联' and Node = '166.3.101.240' and Summary like '166.7.125.130' union all select '主异运管互联' as lineName , Severity   from alerts.status where Severity = 5 and   sysName = '主异运管互联' and Node = '166.3.103.254' and Summary like '166.3.125.30'";
		String sql_getLinestatus =SqlUtil.getNetworkLineSQL();
		//logger.info(sql_getLinestatus);
		try {
			conn = SqlUtil.getConnection();
			if (conn == null) {
				return null;
			}
			ps = conn.prepareStatement(sql_getLinestatus);
			rs = ps.executeQuery();
			while (rs.next()) {
				String lineName = rs.getString("lineName");
				//if (lineName.equalsIgnoreCase("") || (lineName == null)) {
				if (lineName == null) {
				} else {
					for (LineStatusBean lsb : llsb) {
						if (lsb.getLineName().equals(lineName)) {
							if (rs.getInt("Severity") == 5) {
								lsb.setLineStatus(75);
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return llsb;
	}

}
