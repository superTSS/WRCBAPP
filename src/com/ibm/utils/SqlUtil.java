package com.ibm.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

public class SqlUtil {
	private static Properties prop = null;

	static {
		prop = PropertyUtil.getResourceFile("config/properties/db.properties");
	}
	
	/**
	 * 获取一个数据库连接 
	 * @return
	 */
	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName("com.sybase.jdbc4.jdbc.SybDriver");
			conn = DriverManager.getConnection(prop.getProperty("omnibus.url"),prop.getProperty("omnibus.username"),prop.getProperty("omnibus.password"));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
		
	}

	/**
	 * 获取一个CMDB数据库连接
	 * 
	 * @return
	 */
	public static Connection getCMDBConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(prop.getProperty("cmdb.url"),prop.getProperty("cmdb.username"),prop.getProperty("cmdb.password"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;

	}
	
	/**
	 * 获取一个两地三中心 tpc 库连接数据库连接
	 * 
	 * @return
	 */
	public static Connection getTPCConnection() {
		Connection conn = null;
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			conn = DriverManager.getConnection(prop.getProperty("tpc.url"),prop.getProperty("tpc.username"),prop.getProperty("tpc.password"));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;

	}
	
	//获取网络带宽利用率
	public static Connection getNetworkConn()
	{
		Connection conn = null;
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			conn = DriverManager.getConnection(prop.getProperty("network.url"),prop.getProperty("network.username"),prop.getProperty("network.password"));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	/**
	 * 关闭资源
	 * 
	 * @param rs
	 * @param ps
	 * @param conn
	 */
	public static void CloseResource(ResultSet rs, PreparedStatement ps, Connection conn) {
		// 关闭resultSet
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rs = null;
		}
		// 关闭preparedstatement
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			ps = null;
		}
		// 关闭connection
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}

	//两地三中心给光纤SAN交换机带宽利用率使用
	public static String getGuangqianSQL()
	{
		String guangqianSQL= (String)prop.getProperty("guangqian_sql");
		return guangqianSQL;
	}
	
	//获取网络链路状态
		public static String getNetworkLineSQL()
		{
			String lineSQL= (String)prop.getProperty("line_sql");
			return lineSQL;
		}
	
	
	
	//获取网络带宽利用率
	public static String getNetworkSQL()
	{
		String guangqianSQL= (String)prop.getProperty("network_sql");
		return guangqianSQL;
	}
	
	//将unix 时间戳转换为 年月日时分秒
	public static String stampToDate(String s){
	    String res;
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM-dd HH:mm:ss");
	    long lt = new Long(s);
	    Date date = new Date(lt);
	    res = simpleDateFormat.format(date);
	    return res;
	}
	
}
