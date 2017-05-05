package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reservlist.model.ReservListVO;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;

import myutil.MyUtil;

/**
 * Servlet implementation class QueryEmptyReserv
 */
@WebServlet("/reserve/QueryReservByDate")
public class QueryEmptyReserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryEmptyReserv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strDate = request.getParameter("selectedDate");
		Calendar cal = MyUtil.getCalender(strDate);
		
		ReservService rsvc = new ReservService();
		List<ReservVO> list = rsvc.getAllReservByDate(cal);
		
		
		
		request.setAttribute("reservList", list);
		
		RequestDispatcher sucess = request.getRequestDispatcher("/reserve/query_result.jsp");
		sucess.forward(request, response);
		
		
//		PrintWriter out =response.getWriter();
//		out.println(sqlDate.getTime());
//		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
