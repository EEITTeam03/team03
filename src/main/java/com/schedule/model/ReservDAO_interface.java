package com.schedule.model;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import com.membercars.model.MemberCarsVO;

public interface ReservDAO_interface {
	public ReservVO findByPrimaryKey(Integer reservNo);
	public List<ReservVO>getAll();
	public void insert(ReservVO reservVO);
	public void update(ReservVO reservVO);
//	public void delete(Integer reservNo);
	public List<ReservVO> findByDate(Calendar cal);

}
