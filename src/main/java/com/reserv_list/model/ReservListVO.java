package com.reserv_list.model;

import java.io.Serializable;

import com.schedule.model.ReservVO;
import com.services.model.ServicesVO;

public class ReservListVO implements Serializable {
	private ReservVO reservNo;
	private ServicesVO servicesVO;
	private Integer servPrice;
	private Integer servTime;
	private String servName;
}
