package com.membercars.model;

import java.util.List;

public class MembercarsService {
	private MemberCarsDAO dao;
	public MembercarsService(){
		dao = new MemberCarsHibernateDAO();
	}
	public MemberCarsVO getOneByPK(String carLicense){
		return dao.findByPK(carLicense);
	}
	
	public List<MemberCarsVO> getListByMember(Integer memberNo){
		return dao.findByMember(memberNo);
	}
}
