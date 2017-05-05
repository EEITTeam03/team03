package com.employee.model;

import java.util.List;

public interface EmployeeDAO_interface {
	public void insert(EmployeeVO employeeVO);
	public void update(EmployeeVO employeeVO);
	public List<EmployeeVO> getAll();
	public EmployeeVO findByPrimaryKey(Integer employeeNo);
	public void delete(Integer employeeNo);
}
