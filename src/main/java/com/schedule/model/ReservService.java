package com.schedule.model;

import java.util.Calendar;
import java.util.List;

public class ReservService {
	private ReservDAO_interface dao;
	public ReservService(){
		dao = new ReservDAO();
	}
	public List<Object[]>findScheduleByEmp(Integer employeeNo){
		List<Object[]>list = dao.getSchedule(employeeNo);
		List<Object[]>list2=null;
		for(Object[] obj:list){
			Calendar time = Calendar.getInstance();
			if(time.get(Calendar.YEAR)==((Calendar)obj[1]).get(Calendar.YEAR)){
				if(time.get(Calendar.WEEK_OF_YEAR)==((Calendar)obj[1]).get(Calendar.WEEK_OF_YEAR))
					list2.add(obj);
			}
		}
		return list2;
	}
}
