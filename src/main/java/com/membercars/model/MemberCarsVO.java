package com.membercars.model;

import java.util.HashSet;
import java.util.Set;

import com.schedule.model.ReservVO;

public class MemberCarsVO {
	private Integer memberNo;
	private String carLicense;
	private Integer modelNo;
	private Set<ReservVO> reserves = new HashSet<ReservVO>();
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	public String getCarLicense() {
		return carLicense;
	}
	public void setCarLicense(String carLicense) {
		this.carLicense = carLicense;
	}
	public Integer getModelNo() {
		return modelNo;
	}
	public void setModelNo(Integer modelNo) {
		this.modelNo = modelNo;
	}
	public Set<ReservVO> getReserves() {
		return reserves;
	}
	public void setReserves(Set<ReservVO> reserves) {
		this.reserves = reserves;
	}
}
