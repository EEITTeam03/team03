package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
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

import com.reservlist.model.ReservListVO;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;

import myutil.MyUtil;

/**
 * Servlet implementation class QueryEmptyReserv
 */
@WebServlet("/EmptyReservJSON")
public class EmptyReservJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmptyReservJSON() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out =response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String strDate = request.getParameter("selectedDate");
		String empNo = request.getParameter("empNo");
		
		if(strDate == null) {
			out.print("no input");
			return;
		}
		
		Calendar cal = MyUtil.getCalender(strDate);
		
		ReservService rsvc = new ReservService();
		List<ReservVO> list = null;
		if(empNo == null) 
			list = rsvc.getAllReservByDate(cal);
		else if(empNo != null)
			list = rsvc.getAllReservByDateAndEmp(cal, Integer.parseInt(empNo));
			
			
		List<Map<String,Object>> JSONlist = new ArrayList<>();
		
		for(ReservVO aVO :list) {
			Map<String,Object> reserve = new HashMap<>();
			Integer startH = aVO.getReservDateTime().get(Calendar.HOUR_OF_DAY);
			Integer startm = aVO.getReservDateTime().get(Calendar.MINUTE);
			Integer endH = aVO.getReservEndTime().get(Calendar.HOUR_OF_DAY);
			Integer endm = aVO.getReservEndTime().get(Calendar.MINUTE);
			Integer emp = aVO.getEmployeeVO().getEmployeeNo();
			
			String startmformat = String.format("%02d", startm);
			String endmformat = String.format("%02d", endm);
			
			
			reserve.put("start", startH+":"+startmformat);
			reserve.put("end", endH+":"+endmformat);
			reserve.put("emp", emp);
			reserve.put("shh", startH);
			reserve.put("smm", startmformat);
			reserve.put("ehh", endH);
			reserve.put("emm", endmformat);
			JSONlist.add(reserve);
		}
		
		
		
		String jsonString = JSONValue.toJSONString(JSONlist);
		out.print(jsonString);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
