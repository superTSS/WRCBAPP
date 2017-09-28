package com.ibm.beans;


public class DeviceInfo implements Comparable<DeviceInfo> {
	private String Node; // 设备IP
	private String devName; // 设备名称
	private String devType; // 设备类型
	private String devModel;// 设备型号
	private String devLocation;// Q48 13-15U //机柜和机架
	private String devRack;// 机架号 12U 13U 14-15U
	private String descrption;//决定硬件  hardware
	
	public String getDescrption() {
		return descrption;
	}

	public void setDescrption(String descrption) {
		this.descrption = descrption;
	}

	public String getNode() {
		return Node;
	}

	public void setNode(String node) {
		Node = node;
	}

	public String getDevName() {
		return devName;
	}

	public void setDevName(String devName) {
		this.devName = devName;
	}

	public String getDevLocation() {
		return devLocation;
	}

	public void setDevLocation(String devLocation) {
		this.devLocation = devLocation;
	}

	public String getDevType() {
		return devType;
	}

	public void setDevType(String devType) {
		this.devType = devType;
	}
	
	public String getDevModel() {
		return devModel;
	}

	public void setDevModel(String devModel) {
		this.devModel = devModel;
	}

	public String getDevRack() {
		return devRack;
	}

	public void setDevRack(String devRack) {
		this.devRack = devRack;
	}

	// a.compareTo(b)
	// a< b 为负数
	// a = b 为相等
	// a> b 为正数

	@Override
	public int compareTo(DeviceInfo o) {
		if(this.devRack==null || this.devRack.equals("")){
			return 0;
		}else{
			return -this.devRack.compareTo(o.devRack);
		}
	}

}
