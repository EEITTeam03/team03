package com.servicestep.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servicestep.model.ServiceStepService;
import com.servicestep.model.ServiceStepVO;

@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
		* 1024 * 500 * 5)
@WebServlet("/services/servicestep.do")
public class ServiceStepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> msgOK = new HashMap<String, String>();
		if ("getMany_ServiceStep_ByServNo".equals(action)) {
			try {
				String str = request.getParameter("servNo");
				Integer servNo = Integer.valueOf(str);
				ServiceStepService sssForDisplay = new ServiceStepService();
				List<ServiceStepVO> serviceStepVO = sssForDisplay.getMoreServiceStepbyFK(servNo);
				if (serviceStepVO == null) {
					errorMsg.put("errorservNo", "查無資料");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher fauilerView = request.getRequestDispatcher("SelectServices.jsp");
					fauilerView.forward(request, response);
					return;
				}
				request.setAttribute("serviceStepList", serviceStepVO);

				String url = "ListOneServiceStep.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				errorMsg.put("errorInfo", "無法取得資料");
				RequestDispatcher fauilerView = request.getRequestDispatcher("SelectServices.jsp");
				fauilerView.forward(request, response);
			}

		}

	}
}
