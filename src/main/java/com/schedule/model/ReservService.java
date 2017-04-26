package com.schedule.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.employee.model.EmployeeVO;
import com.membercars.model.MemberCarsVO;
import com.reservlist.model.ReservListVO;



public class ReservService {
	private ReservDAO_interface dao;
	public ReservService(){
		dao = new ReservDAO();
	}
	
	public ReservVO addReserv(Calendar reservDateTime,String noteC,String notesE,Integer status
			,MemberCarsVO membercarsVO,EmployeeVO employeeVO,Set<ReservListVO>reservlists){
		ReservVO reservVO=new ReservVO();
		
		reservVO.setReservDateTime(reservDateTime);
		reservVO.setNoteC(noteC);
		reservVO.getNotesE();
		reservVO.setStatus(status);
		reservVO.setMembercarsVO(membercarsVO);
		reservVO.setEmployeeVO(employeeVO);
		reservVO.setReservlists(reservlists);
		dao.insert(reservVO);
		return reservVO;
	}
	
	public ReservVO updateReserv(Integer reservNo,Calendar reservDateTime,String noteC,String notesE,Integer status
			,MemberCarsVO membercarsVO,EmployeeVO employeeVO,Set<ReservListVO>reservlists){
		ReservVO reservVO=new ReservVO();
		reservVO.setReservNo(reservNo);
		reservVO.setReservDateTime(reservDateTime);
		reservVO.setNoteC(noteC);
		reservVO.getNotesE();
		reservVO.setStatus(status);
		reservVO.setMembercarsVO(membercarsVO);
		reservVO.setEmployeeVO(employeeVO);
		reservVO.setReservlists(reservlists);
		dao.update(reservVO);
		return dao.findByPrimaryKey(reservNo);
	}
	
	public List<ReservVO>getAll(){
		return dao.getAll();
	}
	
	public ReservVO getOneReserv(Integer reservNo) {
		return dao.findByPrimaryKey(reservNo);
	}
	
	public List<Map>getSchedule(Calendar calendar){
		List<ReservVO> list = dao.getAll();
		List<Map> list2 = new ArrayList<Map>() ;
//		Calendar calendar = Calendar.getInstance();
//		calendar.set(2017,Calendar.MAY,1 );
		int week = calendar.get(Calendar.WEEK_OF_YEAR);
		for(ReservVO reserv:list){
			if(calendar.get(Calendar.YEAR)==reserv.getReservDateTime().get(Calendar.YEAR))
			{
				if(week==reserv.getReservDateTime().get(Calendar.WEEK_OF_YEAR))
				{
					 int year=reserv.getReservDateTime().get(Calendar.YEAR);
					 int month=reserv.getReservDateTime().get(Calendar.MONTH)+1;
					 int day = reserv.getReservDateTime().get(Calendar.DATE);
					 int hour = reserv.getReservDateTime().get(Calendar.HOUR);
					 int minute = reserv.getReservDateTime().get(Calendar.MINUTE);
					 int dayOfWeek = reserv.getReservDateTime().get(Calendar.DAY_OF_WEEK)-1;
					 int totalTime=0;
					 Map map = new LinkedHashMap();
						map.put("員工姓名", reserv.getEmployeeVO().getEmployeeName());
						map.put("年", year);
						map.put("月份", month);
						map.put("日期", day);
						map.put("星期", dayOfWeek);
						map.put("開始時間", hour+":"+minute);
						List <String> service = new <String>ArrayList();
					 for(ReservListVO rl:reserv.getReservlists()){
						 totalTime+=rl.getServTime();
						 service.add(rl.getServName()+" ");
					 }
					int Endminute = (minute+totalTime)%60;
					int EndHour =hour+ (minute+totalTime)/60;
					map.put("結束時間", EndHour+":"+Endminute);
					map.put("總長", totalTime);
					map.put("服務項目", service);
					list2.add(map);
				}
			}
		}
		return list2;
	}
}
