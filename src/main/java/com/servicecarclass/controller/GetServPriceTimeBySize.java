package com.servicecarclass.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.servicecarclass.model.ServiceCarClassService;

/**
 * Servlet implementation class GetServPriceTimeBySize
 */
@WebServlet("/GetServPriceTimeBySize")
public class GetServPriceTimeBySize extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetServPriceTimeBySize() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String license = request.getParameter("license");

		if(license==null) {
			out.print("no input");
			return;
		}
		
		ServiceCarClassService svc = new ServiceCarClassService();
		List<Map> list =svc.getServicesJsonPriceTime(license);
		
		String jsonString = JSONValue.toJSONString(list);
		out.println(jsonString);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
