package com.memberinfo.model;

import java.sql.Date;
import java.util.List;

import com.admin.model.AdminVO;

public interface MemberInfoDAO {
	
	public void insert(MemberInfoVO memberInfoVO);
	public void update(MemberInfoVO memberInfoVO);
	public void delete(Integer memberNo);
	public MemberInfoVO findByPK(Integer memberNo);
	public MemberInfoVO findByPhone(String phone);
	public List<MemberInfoVO> listAll();
	public List<MemberInfoVO> findMember(String email , String password);
//	public List<MemberInfoVO> findAddMember(String email, String password, String memberName, String phone, Date birthday, String address, Date effectiveDate);
	public MemberInfoVO findByEmail(String email);
}
