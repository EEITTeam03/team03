package com.reservlist.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.memberinfo.model.MemberInfoVO;
import com.reservlist.model.ReservListService;
import com.services.model.ServicesService;

@WebServlet("/ReservListJSON")
public class ReservListJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReservListJSON() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/plain;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		MemberInfoVO memberInfo = (MemberInfoVO)request.getSession().getAttribute("memberInfo");
		if (null != memberInfo){
			Integer memberNo = memberInfo.getMemberNo();
			
			ReservListService rls = new ReservListService();
			Map map = new LinkedHashMap<>();
			map = rls.getReservListForJSON(memberNo);
			
			String jsonString = JSONValue.toJSONString(map);
			out.println(jsonString);
		} else{
			out.println("需登入才能查看預約清單");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
