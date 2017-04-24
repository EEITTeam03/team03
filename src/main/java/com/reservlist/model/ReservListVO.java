package com.reservlist.model;

import java.io.Serializable;

import com.schedule.model.ReservVO;
import com.services.model.ServicesVO;

public class ReservListVO implements Serializable {
	private Integer reservListNo;
	public Integer getReservListNo() {
		return reservListNo;
	}
	public void setReservListNo(Integer reservListNo) {
		this.reservListNo = reservListNo;
	}
	private ReservVO reservVO;
	private ServicesVO servicesVO;
	private Integer servPrice;
	private Integer servTime;
	public ReservVO getReservVO() {
		return reservVO;
	}
	public void setReservVO(ReservVO reservVO) {
		this.reservVO = reservVO;
	}
	public ServicesVO getServicesVO() {
		return servicesVO;
	}
	public void setServicesVO(ServicesVO servicesVO) {
		this.servicesVO = servicesVO;
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
	public String getServName() {
		return servName;
	}
	public void setServName(String servName) {
		this.servName = servName;
	}
	private String servName;
}
