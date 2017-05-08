package com.membercars.model;

public class MembercarsService {
	private MemberCarsDAO dao;
	public MembercarsService(){
		dao = new MemberCarsHibernateDAO();
	}
	public MemberCarsVO getOneByPK(String carLicense){
		return dao.findByPK(carLicense);
	};
}
