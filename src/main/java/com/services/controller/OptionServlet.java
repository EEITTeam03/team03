package com.services.controller;

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

import com.services.model.ServicesService;

/**
 * Servlet implementation class OptionServlet
 */
@WebServlet(urlPatterns = {"/OptionServlet","/admin/OptionServlet"})
public class OptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public OptionServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/plain;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String option= request.getParameter("option");
		List<Map> list =null;
		ServicesService servicesService = new ServicesService();
		if("radio".equals(option)){
			list = servicesService.getServicesForRadio();
		}else{
			list = servicesService.getServicesForCheckbox();
		}
		
		String jsonString = JSONValue.toJSONString(list);
		out.println(jsonString);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
