package com.feedback.model;

import java.util.Calendar;
import java.util.List;

public class FeedbackService {
	private FeedbackDAO_interface dao;
	public FeedbackService(){
		dao = new FeedbackDAO();
	}
	public FeedbackVO addFeedFeedback(Calendar feedbackDate,String memberName,Integer memberNo,String feedback,String reply,Integer readState){
		FeedbackVO fvo = new FeedbackVO();
		fvo.setFeedbackDate(feedbackDate);
		fvo.setFeedback(feedback);
		fvo.setMemberName(memberName);
		fvo.setMemberNo(memberNo);
		fvo.setReadState(readState);
		fvo.setReply(reply);
		dao.insert(fvo);
		return fvo;
	}
	public FeedbackVO updateFeedFeedback(Integer feedbackNo,Calendar feedbackDate,String memberName,Integer memberNo,String feedback,String reply,Integer readState){
		FeedbackVO fvo = new FeedbackVO();
		fvo.setFeedbackNo(feedbackNo);
		fvo.setFeedbackDate(feedbackDate);
		fvo.setFeedback(feedback);
		fvo.setMemberName(memberName);
		fvo.setMemberNo(memberNo);
		fvo.setReadState(readState);
		fvo.setReply(reply);
		dao.update(fvo);
		return fvo;
	}
	public void deleteFeedFeedback(Integer feedbackNo){
		dao.delete(feedbackNo);
	}
	public FeedbackVO getOneFeedFeedback(Integer feedbackNo){
		return dao.findByPK(feedbackNo);
	}
	public List<FeedbackVO> getAll(){
		return dao.listAll();
	}
	
	public List<FeedbackVO> getTop3(){
		return dao.listTOP3();
	}
}
