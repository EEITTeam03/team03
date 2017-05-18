package com.reservlist.model;

import java.util.Calendar;
import java.util.List;

import myutil.MyUtil;

public class TestHB {

	public static void main(String[] args) {
		
//		Calendar cal = MyUtil.getCalenderMonth("2017-5");
//		System.out.println(cal);
		
//		ReservService rsvc = new ReservService();
//		ServicesService ssvc = new ServicesService();
//		ReservListService svc = new ReservListService();
//		
////		svc.addReservList(rsvc.getOneReserv(28),ssvc.getOneService(1001), 100, 100, "TEST-TEST");
//		svc.deleteListByNo(28);
//		System.out.println(svc.findByReservNo(25));
		
		ReservListHibernateDAO dao = new ReservListHibernateDAO();
//		List<Object[]> list = dao.listAllCount();
//		List<Object[]> list = dao.listAllCount("2017-7");
		List<Object[]> list = dao.listAllMoney("2017-5");
//		System.out.println(dao.listAllByServ("2001"));
		
		//System.out.println(list);
		
		for(Object[] obj:list){
			System.out.println(obj[0].getClass().getName());
			System.out.println(obj[1].getClass().getName());
//			System.out.println(String.valueOf(obj[0]));
//			System.out.println(obj[1]);
		}
	}

}
