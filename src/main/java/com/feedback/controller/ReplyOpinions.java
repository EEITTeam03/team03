package com.feedback.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feedback.model.FeedbackService;
import com.feedback.model.FeedbackVO;

/**
 * Servlet implementation class ReplyOpinions
 */
@WebServlet("/ReplyOpinions")
public class ReplyOpinions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyOpinions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if("reply".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();			
			request.setAttribute("errorMsgs", errorMsgs);
			String fNO = request.getParameter("feedbackNo");
			String txt = request.getParameter("comment");
			try{
				 Integer feedbackNo= Integer.valueOf(fNO);
				 FeedbackService fs = new FeedbackService();
				 FeedbackVO fVO = fs.getOneFeedFeedback(feedbackNo);
				 fs.updateFeedFeedback(feedbackNo, fVO.getFeedbackDate(), fVO.getMemberName(), fVO.getMemberNo(), fVO.getFeedback(),txt, fVO.getReadState());
				 String url = "/admin/ListAllfeedback.jsp";
				response.sendRedirect(getServletContext().getContextPath()+url);
				 //response.sendRedirect(url);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/admin/replyFeedback.jsp");
				failureView.forward(request, response);
			}

		}
	}

}
