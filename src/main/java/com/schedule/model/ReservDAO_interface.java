package com.schedule.model;

import java.util.List;

public interface ReservDAO_interface {
	public ReservVO findByPrimaryKey(Integer reservNo);
	public List<ReservVO>getAll();
}
