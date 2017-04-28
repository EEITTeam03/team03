package com.admin.model;

import java.util.List;

public interface AdminDAO_interface {
	public AdminVO findByPK(String email);
	public void insert(AdminVO adminVO);
	public void update(AdminVO adminVO);
	public void delete(String email);
	public List<AdminVO>getAll();
	public AdminVO findByName(String name);
}
