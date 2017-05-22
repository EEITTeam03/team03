package com.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.membercars.model.MemberCarsVO;
import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;

/**
 * Servlet implementation class CarLicense
 */
@WebServlet("/MemberNext")
public class MemberNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberNext() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
				
				if (!password.matches("^(?=.*\\d)(?=.*[a-zA-Z]).{8,50}$")) {
					errorMsgMap.put("PasswordEmptyError", "密碼長度必須有八碼，並且包含至少包含一個英文字母和一個數字");
				}
				
				if (!errorMsgMap.isEmpty()) {
//					req.setAttribute("memberinfoVO", memberinfoVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("register.jsp");
					failureView.forward(req, res);
					return;
				}
				
				//還差effectiveDate和memberCars沒設
				/***************************3.設定一半,準備轉交(Send the Success view)***********/
				String url = "/carType.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "其他錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("register.jsp");
				failureView.forward(req, res);
			}
		}
		
	}

}
