package com.servicestep.model;

import com.services.model.ServicesVO;

public class ServiceStepVO implements java.io.Serializable {
	// private Integer servNo;
	private Integer servStep;
	private String stepName;
	private String stepDescp;
	private byte[] stepPic;
	private Integer stepPercent;
	private Integer carClassNo;
	// 流水號
	private Integer servStepNo;
	// many-to-one-> Services
	private ServicesVO servicesVO;

	public Integer getServStepNo() {
		return servStepNo;
	}

	public void setServStepNo(Integer servStepNo) {
		this.servStepNo = servStepNo;
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

	// public Integer getServNo() {
	// return servNo;
	// }
	//
	// public void setServNo(Integer servNo) {
	// this.servNo = servNo;
	// }

	public Integer getServStep() {
		return servStep;
	}

	public void setServStep(Integer servStep) {
		this.servStep = servStep;
	}

	public String getStepName() {
		return stepName;
	}

	public void setStepName(String stepName) {
		this.stepName = stepName;
	}

	public String getStepDescp() {
		return stepDescp;
	}

	public void setStepDescp(String stepDescp) {
		this.stepDescp = stepDescp;
	}

	public byte[] getStepPic() {
		return stepPic;
	}

	public void setStepPic(byte[] stepPic) {
		this.stepPic = stepPic;
	}

	public Integer getStepPercent() {
		return stepPercent;
	}

	public void setStepPercent(Integer stepPercent) {
		this.stepPercent = stepPercent;
	}

}
