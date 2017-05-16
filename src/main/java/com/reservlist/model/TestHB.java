package com.reservlist.model;

import java.util.List;

import com.schedule.model.ReservService;
import com.services.model.ServicesService;
import com.services.model.ServicesVO;

public class TestHB {

	public static void main(String[] args) {
		
//		ReservService rsvc = new ReservService();
//		ServicesService ssvc = new ServicesService();
//		ReservListService svc = new ReservListService();
//		
////		svc.addReservList(rsvc.getOneReserv(28),ssvc.getOneService(1001), 100, 100, "TEST-TEST");
//		svc.deleteListByNo(28);
//		System.out.println(svc.findByReservNo(25));
		
		ReservListHibernateDAO dao = new ReservListHibernateDAO();
		List<Object[]> list = dao.listAllCount();
//		System.out.println(dao.listAllByServ("2001"));
		
		//System.out.println(list);
		
		for(Object[] obj:list){
//			System.out.println(obj[0].getClass().getName());
//			System.out.println(obj[1].getClass().getName());
			System.out.println(String.valueOf(obj[0]));
			System.out.println(obj[1]);
		}
	}

}
