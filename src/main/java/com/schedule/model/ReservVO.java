package com.schedule.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import com.employee.model.EmployeeVO;
import com.membercars.model.MemberCarsVO;

import com.reservlist.model.ReservListVO;




public class ReservVO implements java.io.Serializable{
	private Integer reservNo;
	private Timestamp reservDateTime;
	
	private String noteC;
	private String notesE;
	
	private Integer status;
	
	private MemberCarsVO membercarsVO;
	private EmployeeVO employeeVO;
	private Set<ReservListVO>reservlists=new HashSet<ReservListVO>();
	public Set<ReservListVO> getReservlists() {
		return reservlists;
	}
	public void setReservlists(Set<ReservListVO> reservlists) {
		this.reservlists = reservlists;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}

	public Integer getReservNo() {
		return reservNo;
	}
	public void setReservNo(Integer reservNo) {
		this.reservNo = reservNo;
	}
	public Timestamp getReservDateTime() {
		return reservDateTime;
	}
	public void setReservDateTime(Timestamp reservDateTime) {
		this.reservDateTime = reservDateTime;
	}

	public String getNoteC() {
		return noteC;
	}
	public void setNoteC(String noteC) {
		this.noteC = noteC;
	}
	public String getNotesE() {
		return notesE;
	}
	public void setNotesE(String notesE) {
		this.notesE = notesE;
	}
	
	public MemberCarsVO getMembercarsVO() {
		return membercarsVO;
	}
	public void setMembercarsVO(MemberCarsVO membercarsVO) {
		this.membercarsVO = membercarsVO;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}
