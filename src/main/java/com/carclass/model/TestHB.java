package com.carclass.model;

import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.cartype.model.CarTypeVO;





public class TestHB {

	public static void main(String[] args) {
		


		CarClassDAO dao = new CarClassHibernateDAO();
		
		
		//
//		CarClassVO carTypeVO = new CarClassVO();
		
		
		//
//		dao.insert(carTypeVO);
//		dao.update(carTypeVO);
//		dao.delete("S");
		
		//
//		CarTypeVO carTypeVO = dao.findByPK("1502");
//		if (carTypeVO != null) {
//			System.out.print(carTypeVO.getModelNo()+",");
//			System.out.print(carTypeVO.getBrand()+",");
//			System.out.print(carTypeVO.getCarModel()+",");
//			System.out.print(carTypeVO.getCarClassVO().getClassName());
//		}else {System.out.println("--NOT FOUND--");}
		
		//
//		List<CarClassVO> list = dao.listAll();
		
//		for(CarClassVO aVO : list){
//			System.out.print(aVO.getCarClass()+",");
//			System.out.print(aVO.getClassName());
//			System.out.println();
//		}
		
		Set<CarTypeVO> set = dao.findTypesByClass("XL");
		
		for(CarTypeVO aVO : set){
		System.out.print(aVO.getModelNo()+",");
		System.out.print(aVO.getBrand()+",");
		System.out.print(aVO.getCarModel()+",");
		//System.out.print(aVO.getCarClassVO().getCarClass()+",");
		System.out.print(aVO.getCarClassVO().getClassName());
		System.out.println();
	}
		
		
		

		 
	}

}
