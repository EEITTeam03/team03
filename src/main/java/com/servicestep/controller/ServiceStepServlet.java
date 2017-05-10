package com.servicestep.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
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
import javax.servlet.http.Part;

import com.services.model.ServicesService;
import com.services.model.ServicesVO;
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

				String url = "ListChooseServiceStep.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				errorMsg.put("errorInfo", "無法取得資料");
				RequestDispatcher fauilerView = request.getRequestDispatcher("SelectServices.jsp");
				fauilerView.forward(request, response);
			}

		}

		if ("getOne_For_Update".equals(action)) {
			try {
				Integer servStepNo = new Integer(request.getParameter("servStepNo"));
				ServiceStepService serStepservice = new ServiceStepService();
				ServiceStepVO serviceStepVO = serStepservice.getOneSeviceStep(servStepNo);
				request.setAttribute("serviceStepVO", serviceStepVO);
				String url = "/services/UpdateServiceStep.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (RuntimeException e) {
				e.printStackTrace();
				RequestDispatcher failerView = request.getRequestDispatcher("/services/UpdateServiceStep.jsp");
				failerView.forward(request, response);
			}

		}
		if ("update".equals(action)) {
			try {
				
				Integer servStepNo = new Integer(request.getParameter("servStepNo"));
				Integer servStep = Integer.valueOf(request.getParameter("servStep"));
				String stepName = request.getParameter("stepName");
				String stepDescp = request.getParameter("stepDescp");
				byte[] stepPic = null;
				String fileName = "";

				long sizeInBytes = 0;
				InputStream is = null;
				Collection<Part> parts = request.getParts();
				ServicesService.exploreParts(parts, request);
				try {
					for (Part p : parts) {
						// String fldName = p.getName();
						// String value = request.getParameter(fldName);
						if (p.getContentType() != null) {
							fileName = ServicesService.getFileName(p); // 此為圖片檔的檔名
							fileName = ServicesService.adjustFileName(fileName, ServicesService.IMAGE_FILENAME_LENGTH);
							if (fileName != null && fileName.trim().length() > 0) {
								sizeInBytes = p.getSize();
								is = p.getInputStream();
								stepPic = new byte[is.available()];
								is.read(stepPic);
								is.close();
								System.out.println("已上傳圖片");
							} else {
								errorMsg.put("errPicture", "必須挑選圖片檔");
							}
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("出錯啦!");
				}
				ServiceStepVO serviceStepVO = new ServiceStepVO();
				ServiceStepService servStepservice=new ServiceStepService();
				ServicesVO servicesVO =servStepservice.getOneSeviceStep(servStep).getServicesVO();
				serviceStepVO.setServStepNo(servStepNo);
				serviceStepVO.setServStep(servStep);
				serviceStepVO.setStepName(stepName);
				serviceStepVO.setStepPic(stepPic);
				// serviceStepVO.setServicesVO(servicesVO);
				if (!errorMsg.isEmpty()) {
					request.setAttribute("serviceStepVO", serviceStepVO);
					RequestDispatcher failureView = request.getRequestDispatcher("/services/UpdateServiceStep.jsp");
					failureView.forward(request, response);
					return; // 程式中斷
				}
				try {
					serviceStepVO = servStepservice.UpdateServiceStep(servStepNo, servStep, stepName, stepDescp, stepPic,
							servicesVO);
					request.setAttribute("serviceStepVO", serviceStepVO);
					String url = "ListOneServiceStep.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
				} catch (RuntimeException e) {
					request.setAttribute("serviceStepVO", serviceStepVO);
					RequestDispatcher failerView = request.getRequestDispatcher("/services/UpdateServiceStep.jsp");
					failerView.forward(request, response);
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				RequestDispatcher failerView = request.getRequestDispatcher("/services/UpdateServiceStep.jsp");
				failerView.forward(request, response);
			}
		}

	}
}
