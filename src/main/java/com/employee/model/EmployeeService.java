package com.employee.model;

import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.schedule.model.ReservVO;

public class EmployeeService {
	private EmployeeDAO_interface dao;
	public EmployeeService(){
		dao = new EmployeeDAO();
	}
	public EmployeeVO addEmp(Integer employeeNo,String employeeName,byte[] employeePhoto,String employeeDesc){
		EmployeeVO emp = new EmployeeVO();
		emp.setEmployeeNo(employeeNo);
		emp.setEmployeeName(employeeName);
		emp.setEmployeePhoto(employeePhoto);
		emp.setEmployeeDesc(employeeDesc);
		dao.insert(emp);
		return emp;
	}
	public EmployeeVO updateEmp(Integer employeeNo,String employeeName,byte[] employeePhoto,String employeeDesc){
		EmployeeVO emp = new EmployeeVO();
		emp.setEmployeeNo(employeeNo);
		emp.setEmployeeName(employeeName);
		emp.setEmployeePhoto(employeePhoto);
		emp.setEmployeeDesc(employeeDesc);
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
	public List<Map> getEmpJSON(){
		List<EmployeeVO>list = dao.getAll();
		List<Map>mapList = new ArrayList<Map>();
		Map map = null;
		String str= null;
		for(EmployeeVO empVO:list){
			map = new LinkedHashMap();
			map.put("empNo",empVO.getEmployeeNo() );
			map.put("empName", empVO.getEmployeeName());
			if(empVO.getEmployeePhoto()!=null){
			str = Base64.getEncoder().encodeToString(empVO.getEmployeePhoto());
			map.put("empPhoto", str);
			}
			map.put("employeeDesc", empVO.getEmployeeDesc());
			mapList.add(map);
		}
		return mapList;
	}
	
	public List<EmployeeVO> findNoByName(String employeeName) {
		return dao.findNoByName(employeeName);
	}
}
