package com.employee.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.employee.model.EmployeeService;
import com.employee.model.EmployeeVO;
import com.sun.mail.iap.Response;

@WebServlet("/emp/emp.do")
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
		* 1024 * 500 * 5)
public class EmployeeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String empNo = req.getParameter("empNo");

				if (empNo == null || empNo.trim().length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				Integer eNo = null;
				try {
					eNo = Integer.valueOf(empNo);
				} catch (NumberFormatException ne) {
					errorMsgs.add("員工編號請輸入數字");
					// RequestDispatcher failureView =
					// req.getRequestDispatcher("/emp/insertEmp.jsp");
					// failureView.forward(req, res);
				}
				String ename = req.getParameter("ename");
				if (ename == null || ename.trim().length() == 0) {
					errorMsgs.add("請輸入姓名");
				}

				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!ename.trim().matches(enameReg)) {
					errorMsgs.add("員工姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String exp = new String(req.getParameter("exp").trim());
				if (exp == null || exp.trim().length() == 0) {
					errorMsgs.add("請輸入相關工作經驗，若無請填無");
				}
				InputStream is = null;
				Part filePart1 = req.getPart("upfile1");
				byte[] photo = null;
				if (filePart1 != null && filePart1.getSize() != 0) {
					is = filePart1.getInputStream();
					photo = new byte[(int) filePart1.getSize()];
					is.read(photo);
				} else
					errorMsgs.add("請輸入選擇檔案");

				EmployeeVO empVO = new EmployeeVO();
				empVO.setEmployeeName(ename);
				empVO.setEmployeePhoto(photo);
				empVO.setEmployeeDesc(exp);
				empVO.setEmployeeNo(eNo);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/emp/insertEmp.jsp");
					failureView.forward(req, res);
					return;
				}

				EmployeeService empSvc = new EmployeeService();
				empVO = empSvc.addEmp(eNo, ename, photo, exp);

//				String url = "/emp/listAllEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); 
//				successView.forward(req, res);
				String url = "listAllEmp.jsp";
				res.sendRedirect(url);
				// is.close();

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/emp/insertEmp.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String empNo = req.getParameter("empno");

				Integer eNo = null;
				
					eNo = Integer.valueOf(empNo);
				
				String ename = req.getParameter("ename");
				if (ename == null || ename.trim().length() == 0) {
					errorMsgs.add("請輸入姓名");
				}

				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!ename.trim().matches(enameReg)) {
					errorMsgs.add("員工姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String exp = new String(req.getParameter("exp").trim());
				if (exp == null || exp.trim().length() == 0) {
					errorMsgs.add("請輸入相關工作經驗，若無請填無");
				}
				InputStream is = null;
				Part filePart1 = req.getPart("upfile1");
				byte[] photo = null;
				if (filePart1 != null && filePart1.getSize() != 0) {
					is = filePart1.getInputStream();
					photo = new byte[(int) filePart1.getSize()];
					is.read(photo);
				} else
					errorMsgs.add("請輸入選擇檔案");

				EmployeeVO empVO = new EmployeeVO();
				empVO.setEmployeeName(ename);
				empVO.setEmployeePhoto(photo);
				empVO.setEmployeeDesc(exp);
				empVO.setEmployeeNo(eNo);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/emp/updateEmp.jsp");
					failureView.forward(req, res);
					return;
				}

				EmployeeService empSvc = new EmployeeService();
				empVO = empSvc.updateEmp(eNo, ename, photo, exp);
				
				String url = "listAllEmp.jsp";
//				String url = "/emp/listAllEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); 
//				successView.forward(req, res);
				res.sendRedirect(url);
				// is.close();

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/emp/updateEmp.jsp");
				failureView.forward(req, res);
			}
		}
//		if("chooseEmp".equals(action)){
//			
//		}
	}
}
