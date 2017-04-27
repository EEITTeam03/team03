package com.services.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;



public class ServicesService {
	private ServicesDAO_interface dao;
	//ㄏㄏ
	public ServicesService(){
		dao=new ServicesDAO_Hibernate();
	}
	public List<ServicesVO> getAll(){
		return dao.getAll();
	}
	public ServicesVO getOneService(Integer servNo){
		return dao.findByPrimaryKey(servNo);
	}
	public List<Map> getServicesForJson(){
		List<ServicesVO> list = dao.getAll();
		List<Map> list2 = new ArrayList<Map>();
		for(ServicesVO asvo:list){
			Map map = new LinkedHashMap<>();
			map.put("服務描述:",asvo.getServDesc());
			map.put("服務名稱", asvo.getServName());
//			map.put(key, value);
			list2.add(map);
		}
		return list2;
	}
	
}
