package com.test.model;

import java.text.ParseException;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import com.employee.model.EmployeeVO;
import com.membercars.model.MemberCarsVO;
import com.memberinfo.model.MemberInfoDAO;
import com.memberinfo.model.MemberInfoHibernateDAO;
import com.memberinfo.model.MemberInfoVO;
import com.reservlist.model.ReservListVO;
import com.schedule.model.ReservDAO;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;
import com.services.model.ServicesDAO_Hibernate;
import com.services.model.ServicesVO;

import myutil.MyUtil;

public class InsertCal {
	
	public static void main(String[] args) throws ParseException{
		
		MemberInfoDAO mdao = new MemberInfoHibernateDAO();
		MemberInfoVO memberInfoVO = mdao.findByPK(5);
		
		ReservDAO rdao = new ReservDAO();
//		ReservService rsvc = new ReservService();
		
		ReservVO rvo = new ReservVO();
		Calendar cal = MyUtil.getCalender("2017-05-25 23:30");
		//cal.set(2017, Calendar.MAY, 15, Calendar., minute);
		rvo.setReservDateTime(cal);
		rvo.setMembercarsVO((MemberCarsVO)memberInfoVO.getMemberCars().toArray()[0]);
		EmployeeVO evo = new EmployeeVO();
		evo.setEmployeeNo(1);
		evo.setEmployeeName("JACK邱華捷");
		rvo.setEmployeeVO(evo);
		rvo.setStatus(1);
		
		Set<ReservListVO> set = new HashSet<ReservListVO>();
		ReservListVO rlvo = new ReservListVO();
		ReservListVO rlvo2 = new ReservListVO();
		ServicesDAO_Hibernate sdao = new ServicesDAO_Hibernate();
		
		ServicesVO svo = sdao.findByPrimaryKey(1001);
		rlvo.setServicesVO(svo);
		rlvo.setServPrice(3000);
		rlvo.setServTime(60);
		rlvo.setServName("乾洗");
		rlvo.setReservVO(rvo);
		
		ServicesVO svo2 = sdao.findByPrimaryKey(1003);
		rlvo2.setServicesVO(svo2);
		rlvo2.setServPrice(2000);
		rlvo2.setServTime(180);
		rlvo2.setReservVO(rvo);
		rlvo2.setServName("吹風");
		
		set.add(rlvo);
		set.add(rlvo2);
		rvo.setReservlists(set);
		
		rdao.insert(rvo);
		
		
		
		//找出指定日期的所有預約
//		Calendar cal = MyUtil.getCalender("2017-05-10");
//		List<ReservVO> list = rsvc.getAllReservByDate(cal);
//		
//		//System.out.println(list);
//		for(ReservVO reservVO: list){
//			System.out.print(reservVO.getReservNo()+",");
//			System.out.print(reservVO.getReservDateTime().getTime());
//			System.out.print(reservVO.getNoteC()+",");
//			System.out.print(reservVO.getNotesE()+",");
//			System.out.print(reservVO.getStatus()+",");
//			System.out.print(reservVO.getMembercarsVO().getCarLicense()+",");
//			System.out.print(reservVO.getMembercarsVO().getMemberInfoVO().getMemberName());
//			System.out.println();
//		}
		
		
		
	}
}
