package com.services.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.services.model.ServicesService;
import com.services.model.ServicesVO;

@WebServlet("/ServiceJson")
public class ServiceJson extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out =response.getWriter();
		String str = request.getParameter("servNo");
		Integer servNo=Integer.valueOf(str);
		ServicesService ssForDisplay=new ServicesService();
		ServicesVO servicesVO=ssForDisplay.getOneService(servNo);
		
		Map<String,Object> map=new HashMap<String,Object>();
		List<Map> list=new ArrayList<>();
		map.put("servNo",servicesVO.getServNo());
		map.put("servTypeNo",servicesVO.getServTypeNo());
		map.put("servName",servicesVO.getServName());
		map.put("servDesc",servicesVO.getServDesc());
		if(servicesVO.getServPhoto()!=null){
			map.put("servPhoto",Base64.getEncoder().encodeToString(servicesVO.getServPhoto()));
		}
		map.put("servEffectiveDate",servicesVO.getServEffectiveDate().toString());
		map.put("servStatus",servicesVO.getServStatus());
		list.add(map);
		String forjson=JSONValue.toJSONString(list);
		out.print(forjson);
		System.out.println(forjson);
	}

}
