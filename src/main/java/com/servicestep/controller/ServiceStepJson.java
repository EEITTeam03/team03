package com.servicestep.controller;

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

import com.servicestep.model.ServiceStepService;
import com.servicestep.model.ServiceStepVO;

@WebServlet("/ServiceStepJson")
public class ServiceStepJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String str = request.getParameter("servNo");
		Integer servNo = Integer.valueOf(str);
		ServiceStepService sssForDisplay = new ServiceStepService();
		List<ServiceStepVO> serviceStepVO = sssForDisplay.getMoreServiceStepbyFK(servNo);
		if (serviceStepVO == null) {
			return;
		}
		List<Map> list =new ArrayList<>();
		for(ServiceStepVO ssvo:serviceStepVO){
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("servNo",ssvo.getServicesVO().getServNo());
			map.put("servStep", ssvo.getServStep());
			map.put("stepName", ssvo.getStepName());
			map.put("stepDescp",ssvo.getStepDescp());
			if(ssvo.getStepPic()!=null){
				map.put("stepPic", Base64.getEncoder().encodeToString(ssvo.getStepPic()));
			}
			list.add(map);
		}
		String jsonString=JSONValue.toJSONString(list);
		out.println(jsonString);
		System.out.println(jsonString);
	}

}
