package com.servicecarclass.model;

import com.services.model.ServicesVO;

public class ServiceCarClassVO implements java.io.Serializable {
	private Integer servNo;
	private String carClass;
	private Integer servPrice;
	private Integer servTime;
	private Integer carClassNo;
	private ServicesVO servicesVO;
	
	public String getCarClass() {
		return carClass;
	}

	public void setCarClass(String carClass) {
		this.carClass = carClass;
	}

	public Integer getCarClassNo() {
		return carClassNo;
	}

	public void setCarClassNo(Integer carClassNo) {
		this.carClassNo = carClassNo;
	}

	public ServicesVO getServicesVO() {
		return servicesVO;
	}

	public void setServicesVO(ServicesVO servicesVO) {
		this.servicesVO = servicesVO;
	}

	public Integer getServNo() {
		return servNo;
	}

	public void setServNo(Integer servNo) {
		this.servNo = servNo;
	}

	public Integer getServPrice() {
		return servPrice;
	}

	public void setServPrice(Integer servPrice) {
		this.servPrice = servPrice;
	}

	public Integer getServTime() {
		return servTime;
	}

	public void setServTime(Integer servTime) {
		this.servTime = servTime;
	}

}
