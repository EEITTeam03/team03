package com.schedule.model;

import java.util.List;

import com.member_cars.model.MemberCarsVO;

public interface ReservDAO_interface {
	public ReservVO findByPrimaryKey(Integer reservNo);
	public List<ReservVO>getAll();
}
