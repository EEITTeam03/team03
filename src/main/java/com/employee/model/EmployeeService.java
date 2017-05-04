package com.employee.model;

import java.util.List;

import com.schedule.model.ReservVO;

public class EmployeeService {
	private EmployeeDAO_interface dao;
	public EmployeeService(){
		dao = new EmployeeDAO();
	}
	public EmployeeVO addEmp(Integer employeeNo,String employeeName){
		EmployeeVO emp = new EmployeeVO();
		emp.setEmployeeNo(employeeNo);
		emp.setEmployeeName(employeeName);
		dao.insert(emp);
		return emp;
	}
	public EmployeeVO updateEmp(Integer employeeNo,String employeeName){
		EmployeeVO emp = new EmployeeVO();
		emp.setEmployeeNo(employeeNo);
		emp.setEmployeeName(employeeName);
		dao.update(emp);
		return emp;
	}
	public void deleteEmp(Integer employeeNo){
		dao.delete(employeeNo);
	}
	public List<EmployeeVO>getAll(){
		return dao.getAll();
	}
	
	public EmployeeVO getOneEmp(Integer employeeNo) {
		return dao.findByPrimaryKey(employeeNo);
	}
}
