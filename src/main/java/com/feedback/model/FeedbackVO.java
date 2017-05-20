package com.feedback.model;

import java.io.Serializable;
import java.util.Calendar;

import myutil.MyUtil;

public class FeedbackVO implements Serializable{
private Calendar feedbackDate;
private String memberName;
private Integer memberNo;
private String feedback;
private String reply;
private Integer readState;
private Integer feedbackNo;
public Integer getFeedbackNo() {
	return feedbackNo;
}
public void setFeedbackNo(Integer feedbackNo) {
	this.feedbackNo = feedbackNo;
}
public Calendar getFeedbackDate() {
	return feedbackDate;
}

public String getFeedbackDateStr() {
	return MyUtil.formatCalenderTime(feedbackDate);
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

public Integer getMemberNo() {
	return memberNo;
}
public void setMemberNo(Integer memberNo) {
	this.memberNo = memberNo;
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
