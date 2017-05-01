package com.servicecarclass.model;

import com.carclass.model.CarClassVO;
import com.services.model.ServicesVO;

public class ServiceCarClassVO implements java.io.Serializable {
	private ServicesVO servicesVO;
	private CarClassVO carClassVO;
	private Integer servPrice;
	private Integer servTime;
	private Integer carClassNo;
	
	
	public ServicesVO getServicesVO() {
		return servicesVO;
	}
	public void setServicesVO(ServicesVO servicesVO) {
		this.servicesVO = servicesVO;
	}
	public CarClassVO getCarClassVO() {
		return carClassVO;
	}
	public void setCarClassVO(CarClassVO carClassVO) {
		this.carClassVO = carClassVO;
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
	public Integer getCarClassNo() {
		return carClassNo;
	}
	public void setCarClassNo(Integer carClassNo) {
		this.carClassNo = carClassNo;
	}
	
	


}
