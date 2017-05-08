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
				String birthday = req.getParameter("datepicker");
				String address = req.getParameter("address");
				
//				String carLicense = req.getParameter("carLicense");
				
//				String memberinfoVO = (String) req.getAttribute("memberinfoVO");
				
//				if (carLicense == null || carLicense.trim().length() == 0) {
//					errorMsgMap.put("carLicenseEmptyError", "請輸入車牌");
//				}
				
//				java.sql.Date bday = Date.valueOf(birthday);
//				java.sql.Date eday = Date.valueOf(effectiveDate);

//				MemberInfoVO memberInfoVO = new MemberInfoVO();
//				
//				memberInfoVO.setMemberName(name);
//				memberInfoVO.setEmail(email);
//				memberInfoVO.setPassword(password);
//				memberInfoVO.setPhone(phone);
//				memberInfoVO.setBirthday(bday);
//				memberInfoVO.setAddress(address);
				
				
				// Send the use back to the form, if there were errors
//				if (!errorMsgMap.isEmpty()) {
//					req.setAttribute("memberCarsVO", memberCarsVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("register.jsp");
//					failureView.forward(req, res);
//					return;
//				}
				
				
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
