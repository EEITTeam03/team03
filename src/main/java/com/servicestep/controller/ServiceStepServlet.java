package com.servicestep.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
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
		
		if ("getOne_For_Update".equals(action)) {
			try {
				Integer servNo = new Integer(request.getParameter("servNo"));
				ServiceStepService sss = new ServiceStepService();
				ServiceStepVO serviceStepVO = sss.getOneServiceStep(servNo);
				request.setAttribute("serviceStepVO", serviceStepVO);
				String url = "/services/UpdateServiceStep.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = request.getRequestDispatcher("/services/UpdateServiceStep.jsp");
				failureView.forward(request, response);
			}
		}
		if ("update".equals(action)) {
			try {
				Integer servNo = new Integer(request.getParameter("servNo"));
				Integer servStep = Integer.valueOf(request.getParameter("servStep"));
				String stepName = request.getParameter("stepName");
				String stepDescp = request.getParameter("stepDescp");

				byte[] stepPic = null;
				ServiceStepVO serviceStepVO = new ServiceStepVO();
				Integer servStepNo = serviceStepVO.getServStepNo();
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
				ServicesVO servicesVO = new ServicesVO();
				servicesVO.setServNo(servNo);
				serviceStepVO.setServicesVO(servicesVO);
				serviceStepVO.setStepDescp(stepDescp);
				serviceStepVO.setStepName(stepName);
				serviceStepVO.setStepPic(stepPic);
				serviceStepVO.setServStep(servStepNo);
				serviceStepVO.setServStep(servStep);
				if (!errorMsg.isEmpty()) {
					request.setAttribute("servicesVO", servicesVO); // 含有輸入格式錯誤的ServicesVOO物件,也存入request
					RequestDispatcher failureView = request.getRequestDispatcher("/services/UpdateServiceStep.jsp");
					failureView.forward(request, response);
					return; // 程式中斷
				}
				ServiceStepService sss = new ServiceStepService();
				serviceStepVO = sss.updateServiceStep(servStepNo, stepName, stepDescp, stepPic, servStepNo, servicesVO);
				request.setAttribute("serviceStepVO", serviceStepVO);
				String url = "ListAllServiceStep.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				errorMsg.put("errorservPhoto", "修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/services/UpdateServiceStep.jsp");
				failureView.forward(request, response);
			}
		}

	}

}
