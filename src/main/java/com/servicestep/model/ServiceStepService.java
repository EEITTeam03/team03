package com.servicestep.model;

import java.util.List;

import com.services.model.ServicesVO;

public class ServiceStepService {
	private ServiceStepDAO_interface dao;

	public ServiceStepService() {
		dao = new ServiceStepDAO_Hibernate();
	}

	public ServiceStepVO addServiceStep(Integer servStep, String stepName, String stepDescp, byte[] stepPic,
			Integer stepPercent, Integer carClassNo, ServicesVO servicesVO) {
		ServiceStepVO serviceStepVO = new ServiceStepVO();
		serviceStepVO.setCarClassNo(carClassNo);
		serviceStepVO.setServStep(servStep);
		serviceStepVO.setStepDescp(stepDescp);
		serviceStepVO.setStepName(stepName);
		serviceStepVO.setStepPercent(stepPercent);
		serviceStepVO.setStepPic(stepPic);
		serviceStepVO.setServicesVO(servicesVO);
		dao.insert(serviceStepVO);
		return serviceStepVO;
	}

	public ServiceStepVO updateServiceStep(Integer servStep, String stepName, String stepDescp, byte[] stepPic,
			Integer stepPercent, Integer carClassNo, Integer servStepNo, ServicesVO servicesVO) {
		ServiceStepVO serviceStepVO = new ServiceStepVO();
		serviceStepVO.setCarClassNo(carClassNo);
		serviceStepVO.setServStep(servStep);
		serviceStepVO.setStepDescp(stepDescp);
		serviceStepVO.setStepName(stepName);
		serviceStepVO.setStepPercent(stepPercent);
		serviceStepVO.setServStepNo(servStepNo);
		serviceStepVO.setStepPic(stepPic);
		serviceStepVO.setServicesVO(servicesVO);
		dao.update(serviceStepVO);
		return dao.findByPrimaryKey(servStepNo);

	}

	public ServiceStepVO updateServiceStep(Integer servStep, String stepName, String stepDescp, byte[] stepPic,
			Integer servStepNo, ServicesVO servicesVO) {
		ServiceStepVO serviceStepVO = new ServiceStepVO();
		serviceStepVO.setServStep(servStep);
		serviceStepVO.setStepDescp(stepDescp);
		serviceStepVO.setStepName(stepName);
		serviceStepVO.setServStepNo(servStepNo);
		serviceStepVO.setStepPic(stepPic);
		serviceStepVO.setServicesVO(dao.findByPrimaryKey(servStepNo).getServicesVO());
		dao.update(serviceStepVO);
		return dao.findByPrimaryKey(servStepNo);

	}

	public ServiceStepVO getOneServiceStep(Integer servNo) {
		return dao.findByPrimaryKey(servNo);

	}

	public ServiceStepVO getOneServiceStepNo(Integer servStepNo) {
		return dao.findByPrimaryKeyServStepNo(servStepNo);

	}

	public List<ServiceStepVO> getAll() {
		return dao.getAll();
	}
	public List<ServiceStepVO> getfindbyServNO() {
		return dao.findByServNo();
	}
}
