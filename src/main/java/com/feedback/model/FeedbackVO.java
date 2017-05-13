package com.feedback.model;

import java.util.Calendar;

public class FeedbackVO {
private Calendar feedbackDate;
private String memberName;
private Integer reservNo;
private String feedback;
private String reply;
private Integer readState;
public Calendar getFeedbackDate() {
	return feedbackDate;
}
public void setFeedbackDate(Calendar feedbackDate) {
	this.feedbackDate = feedbackDate;
}
public String getMemberName() {
	return memberName;
}
public void setMemberName(String memberName) {
	this.memberName = memberName;
}
public Integer getReservNo() {
	return reservNo;
}
public void setReservNo(Integer reservNo) {
	this.reservNo = reservNo;
}
public String getFeedback() {
	return feedback;
}
public void setFeedback(String feedback) {
	this.feedback = feedback;
}
public String getReply() {
	return reply;
}
public void setReply(String reply) {
	this.reply = reply;
}
public Integer getReadState() {
	return readState;
}
public void setReadState(Integer readState) {
	this.readState = readState;
}

}
