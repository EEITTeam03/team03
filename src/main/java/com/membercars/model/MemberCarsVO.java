package com.membercars.model;

import java.util.HashSet;
import java.util.Set;

import com.cartype.model.CarTypeVO;
import com.memberinfo.model.MemberInfoVO;
import com.schedule.model.ReservVO;

public class MemberCarsVO {
	private MemberInfoVO memberInfoVO;
	private String carLicense;
	private CarTypeVO carTypeVO;
	
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
	public CarTypeVO getCarTypeVO() {
		return carTypeVO;
	}
	public void setCarTypeVO(CarTypeVO carTypeVO) {
		this.carTypeVO = carTypeVO;
	}
	public Set<ReservVO> getReserves() {
		return reserves;
	}
	public void setReserves(Set<ReservVO> reserves) {
		this.reserves = reserves;
	}
	private Set<ReservVO> reserves = new HashSet<ReservVO>();
	
	

}
