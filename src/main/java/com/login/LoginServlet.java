package com.login;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.memberinfo.model.MemberInfoHibernateDAO;
import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		Map<String, String> errorMsgMap = new HashMap<String, String>();

		req.setAttribute("ErrorMsgKey", errorMsgMap);
		
			/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			if (email == null || (email.trim()).length() == 0) {
				errorMsgMap.put("AccountEmptyError", "請輸入電子郵件");
			}

			if (password == null || (password.trim()).length() == 0) {
				errorMsgMap.put("PasswordEmptyError", "請輸入密碼");
			}
			if (!errorMsgMap.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("login.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始查詢資料 ****************************************/
		try {
			MemberService svc = new MemberService();
			List<MemberInfoVO> mem = svc.getMember(email, password);
			if (mem != null && mem.size() != 0) {
				MemberInfoVO memberInfoVO = mem.get(0);
				session.setAttribute("memberInfo", memberInfoVO);
				session.setAttribute("Code", "OK");
			} else {
				errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
			}

		} catch (Exception e) {
			errorMsgMap.put("LoginError", "LoginServlet->NamingException:" + e.getMessage());
			e.printStackTrace();
		}
		
		String requestURI = (String) session.getAttribute("target");
		if (errorMsgMap.isEmpty()) {
			if (requestURI != null) {
				requestURI = (requestURI.length() == 0 ? req.getContextPath() : requestURI);
				res.sendRedirect(res.encodeRedirectURL(requestURI));
				return;
			} else {
				res.sendRedirect(res.encodeRedirectURL(req.getContextPath() + "/index.jsp"));
				return;
			}
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, res);
			return;
		}

	}

}
