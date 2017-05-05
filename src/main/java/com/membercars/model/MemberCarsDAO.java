package com.membercars.model;

import java.sql.Date;
import java.util.List;

import com.memberinfo.model.MemberInfoVO;

public interface MemberCarsDAO {
	
	public void insert(MemberCarsVO memberCarsVO);
	public void update(MemberCarsVO memberCarsVO);
	public void delete(String carLicense);
	public MemberCarsVO findByPK(String carLicense);
	public List<MemberCarsVO> listAll();
	public List<MemberInfoVO> findNewMember(String email, String password, String memberName, String phone,
			Date birthday, String address, Date effectiveDate);

}
