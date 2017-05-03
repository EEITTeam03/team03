package com.test.model;

import java.sql.Date;
import java.util.Calendar;
//import java.util.Date;


import com.servicecarclass.model.ServiceCarClassDAO_Hibernate;
import com.servicecarclass.model.ServiceCarClassVO;
import com.services.model.ServicesService;

public class Test {

	public static void main(String[] args) {
		
//		ServiceCarClassDAO_Hibernate dao = new ServiceCarClassDAO_Hibernate();
//		ServiceCarClassVO vo = dao.findByServAndClass(1002, "S");
//		System.out.println(vo.getServPrice());
//		System.out.println(vo.getServTime());
//		
//		Calendar cal1 = Calendar.getInstance();
//		Calendar cal2 = Calendar.getInstance();
//		
//		Date date = new Date();
//		System.out.println(date);
//		cal1.setTime(date);
//		System.out.println(cal1);
//		
//		cal2.setTimeInMillis(date.getTime()+4*60*60*1000);
//		System.out.println(cal2);
		
		//借我測serviceService
		ServicesService ss= new ServicesService();
		ss.addService(Integer.valueOf(4001), "m", "123", "你好", null,Date.valueOf("2016-04-01"), "1");
		
	}

}
