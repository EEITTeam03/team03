package com.servicecarclass.model;

import java.util.List;

import com.carclass.model.CarClassVO;
import com.services.model.ServicesVO;

public class ServiceCarClassService {
	private ServiceCarClassDAO_interface dao;

	public ServiceCarClassService() {
		dao = new ServiceCarClassDAO_Hibernate();
	}

	public ServiceCarClassVO addServiceCarClassAndCarClass(ServicesVO servicesVO, CarClassVO carClassVO, Integer servPrice,
			Integer servTime) {
		ServiceCarClassVO serviceCarClassVO = new ServiceCarClassVO();
		serviceCarClassVO.setCarClassVO(carClassVO);
		// serviceCarClassVO.setCarClassNo(carClassNo);
		serviceCarClassVO.setServicesVO(servicesVO);
		serviceCarClassVO.setServPrice(servPrice);
		serviceCarClassVO.setServTime(servTime);
		dao.insert(serviceCarClassVO);
		return serviceCarClassVO;
	}

	public ServiceCarClassVO addServiceCarClass(ServicesVO servicesVO,String carClass, Integer servPrice, Integer servTime) {
		ServiceCarClassVO serviceCarClassVO = new ServiceCarClassVO();
		serviceCarClassVO.setServicesVO(servicesVO);
		serviceCarClassVO.setServPrice(servPrice);
		serviceCarClassVO.setServTime(servTime);
		serviceCarClassVO.setCarClass(carClass);
		dao.insert(serviceCarClassVO);
		return serviceCarClassVO;
	}

	public ServiceCarClassVO updateServiceCarClass(ServicesVO servicesVO, CarClassVO carClassVO, Integer servPrice,
			Integer servTime) {
		ServiceCarClassVO serviceCarClassVO = new ServiceCarClassVO();
		serviceCarClassVO.setCarClassVO(carClassVO);
		serviceCarClassVO.setServicesVO(servicesVO);
		serviceCarClassVO.setServPrice(servPrice);
		serviceCarClassVO.setServTime(servTime);
		dao.update(serviceCarClassVO);
		return serviceCarClassVO;
	}

	public ServiceCarClassVO getOneServiceCarClass(Integer servNo, String carClass) {
		return dao.findByServAndClass(servNo, carClass);
	}

	public List<ServiceCarClassVO> getAll() {
		return dao.getAll();
	}

	public ServiceCarClassVO getOne(ServicesVO servicesVO, CarClassVO carClassVO) {
		return dao.findOne(servicesVO, carClassVO);
	}
}
