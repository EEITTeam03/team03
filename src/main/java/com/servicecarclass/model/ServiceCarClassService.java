package com.servicecarclass.model;

import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.carclass.model.CarClassVO;
import com.membercars.model.MemberCarsVO;
import com.membercars.model.MembercarsService;
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


	public ServiceCarClassVO updateServiceCarClass(Integer carClassNo,ServicesVO servicesVO, CarClassVO carClassVO, Integer servPrice,
			Integer servTime) {
		ServiceCarClassVO serviceCarClassVO = new ServiceCarClassVO();
		serviceCarClassVO.setCarClassNo(carClassNo);
		serviceCarClassVO.setCarClassVO(carClassVO);
		serviceCarClassVO.setServicesVO(servicesVO);
		serviceCarClassVO.setServPrice(servPrice);
		serviceCarClassVO.setServTime(servTime);
		dao.update(serviceCarClassVO);
		return dao.findByPrimaryKey(carClassNo);
	}

	public ServiceCarClassVO getOneServiceCarClass(Integer servNo, String carClass) {
		return dao.findByServAndClass(servNo, carClass);
	}
	
	public List<ServiceCarClassVO> getMorePriceAndTimeByFK(Integer servNo){
		return dao.findByForeignKey(servNo);
		
	}
	
	public ServiceCarClassVO getOneByServiceCarClassNo(Integer carClassNo){
		return dao.findByPrimaryKey(carClassNo);
	}
	
	public List<ServiceCarClassVO> getAll() {
		return dao.getAll();
	}

	public ServiceCarClassVO getOne(ServicesVO servicesVO, CarClassVO carClassVO) {
		return dao.findOne(servicesVO, carClassVO);
	}
	
	public List<Map> getServicesJsonPriceTime(String license) {
		//用車牌找大小
		MembercarsService svc = new MembercarsService();
		MemberCarsVO carVO = svc.getOneByPK(license);
		String size = carVO.getCarTypeVO().getCarClassVO().getCarClass();
		//用大小找一堆VO
		List<ServiceCarClassVO> list = dao.fnidBySize(size);
		
		List<Map> list2 = new ArrayList<Map>();
		
		for (ServiceCarClassVO asvo : list) {
			String s = "0";
			if (asvo.getServicesVO().getServPhoto() == null) {
				continue;
			} else if (asvo.getServicesVO().getServStatus().equals(s)) {
				continue;
			}
			Map map = new LinkedHashMap<>();
			map.put("servNo", asvo.getServicesVO().getServNo());
			map.put("servDesc", asvo.getServicesVO().getServDesc().replace("\n", "").replace("\r", ""));
			map.put("servName", asvo.getServicesVO().getServName());
			map.put("servPhoto", Base64.getEncoder().encodeToString(asvo.getServicesVO().getServPhoto()));
			map.put("servPrice",asvo.getServPrice());
			map.put("servTime", asvo.getServTime());
			
			// map.put(key, value);
			list2.add(map);
		}
		return list2;
	}
}
