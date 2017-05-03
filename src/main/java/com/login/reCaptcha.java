package com.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");	
		String g_recaptcha_response = (String)request.getParameter("g-recaptcha-response");
		   String secret="6Lejoh8UAAAAAAA9lx-unzLZ2krF2YXC346LSOJi";
		   URL dest = new URL("https://www.google.com/recaptcha/api/siteverify?secret="+secret+"&response="+g_recaptcha_response);
		   URLConnection yc = dest.openConnection();
		   BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		   String inputLine;
		   String webdata="";
		   String msg;

		   while ((inputLine = in.readLine()) != null)
		       		webdata=webdata+inputLine;
		   in.close();
		   if(webdata.indexOf("true")>0)
			   msg="Pass";
		   else if(webdata.indexOf("missing-input-response")>0)
			   msg="請勾選我不是機器人";   
		   else 
			   msg="Fail";
		   PrintWriter out = response.getWriter();
		   out.println(msg);
	}

}
