package com.cartype.model;

import com.carclass.model.CarClassVO;

public class CarTypeVO {
	
	private String modelNo;
	private String brand;
	private String carModel;
	private CarClassVO carClassVO;
	
	
	public String getModelNo() {
		return modelNo;
	}
	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public CarClassVO getCarClassVO() {
		return carClassVO;
	}
	public void setCarClassVO(CarClassVO carClassVO) {
		this.carClassVO = carClassVO;
	}

	
	
}
