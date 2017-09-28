package com.ibm.ldszx.dao;

import java.util.List;

import com.ibm.beans.LineStatusBean;
import com.ibm.beans.UseAgeBean;

public interface ILdszxDao {
	public List<UseAgeBean> getNetworkData(); //获取网络带宽
	public List<UseAgeBean> getGuangqianData();//光纤交换机带宽利用率
	public List<LineStatusBean> getLineData();//获取网络链路状态 0 ok 1 link down 2 unused
}
