package com.schedule.model;

import java.util.Calendar;
import java.util.List;


public interface ReservDAO_interface {
	public ReservVO findByPrimaryKey(Integer reservNo);
	public List<ReservVO>getAll();
	public void insert(ReservVO reservVO);
	public void update(ReservVO reservVO);
//	public void delete(Integer reservNo);
	public List<ReservVO> findByDate(Calendar cal);
	public List<ReservVO> findByYear(Calendar cal);
	public List<ReservVO> findByWeek(Calendar cal);
	public List<ReservVO> findByDateAndEmp(Calendar cal,Integer empNo);
	public List<ReservVO> findByWeekAndEmp(Calendar cal,Integer empNo);
	public List<Object>getAllOrderByTime(Calendar cal);
	public List<ReservVO> findTimeByDate(Calendar cal);
	public List<ReservVO> fingReservNoByLicense(String memberCar);
}
