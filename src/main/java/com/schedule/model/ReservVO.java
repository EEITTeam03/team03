package com.schedule.model;

import java.sql.Timestamp;

public class ReservVO implements java.io.Serializable{
	private Integer reservNo;
	private Timestamp reservDateTime;
	private String carLicense;
	private String noteC;
	private String notesE;
	private Integer employeeNo;
	private Integer status;
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
	public String getCarLicense() {
		return carLicense;
	}
	public void setCarLicense(String carLicense) {
		this.carLicense = carLicense;
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
	public Integer getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(Integer employeeNo) {
		this.employeeNo = employeeNo;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}
