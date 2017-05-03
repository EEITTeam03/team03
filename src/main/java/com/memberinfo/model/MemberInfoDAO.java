package com.memberinfo.model;

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
}
