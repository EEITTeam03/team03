package com.admin.model;

import java.util.List;

public class AdminService {
	private AdminDAO_interface dao;
	public AdminService (){
		dao = new AdminDAO();
	}
	public AdminVO getOne(String email){
		return dao.findByPK(email);
	}
	public AdminVO getOneByName(String name){
		return dao.findByName(name);
	}
	public List<AdminVO>getALL(){
		return dao.getAll();
	}
	public AdminVO insertAdmin(String email,String password,String name){
		AdminVO adminVO = new AdminVO();
		adminVO.setEmail(email);
		adminVO.setName(name);
		adminVO.setPassword(password);
		dao.insert(adminVO);
		return  adminVO;
	}
	public AdminVO updateAdmin(String email,String password,String name){
		AdminVO adminVO = new AdminVO();
		adminVO.setEmail(email);
		adminVO.setName(name);
		adminVO.setPassword(password);
		dao.update(adminVO);
		return  dao.findByPK(email);
	}
	public void delete(String email){
		dao.delete(email);
	}
}
