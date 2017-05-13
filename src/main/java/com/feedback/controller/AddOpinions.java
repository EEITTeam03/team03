package com.feedback.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.feedback.model.FeedbackService;
import com.memberinfo.model.MemberInfoVO;

/**
 * Servlet implementation class AddOpinions
 */
@WebServlet("/AddOpinions")
public class AddOpinions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOpinions() {
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
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberInfoVO memberInfo = (MemberInfoVO)session.getAttribute("memberInfo");
		PrintWriter out = response.getWriter();
		String opinions = request.getParameter("opinions");
		String goal = request.getParameter("goal");
		Integer grade = null;
		try{
			grade = Integer.valueOf(goal);
		}catch(RuntimeException rx){
			rx.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		FeedbackService fs = new FeedbackService();
		fs.addFeedFeedback(calendar, memberInfo.getMemberName(), memberInfo.getMemberNo(), opinions,null,grade );
		out.print("New feedback is created");
	}

}
