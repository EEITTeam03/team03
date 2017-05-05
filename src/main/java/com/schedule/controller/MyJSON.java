package com.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.schedule.model.ReservService;

import myutil.MyUtil;

/**
 * Servlet implementation class MyJSON
 */
@WebServlet(urlPatterns = {"/MyJSON","/admin/MyJSON"})
public class MyJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyJSON() {
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
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		request.setAttribute("ErrorMsgKey", errorMsgMap);
		
		String date= request.getParameter("date");
		if(date==null||date.length()==0)
			errorMsgMap.put("NotAcurrateDate", "Date輸入不正確");
		
		if (!errorMsgMap.isEmpty()) {
//			RequestDispatcher rd = request.getRequestDispatcher("testForGetJSON.jsp");
//			rd.forward(request, response);
			return;
		}
		
		String view = request.getParameter("view");
		Calendar cal =  MyUtil.getCalender(date);
		ReservService rs = new ReservService();
		List<Map> list =null;
		if("dayView".equals(view)){
			 list =rs.getOneDayForJSON(cal);
		}else if("weekView".equals(view)){
			 list =rs.getScheduleForJSON(cal);
		}else if("monthView".equals(view)){
			 list =rs.getYearScheduleForJSON(cal);
		}else{
			errorMsgMap.put("NotAcurrateView", "view輸入不正確");
		}
		if (!errorMsgMap.isEmpty()) {
//			RequestDispatcher rd = request.getRequestDispatcher("testForGetJSON.jsp");
//			rd.forward(request, response);
			return;
		}
		String jsonString = JSONValue.toJSONString(list);  
		 out.println(jsonString);
	}

}
