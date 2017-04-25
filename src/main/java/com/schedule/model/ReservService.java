package com.schedule.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
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
	
	public ReservVO getOneEmp(Integer reservNo) {
		return dao.findByPrimaryKey(reservNo);
	}
	
	public List<ReservVO>getSchedule(){
		List<ReservVO> list = dao.getAll();
		List<ReservVO> list2 = new ArrayList<ReservVO>() ;
		Calendar calendar = Calendar.getInstance();
		for(ReservVO reserv:list){
			if(calendar.YEAR==reserv.getReservDateTime().YEAR)
			{
				if(calendar.WEEK_OF_YEAR==reserv.getReservDateTime().WEEK_OF_YEAR)
					list2.add(reserv);
			}
		}
		return list2;
	}
}
