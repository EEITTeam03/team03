package com.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
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

/**
 * Servlet implementation class reCaptcha
 */
@WebServlet("/reCaptcha.do")
public class reCaptcha extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public reCaptcha() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");

		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		// 將errorMsgMap放入request物件內，識別字串為 "ErrorMsgKey"
		request.setAttribute("ErrorMsgKey", errorMsgMap);
		// 1. 讀取使用者輸入資料
		String userId = request.getParameter("email");
		String userPhone = request.getParameter("phone");
		// 2. 進行必要的資料轉換
		// 無
		// 3. 檢查使用者輸入資料
		// 如果 userId 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (userId == null || userId.trim().length() == 0) {
			errorMsgMap.put("AccountError", "帳號欄必須輸入");
		}
		if (userPhone == null || userPhone.trim().length() == 0) {
			errorMsgMap.put("PhoneError", "車牌號碼必須輸入");
		}
		if (!errorMsgMap.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("forgetPassWord.jsp");
			rd.forward(request, response);
			return;
		}
		
		String g_recaptcha_response = (String) request.getParameter("g-recaptcha-response");
		String secret = "6Lejoh8UAAAAAAA9lx-unzLZ2krF2YXC346LSOJi";
		URL dest = new URL("https://www.google.com/recaptcha/api/siteverify?secret=" + secret + "&response="
				+ g_recaptcha_response);
		URLConnection yc = dest.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine;
		String webdata = "";
		//String msg;

		while ((inputLine = in.readLine()) != null)
			webdata = webdata + inputLine;
		in.close();
		try {
			MemberService ms = new MemberService();
			MemberInfoVO mem = ms.getOneByEmail(userId);
			if (mem != null && (userPhone.equals(mem.getPhone()))) {
				if (webdata.indexOf("true") > 0) {
					request.setAttribute("accountName", mem.getMemberName());
					request.setAttribute("Member", mem);
					//System.out.println(mem.getMemberNo());
					RequestDispatcher rd = request.getRequestDispatcher("JavaMail.do");
					rd.forward(request, response);
					return;
				} else if (webdata.indexOf("missing-input-response") > 0)
					errorMsgMap.put("RobotFail", "請勾選我不是機器人");
				else
					errorMsgMap.put("RobotFail", "認證失敗");
			}else {
				//userid與密碼的組合錯誤，放一個錯誤訊息到 errorMsgMap 之內
				errorMsgMap.put("Error", "該帳號不存在或電話號碼輸入錯誤");
			}
		} catch (Exception e) {
			errorMsgMap.put("Error", "reCaptcha->NamingException:" + e.getMessage());
		}
		
		if (!errorMsgMap.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("forgetPassWord.jsp");
			rd.forward(request, response);
			return;
		}
		
	}

}
