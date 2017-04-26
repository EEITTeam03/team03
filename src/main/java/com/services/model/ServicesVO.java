package com.services.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import com.reservlist.model.ReservListVO;
import com.servicecarclass.model.ServiceCarClassVO;
import com.servicestep.model.ServiceStepVO;

public class ServicesVO implements Serializable {
	private Integer servNo;
	private String servTypeNo;
	private String servName;
	private String servDesc;
	private byte[] servPhoto;
	private Date servEffectiveDate;
	private String servStatus;
	private Set<ReservListVO> reservlists = new HashSet<ReservListVO>();

	private Set<ServiceCarClassVO> serviceCarClassVO = new HashSet<ServiceCarClassVO>();
	private Set<ServiceStepVO> serviceStepVO = new HashSet<ServiceStepVO>();

	public Integer getServNo() {
		return servNo;
	}

	public Set<ServiceCarClassVO> getServiceCarClassVO() {
		return serviceCarClassVO;
	}

	public void setServiceCarClassVO(Set<ServiceCarClassVO> serviceCarClassVO) {
		this.serviceCarClassVO = serviceCarClassVO;
	}

	public Set<ServiceStepVO> getServiceStepVO() {
		return serviceStepVO;
	}

	public void setServiceStepVO(Set<ServiceStepVO> serviceStepVO) {
		this.serviceStepVO = serviceStepVO;
	}

	public void setServNo(Integer servNo) {
		this.servNo = servNo;
	}

	public String getServTypeNo() {
		return servTypeNo;
	}

	public void setServTypeNo(String servTypeNo) {
		this.servTypeNo = servTypeNo;
	}

	public String getServName() {
		return servName;
	}

	public void setServName(String servName) {
		this.servName = servName;
	}

	public String getServDesc() {
		return servDesc;
	}

	public void setServDesc(String servDesc) {
		this.servDesc = servDesc;
	}

	public byte[] getServPhoto() {
		return servPhoto;
	}

	public void setServPhoto(byte[] servPhoto) {
		this.servPhoto = servPhoto;
	}

	public Date getServEffectiveDate() {
		return servEffectiveDate;
	}

	public void setServEffectiveDate(Date servEffectiveDate) {
		this.servEffectiveDate = servEffectiveDate;
	}

	public String getServStatus() {
		return servStatus;
	}

	public void setServStatus(String servStatus) {
		this.servStatus = servStatus;
	}

	public Set<ReservListVO> getReservlists() {
		return reservlists;
	}

	public void setReservlists(Set<ReservListVO> reservlists) {
		this.reservlists = reservlists;
	}
}
