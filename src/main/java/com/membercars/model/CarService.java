package com.membercars.model;

import java.util.List;

import com.memberinfo.model.MemberInfoVO;

public class CarService {
	
	private MemberCarsDAO dao;
	
	public CarService() {
		dao = new MemberCarsHibernateDAO();
		
	}
	
	public List<MemberInfoVO> getMember(String email , String password, String memberName, String phone, java.sql.Date birthday, String address, java.sql.Date effectiveDate){
		return dao.findNewMember(email, password, memberName, phone, birthday, address, effectiveDate);
	}
	
	public MemberCarsVO insert(String carLicense) {
		
		MemberCarsVO membercarsVO = new MemberCarsVO();
		
		membercarsVO.setCarLicense(carLicense);
		
		dao.insert(membercarsVO);
		
		return membercarsVO;
	}

}
