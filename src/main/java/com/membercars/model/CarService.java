package com.membercars.model;

import java.util.List;

import com.memberinfo.model.MemberInfoVO;

public class CarService {
	
	private MemberCarsDAO dao;
	
	public CarService() {
		dao = new MemberCarsHibernateDAO();
		
	}
	

	


}
