package com.carclass.model;

public class CarClassService {
	private CarClassDAO dao;
	
	public CarClassService(){
		dao=new CarClassHibernateDAO();
	}
	
	public CarClassVO findByPrimaryKey(String carClass){
		return dao.findByPK(carClass);
	}
}
