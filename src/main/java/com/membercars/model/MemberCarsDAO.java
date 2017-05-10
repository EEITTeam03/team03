package com.membercars.model;

import java.util.List;

public interface MemberCarsDAO {
	
	public void insert(MemberCarsVO memberCarsVO);
	public void update(MemberCarsVO memberCarsVO);
	public void delete(String carLicense);
	public MemberCarsVO findByPK(String carLicense);
	public List<MemberCarsVO> listAll();

}
