package com.servicestep.model;

import java.util.ArrayList;
import java.util.List;

import com.services.model.ServicesVO;

public class ServiceStepService {
	private ServiceStepDAO_interface dao;

	public ServiceStepService() {
		dao = new ServiceStepDAO_Hibernate();
	}

	public ServiceStepVO addServiceStep(Integer servStep, String stepName, String stepDescp, byte[] stepPic,
			Integer servNo) {
		ServiceStepVO serviceStepVO = new ServiceStepVO();
		serviceStepVO.setServStep(servStep);
		serviceStepVO.setStepDescp(stepDescp);
		serviceStepVO.setStepName(stepName);
		serviceStepVO.setStepPic(stepPic);
		ServicesVO servicesVO = new ServicesVO();
		servicesVO.setServNo(servNo);
		dao.update(serviceStepVO);
		return serviceStepVO;
	}

	public ServiceStepVO UpdateServiceStep(Integer servStepNo, Integer servStep, String stepName, String stepDescp,
			byte[] stepPic, ServicesVO servicesVO) {
		ServiceStepVO serviceStepVO = new ServiceStepVO();
		serviceStepVO.setServStepNo(servStepNo);
		serviceStepVO.setServStep(servStep);
		serviceStepVO.setStepDescp(stepDescp);
		serviceStepVO.setStepName(stepName);
		serviceStepVO.setStepPic(stepPic);
		serviceStepVO.setServicesVO(servicesVO);
		dao.update(serviceStepVO);
		return dao.findByPrimaryKey(servStepNo);
	}

	public ServiceStepVO getOneSeviceStep(Integer servStepNo) {
		return dao.findByPrimaryKey(servStepNo);
	}

	public List<ServiceStepVO> getMoreServiceStepbyFK(Integer servNo) {
		return dao.findByForeignKey(servNo);
	}

	public List<ServiceStepVO> getAll() {
		return dao.getAll();
	}
	
	public List<Integer> getDist(){
		 List<Object> list=dao.getDist();
		 List<Integer> IntegerGetDist=new ArrayList<Integer>();
		 for(Object alist : list){
			 Integer svo = null;
			 svo = (Integer)alist;
			 IntegerGetDist.add(svo);
		 }
		return IntegerGetDist;
	}
}
