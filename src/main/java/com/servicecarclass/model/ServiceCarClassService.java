package com.servicecarclass.model;

import java.util.List;

import com.services.model.ServicesVO;

public class ServiceCarClassService {
	private ServiceCarClassDAO_interface dao;

	public ServiceCarClassService() {
		dao = new ServiceCarClassDAO_Hibernate();
	}
//ㄏㄏ
	public ServiceCarClassVO addServiceCarClass(Integer servNo, String carClass, Integer servPrice, Integer servTime,
			ServicesVO servicesVO) {
		ServiceCarClassVO serviceCarClassVO = new ServiceCarClassVO();
		serviceCarClassVO.setCarClass(carClass);
		// serviceCarClassVO.setCarClassNo(carClassNo);
		serviceCarClassVO.setServicesVO(servicesVO);
		serviceCarClassVO.setServNo(servNo);
		serviceCarClassVO.setServPrice(servPrice);
		serviceCarClassVO.setServTime(servTime);
		dao.insert(serviceCarClassVO);
		return serviceCarClassVO;
	}

	public ServiceCarClassVO updateServiceCarClass(Integer servNo, String carClass, Integer servPrice, Integer servTime,
			Integer carClassNo, ServicesVO servicesVO) {
		ServiceCarClassVO serviceCarClassVO = new ServiceCarClassVO();
		serviceCarClassVO.setCarClass(carClass);
		 serviceCarClassVO.setCarClassNo(carClassNo);
		serviceCarClassVO.setServicesVO(servicesVO);
		serviceCarClassVO.setServNo(servNo);
		serviceCarClassVO.setServPrice(servPrice);
		serviceCarClassVO.setServTime(servTime);
		dao.update(serviceCarClassVO);
		return serviceCarClassVO;
	}
	
	public ServiceCarClassVO getOneServiceCarClass(Integer servNo){
		return dao.findByPrimaryKey(servNo);
	}
	
	public List<ServiceCarClassVO> getAll(){
		return dao.getAll();
	}
}
