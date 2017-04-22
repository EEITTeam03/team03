package com.services.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import com.reserv_list.model.ReservListVO;

public class ServicesVO implements Serializable {
	private Integer servNo;
	private String servTypeNo;
	private String servName;
	private String servDesc;
	private byte[] servPhoto;
	private Date servEffectiveDate;
	private String servStatus;
	private Set<ReservListVO>reservlists=new HashSet<ReservListVO>();
}
