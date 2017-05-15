package com.servicecarclass.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servicecarclass.model.ServiceCarClassService;
import com.servicecarclass.model.ServiceCarClassVO;

@WebServlet("/servicecarclass/servicecarclass.do")
public class UpdateServiceCarClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action =request.getParameter("action");
		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> msgOK = new HashMap<String, String>();
		if("getMany_ServiceCarClass_ByServNo".equals(action)){
			try{
				String str=request.getParameter("servNo");
				Integer servNo = Integer.valueOf(str);
				ServiceCarClassService sccsForDisplay= new ServiceCarClassService();
				List<ServiceCarClassVO> serviceCarClassVO=sccsForDisplay.getMorePriceAndTimeByFK(servNo);
				if(serviceCarClassVO ==null){
					errorMsg.put("errorservNo", "查無資料");
				}
				if(!errorMsg.isEmpty()){
					RequestDispatcher fauilerView = request.getRequestDispatcher("/services/SelectServices.jsp");
					fauilerView.forward(request, response);
					return;
				}
				request.setAttribute("serviceCarClassList", serviceCarClassVO);
				
				String url="ListChooseServiceCarClass.jsp";
				RequestDispatcher successView=request.getRequestDispatcher("/services/"+url);
				successView.forward(request, response);
				
			}catch(Exception e){
				errorMsg.put("errorInfo", "無法取得資料");
				RequestDispatcher fauilerView = request.getRequestDispatcher("/services/SelectServices.jsp");
				fauilerView.forward(request, response);
			}
		}
	}

}
