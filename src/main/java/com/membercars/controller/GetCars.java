package com.membercars.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.membercars.model.MemberCarsVO;
import com.membercars.model.MembercarsService;

/**
 * Servlet implementation class GetCars
 */
@WebServlet("/GetCars")
public class GetCars extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetCars() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
//		MemberInfoVO memberInfoVO = (MemberInfoVO) request.getSession().getAttribute("memberInfo");
		
//		if(memberInfoVO != null) {
			MembercarsService svc = new MembercarsService();
//			Integer no = memberInfoVO.getMemberNo();
			List<MemberCarsVO> list = svc.getListByMember(9);
			
			
			Gson gson = new GsonBuilder().create();
			String json = gson.toJson(list);
			out.print(json);
//			JSONObject json = new JSONObject();
//			String jsonString = JSONValue.toJSONString(list);
//			out.print(jsonString);
//		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
