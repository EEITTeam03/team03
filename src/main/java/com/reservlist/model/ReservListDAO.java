package com.reservlist.model;

import java.util.List;

public interface ReservListDAO {
	
	public void insert(ReservListVO reservListVO);
	public void update(ReservListVO reservListVO);
	public void delete(Integer reservNo);
	public List<ReservListVO> findByReservNo(Integer reservNo);
	public List<ReservListVO> listAll();
	public List<ReservListVO> listAllByServ(String servNo);
	public List<Object[]> listAllCount();
	public List<Object[]> listAllCount(String month);
	public List<Object[]> listAllMoney(String month);
}
