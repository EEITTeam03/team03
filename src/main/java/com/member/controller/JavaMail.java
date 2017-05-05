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
		MemberInfoVO mem = (MemberInfoVO)request.getAttribute("Member"); 
		//System.out.println(mem.getMemberNo());
		String host = "smtp.gmail.com";
		  int port = 587;
		  final String username = "eeit9306@gmail.com";
		  final String password = "EEITTeam03";//your password
		  
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.port", port);
		  Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			    protected PasswordAuthentication getPasswordAuthentication() {
			        return new PasswordAuthentication(username, password);
			    }
			});

		  try {
			  
			  MemberService ms = new MemberService();
			  String str = ms.randomPswd();
			  ms.updateMem(mem.getMemberNo(), mem.getEmail(), str, mem.getMemberName(), mem.getPhone(), mem.getBirthday(), mem.getAddress(), mem.getEffectiveDate());
			  //ms.getOneByEmail(userId);	
		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress("eeit9306@gmail.com"));
		   message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userId));
		   message.setSubject("你的密碼已寄送");
		   message.setText("Dear "+userName+", \n\n 您的密碼是"+str);

		   Transport transport = session.getTransport("smtp");
		   transport.connect(host, port, username, password);

		   Transport.send(message);

		   System.out.println("寄送email結束.");
		   RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
			rd.forward(request, response);
		  } catch (MessagingException e) {
		   throw new RuntimeException(e);
		  }
	}



}
