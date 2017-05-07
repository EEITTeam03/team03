package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;

import myutil.SendEmail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 * Servlet implementation class JavaMail
 */
@WebServlet("/JavaMail.do")
public class JavaMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JavaMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//請求者的名稱、帳號、密碼
		response.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("email");
		String userName = (String) request.getAttribute("accountName");
		String subject = "Check your password";
		MemberInfoVO mem = (MemberInfoVO)request.getAttribute("Member"); 
		//System.out.println(mem.getMemberNo());
		SendEmail se = new SendEmail();	
			  MemberService ms = new MemberService();
			  String str = ms.randomPswd();
			  ms.updatemem(mem.getMemberNo(), mem.getEmail(), str, mem.getMemberName(), mem.getPhone(), mem.getBirthday(), mem.getAddress());
			  //ms.getOneByEmail(userId);	
		   se.sendPassword(userId, subject, userName, str);
		   RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
			rd.forward(request, response);
	}



}
