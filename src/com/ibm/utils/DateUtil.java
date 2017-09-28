package com.ibm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	//将日期字符串转换为日期格式
	public static Date StrToDate(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date date = sdf.parse(dateStr);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	//UNIX 时间戳转换为年月日
	public static String TimeStamp2Date(long timestampString, String formats){  
		  String date = new java.text.SimpleDateFormat(formats).format(new java.util.Date(timestampString*1000));  
		  return date;  
		}
	
	
	
	
	
	
	public static void main(String[] args) {
		Date d = StrToDate("2016-12-14 12:12:12");
		System.out.println(d);
	}
}
