package com.test.model;

import java.util.Calendar;
import java.util.Date;

import com.servicecarclass.model.ServiceCarClassDAO_Hibernate;
import com.servicecarclass.model.ServiceCarClassVO;

public class Test {

	public static void main(String[] args) {
		
		ServiceCarClassDAO_Hibernate dao = new ServiceCarClassDAO_Hibernate();
		ServiceCarClassVO vo = dao.findByServAndClass(1002, "S");
		System.out.println(vo.getServPrice());
		System.out.println(vo.getServTime());
		
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		
		Date date = new Date();
		System.out.println(date);
		cal1.setTime(date);
		System.out.println(cal1);
		
		cal2.setTimeInMillis(date.getTime()+4*60*60*1000);
		System.out.println(cal2);
		
		
		System.out.println(cal1.before(cal2));
		System.out.println(cal2.before(cal1));
		System.out.println(cal1.after(cal2));
		System.out.println(cal2.after(cal1));
		
		System.out.println("-------------");
		if(cal1.getTimeInMillis() < cal2.getTimeInMillis())
			System.out.println("QQ");
		if(cal1.before(cal2) && cal2.before(cal1))
			System.out.println("go");
	}

}
