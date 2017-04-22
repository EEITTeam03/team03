package com.carclass.model;

import java.util.Set;

import com.cartype.model.CarTypeVO;

public class CarClassVO {
	private String carClass;
	private String className;
	private Set<CarTypeVO> carTypes;
	
	public Set<CarTypeVO> getCarTypes() {
		return carTypes;
	}
	public void setCarTypes(Set<CarTypeVO> carTypes) {
		this.carTypes = carTypes;
	}
	public String getCarClass() {
		return carClass;
	}
	public void setCarClass(String carClass) {
		this.carClass = carClass;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	
	

}
