package com.schedule.model;

import java.util.Calendar;
import java.util.List;

public class ReservService {
	private ReservDAO_interface dao;
	public ReservService(){
		dao = new ReservDAO();
	}

}
