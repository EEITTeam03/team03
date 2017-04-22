package com.memberinfo.model;

import java.util.List;

public interface MemberInfoDAO {
	
	public void insert(MemberInfoVO memberInfoVO);
	public void update(MemberInfoVO memberInfoVO);
	public void delete(Integer memberNo);
	public MemberInfoVO findByPK(String memberNo);
	public MemberInfoVO findByPhone(String phone);
	public List<MemberInfoVO> listAll();
}
