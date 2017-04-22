package com.membercars.model;

import com.cartype.model.CarTypeVO;
import com.memberinfo.model.MemberInfoVO;

public class MemberCarsVO {
	
	MemberInfoVO memberInfoVO;
	String carLicense;
	CarTypeVO carTypelVO;
	public MemberInfoVO getMemberInfoVO() {
		return memberInfoVO;
	}
	public void setMemberInfoVO(MemberInfoVO memberInfoVO) {
		this.memberInfoVO = memberInfoVO;
	}
	public String getCarLicense() {
		return carLicense;
	}
	public void setCarLicense(String carLicense) {
		this.carLicense = carLicense;
	}
	public CarTypeVO getCarTypelVO() {
		return carTypelVO;
	}
	public void setCarTypelVO(CarTypeVO carTypelVO) {
		this.carTypelVO = carTypelVO;
	}
	

}
