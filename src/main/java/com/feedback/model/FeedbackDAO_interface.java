package com.feedback.model;

import java.util.List;

public interface FeedbackDAO_interface {
	public void insert(FeedbackVO fVO);

	public void update(FeedbackVO fVO);

	public void delete(Integer feedbackNo);

	public FeedbackVO findByPK(Integer feedbackNo);

	public List<FeedbackVO> listAll();
}
