package com.schedule.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

/**
 * Servlet implementation class test
 */
@WebServlet("/admin/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//把圖片轉byte陣列，檔案路徑要自己改要抓的圖片路徑
		FileInputStream fis = new FileInputStream("C:/0.jpg");
		byte[] b = new byte[fis.available()];
		fis.read(b);
		fis.close();
		//用base64編碼
		String img = Base64.getEncoder().encodeToString(b);
		Map map = new HashMap();
		map.put("img1", img);
		//轉json
		String jsonString = JSONValue.toJSONString(map);  
		 out.println(jsonString);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
