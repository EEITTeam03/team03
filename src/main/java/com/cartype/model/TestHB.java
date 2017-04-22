package com.cartype.model;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;





public class TestHB {

	public static void main(String[] args) {
		


		CarTypeDAO dao = new CarTypeHibernateDAO();
		
		
		//create VO
//		CarTypeVO carTypeVO = new CarTypeVO();
//		carTypeVO.setModelNo("1007");
//		carTypeVO.setBrand("MAZDAQQQ");
//		carTypeVO.setCarModel("XXYYZZZ");
//		CarClassVO carClassVO = new CarClassVO();
//		carClassVO.setCarClass("XXL");
//		carTypeVO.setCarClassVO(carClassVO);
		
		//CRUD
//		dao.insert(carTypeVO);
//		dao.update(carTypeVO);
//		dao.delete("1006");
		
		//query
//		CarTypeVO carTypeVO = dao.findByPK("1502");
//		if (carTypeVO != null) {
//			System.out.print(carTypeVO.getModelNo()+",");
//			System.out.print(carTypeVO.getBrand()+",");
//			System.out.print(carTypeVO.getCarModel()+",");
//			System.out.print(carTypeVO.getCarClassVO().getClassName());
//		}else {System.out.println("--NOT FOUND--");}
		
		//query all
		List<CarTypeVO> list = dao.findByBrand("AUDI");
//		List<CarTypeVO> list = dao.listAll();
		for(CarTypeVO aVO : list){
			System.out.print(aVO.getModelNo()+",");
			System.out.print(aVO.getBrand()+",");
			System.out.print(aVO.getCarModel()+",");
			//System.out.print(aVO.getCarClassVO().getCarClass()+",");
			System.out.print(aVO.getCarClassVO().getClassName());
			System.out.println();
		}
		

		 
	}

}
