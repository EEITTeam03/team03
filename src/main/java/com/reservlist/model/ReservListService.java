package com.reservlist.model;

import java.util.List;

import com.schedule.model.ReservVO;
import com.services.model.ServicesVO;

public class ReservListService {
	
	private ReservListDAO dao;
	
	public ReservListService(){
		dao = new ReservListHibernateDAO();
	}
	
	public ReservListVO addReservList(ReservVO reservVO,ServicesVO servicesVO,Integer servPrice, Integer servTime,String servName){
		
		ReservListVO reservListVO = new ReservListVO();
		reservListVO.setReservVO(reservVO);
		reservListVO.setServicesVO(servicesVO);
		reservListVO.setServPrice(servPrice);
		reservListVO.setServTime(servTime);
		reservListVO.setServName(servName);
		
		dao.insert(reservListVO);
		return reservListVO;
	}
	
	public void deleteListByNo(Integer reservNo){
		dao.delete(reservNo);
	}
	
	public List<ReservListVO> findByReservNo(Integer reservNo){
		return dao.findByReservNo(reservNo);
	}
}
