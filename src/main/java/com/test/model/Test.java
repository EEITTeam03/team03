package com.test.model;

import com.servicecarclass.model.ServiceCarClassDAO_Hibernate;
import com.servicecarclass.model.ServiceCarClassVO;

public class Test {

	public static void main(String[] args) {
		
		ServiceCarClassDAO_Hibernate dao = new ServiceCarClassDAO_Hibernate();
		ServiceCarClassVO vo = dao.findByServAndClass(1002, "S");
		System.out.println(vo.getServPrice());
		System.out.println(vo.getServTime());
	}

}
