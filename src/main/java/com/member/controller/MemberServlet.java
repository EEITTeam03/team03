package com.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("insert".equals(action)) {
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			req.setAttribute("ErrorMsgKey", errorMsgMap);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String name = req.getParameter("name");
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");

				String[] modelNos = req.getParameterValues("modelNo");
				String[] licenses = req.getParameterValues("licenses");

				
				if (name == null || name.trim().length() == 0) {
					errorMsgMap.put("NameEmptyError", "請輸入您的姓名");
				}
				if (email == null || email.trim().length() == 0) {
					errorMsgMap.put("EmailEmptyError", "請輸入電子郵件");
				}
				if (password == null || password.trim().length() == 0) {
					errorMsgMap.put("PasswordEmptyError", "請輸入密碼");
				}
				if (phone == null || phone.trim().length() == 0) {
					errorMsgMap.put("PhoneEmptyError", "請輸入電話");
				}
				java.sql.Date birthday = null;
				try {
					birthday = java.sql.Date.valueOf(req.getParameter("datepicker").trim());
				} catch (Exception e) {
					birthday = new java.sql.Date(System.currentTimeMillis());
					errorMsgMap.put("BirthdayEmptyError", "請輸入生日!");
				}
				if (address == null || address.trim().length() == 0) {
					errorMsgMap.put("AddressEmptyError", "請輸入地址");
				}
				java.sql.Date effectiveDate =  new java.sql.Date(System.currentTimeMillis());
				
//				if (carLicense == null || carLicense.trim().length() == 0) {
//					errorMsgMap.put("CarLicenseEmptyError", "請輸入車牌號碼");
//				}

				
				
				MemberInfoVO memberinfoVO = new MemberInfoVO();
				
				memberinfoVO.setMemberName(name);
				memberinfoVO.setEmail(email);
				memberinfoVO.setPassword(password);
				memberinfoVO.setPhone(phone);
				memberinfoVO.setBirthday(birthday);
				memberinfoVO.setAddress(address);
				memberinfoVO.setEffectiveDate(effectiveDate);
				// Send the use back to the form, if there were errors
				if (!errorMsgMap.isEmpty()) {
					req.setAttribute("memberinfoVO", memberinfoVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("register.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				MemberService memberSvc = new MemberService();
				memberinfoVO = memberSvc.insertMemAndCar(name, email, password, phone, birthday, address, effectiveDate,modelNos,licenses);
				
				
				/***************************3.準備轉交(Send the Success view)***********/
				//req.setAttribute("memberSuccess", memberinfoVO);
				res.sendRedirect(getServletContext().getContextPath()+"/login.jsp");
//				String url = "carType.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "其他錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("register.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) {
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			req.setAttribute("ErrorMsgKey", errorMsgMap);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer memberNo = new Integer(req.getParameter("memberNo"));
				String memberName = req.getParameter("name");
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				String birthday = req.getParameter("datepicker");
				String effectiveDate = req.getParameter("effectiveDate");
				
				if (memberName == null || memberName.trim().length() == 0) {
					errorMsgMap.put("NameEmptyError", "請輸入您的姓名");
				}
				if (email == null || email.trim().length() == 0) {
					errorMsgMap.put("EmailEmptyError", "請輸入電子郵件");
				}
				if (password == null || password.trim().length() == 0) {
					errorMsgMap.put("PasswordEmptyError", "請輸入密碼");
				}
				if (phone == null || phone.trim().length() == 0) {
					errorMsgMap.put("PhoneEmptyError", "請輸入電話");
				}
//				java.sql.Date birthday = null;
				if (birthday == null || birthday.trim().length() == 0) {
					errorMsgMap.put("BirthdayEmptyError", "請輸入生日");
				}
				if (address == null || address.trim().length() == 0) {
					errorMsgMap.put("AddressEmptyError", "請輸入地址");
				}
				
				

				MemberInfoVO memberinfoVO = null;
				
//				MemberInfoVO memberinfoVO = new MemberInfoVO();
//				memberinfoVO.setMemberNo(memberNo);
//				memberinfoVO.setMemberName(memberName);
//				memberinfoVO.setEmail(email);
//				memberinfoVO.setPassword(password);
//				memberinfoVO.setPhone(phone);
//				memberinfoVO.setBirthday(birthday);
//				memberinfoVO.setAddress(address);
				java.sql.Date bday = Date.valueOf(birthday);
				java.sql.Date eday = Date.valueOf(effectiveDate);
				// Send the use back to the form, if there were errors
				if (!errorMsgMap.isEmpty()) {
					req.setAttribute("memberinfoVO", memberinfoVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("Update.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				MemberService memberSvc = new MemberService();
				memberinfoVO = memberSvc.updateMem(memberNo, memberName, email, password, phone, bday, address, eday);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "其他錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("Update.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Display".equals(action)) {
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			req.setAttribute("ErrorMsgKey", errorMsgMap);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("memberNo");
				
				if (str == null || str.trim().length() == 0) {
					errorMsgMap.put("NameEmptyError", "請輸入會員編號");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgMap.isEmpty()) {
					
					RequestDispatcher failureView = req
							.getRequestDispatcher("MemberUpdate.jsp");
					failureView.forward(req, res);
					return;
				}
				
				Integer memberNo = null;
				try {
					memberNo = new Integer(str);
				} catch (Exception e) {
					errorMsgMap.put("ErrorMsgKey", "員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgMap.isEmpty()) {
					
					RequestDispatcher failureView = req
							.getRequestDispatcher("MemberUpdate.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.開始新增資料***************************************/
				MemberService memberSvc = new MemberService();
				MemberInfoVO memberinfoVO = memberSvc.getOneMem(memberNo);
				if (memberinfoVO == null) {
					errorMsgMap.put("ErrorMsgKey", "查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgMap.isEmpty()) {
					
					RequestDispatcher failureView = req
							.getRequestDispatcher(".jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				req.setAttribute("memberinfoVO", memberinfoVO);
				String url = "MemberUpdate.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "無法取得資料:");
				RequestDispatcher failureView = req
						.getRequestDispatcher("MemberUpdate.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) {
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			req.setAttribute("ErrorMsgKey", errorMsgMap);
			
			try {
				/***************************1.接收請求參數**********************/
				Integer memberNo = new Integer(req.getParameter("memberNo"));
				
				
				/***************************2.開始查詢資料***************************************/
				MemberService memberSvc = new MemberService();
				MemberInfoVO memberinfoVO = memberSvc.getOneMem(memberNo);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)***********/
				req.setAttribute("memberinfoVO", memberinfoVO);
				String url = "Update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "無法取得要修改的資料:");
				RequestDispatcher failureView = req
						.getRequestDispatcher("MemberUpdate.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(action)) {
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			req.setAttribute("ErrorMsgKey", errorMsgMap);
			
			try {
				/***************************1.接收請求參數**********************/
				Integer memberNo = new Integer(req.getParameter("memberNo"));
//				String carLicense = req.getParameter("carLicense");
				
				/***************************2.開始刪除資料***************************************/
				MemberService memberSvc = new MemberService();
				memberSvc.deleteMem(memberNo);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)***********/
				
				String url = "MemberUpdate.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "刪除資料失敗:");
				RequestDispatcher failureView = req
						.getRequestDispatcher("MemberUpdate.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
