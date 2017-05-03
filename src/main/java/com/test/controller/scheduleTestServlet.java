package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.schedule.model.ReservVO;

/**
 * Servlet implementation class scheduleTestServlet
 */
@WebServlet("/test/scheduleTestServlet")
public class scheduleTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public scheduleTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json = request.getParameter("data");
		System.out.println("status:"+request.getParameter("status"));
		System.out.println("-------------------------------------------------");
		
		HashMap<String,String> map = new HashMap<String,String>();
		map = new Gson().fromJson(json, new TypeToken<HashMap<String,String>>() {}.getType());
		System.out.println("reservNo:"+map.get("id"));
		System.out.println("calendar:"+map.get("calendar"));
		System.out.println(getLocalTimeFromUTC(map.get("start")).getTime());	//從頁面得到的資料與預約訂單有時差8小時
		System.out.println(getLocalTimeFromUTC(map.get("end")).getTime());		//從頁面得到的資料與預約訂單有時差8小時
		System.out.println("subject:"+map.get("subject"));
		System.out.println("description:"+map.get("description"));
		System.out.println("-------------------------------------------------");
			
		PrintWriter out = response.getWriter();
		out.println("傳送成功");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	/*要寫到Util.java*/
	public static Calendar getLocalTimeFromUTC(String timeUTC){
		  TimeZone utc = TimeZone.getTimeZone("UTC");
		  SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		  f.setTimeZone(utc);
		  Calendar cal = Calendar.getInstance();
		  
		  try {
		   cal.setTime(f.parse(timeUTC));
		  } catch (ParseException e) {
		   //日期格式錯誤無法轉換
		   e.printStackTrace();
		  }
		  
		  return cal;
	}
}

