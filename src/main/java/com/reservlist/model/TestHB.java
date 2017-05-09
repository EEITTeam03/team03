package com.reservlist.model;

import com.schedule.model.ReservService;
import com.services.model.ServicesService;

public class TestHB {

	public static void main(String[] args) {
		
		ReservService rsvc = new ReservService();
		ServicesService ssvc = new ServicesService();
		ReservListService svc = new ReservListService();
		
//		svc.addReservList(rsvc.getOneReserv(28),ssvc.getOneService(1001), 100, 100, "TEST-TEST");
		svc.deleteListByNo(28);
		System.out.println(svc.findByReservNo(25));
	}

}
