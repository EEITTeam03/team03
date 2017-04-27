package com.test.model;

import java.util.HashSet;
import java.util.Set;

import com.reservlist.model.ReservListVO;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;

public class Cascade {
	
	public static void main(String[] args) {
		
	
	Set<ReservListVO> set = new HashSet<ReservListVO>();
	
	
	ReservService svc = new ReservService();
	ReservVO vo = svc.getOneReserv(4);
	System.out.println(vo.getReservlists());
	}
}
