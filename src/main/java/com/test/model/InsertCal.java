package com.test.model;

import java.text.ParseException;
import java.util.Calendar;

import com.employee.model.EmployeeVO;
import com.membercars.model.MemberCarsVO;
import com.memberinfo.model.MemberInfoDAO;
import com.memberinfo.model.MemberInfoHibernateDAO;
import com.memberinfo.model.MemberInfoVO;
import com.schedule.model.ReservDAO;
import com.schedule.model.ReservVO;

import myutil.MyUtil;

public class InsertCal {
	
	public static void main(String[] args) throws ParseException{
		
		MemberInfoDAO mdao = new MemberInfoHibernateDAO();
		MemberInfoVO memberInfoVO = mdao.findByPK(5);
		
		ReservDAO rdao = new ReservDAO();
		
		ReservVO vo = new ReservVO();
		Calendar cal = MyUtil.getCalender("2017-05-18 23:30");
		//cal.set(2017, Calendar.MAY, 15, Calendar., minute);
		vo.setReservDateTime(cal);
		vo.setMembercarsVO((MemberCarsVO)memberInfoVO.getMemberCars().toArray()[0]);
		EmployeeVO evo = new EmployeeVO();
		evo.setEmployeeNo(1);
		evo.setEmployeeName("周柏元");
		vo.setEmployeeVO(evo);
		vo.setStatus(1);
		
		rdao.insert(vo);
	}
}
