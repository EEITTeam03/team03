package com.employee.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import com.schedule.model.ReservVO;

public class EmployeeVO implements Serializable {
	private Integer employeeNo;
	private String employeeName;
	private Set<ReservVO> reserves = new HashSet<ReservVO>();
	private byte[] employeePhoto;
	private String employeeDesc;
		

	public String getEmployeeDesc() {
		return employeeDesc;
	}
	public void setEmployeeDesc(String employeeDesc) {
		this.employeeDesc = employeeDesc;
	}
	public byte[] getEmployeePhoto() {
		return employeePhoto;
	}
	public void setEmployeePhoto(byte[] employeePhoto) {
		this.employeePhoto = employeePhoto;
	}
	public Set<ReservVO> getReserves() {
		return reserves;
	}
	public void setReserves(Set<ReservVO> reserves) {
		this.reserves = reserves;
	}
	public Integer getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(Integer employeeNo) {
		this.employeeNo = employeeNo;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
}
