package com.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;

/**
 * Servlet implementation class CheckFBLogin
 */
@WebServlet("/CheckFBLogin")
public class CheckFBLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckFBLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println(password);
		MemberService ms = new MemberService();
		List<MemberInfoVO> list= ms.getMember(email, password);
//		MemberInfoVO memberInfoVO = list.get(0);
		HttpSession session = request.getSession();
		session.setAttribute("FBAccount",email);
		session.setAttribute("FBId",password);
		session.setAttribute("FBName", name);
		if(list.size()==0){
			out.print("Account Not found");
			return;
		}
		session.setAttribute("memberInfo", list.get(0));
		session.setAttribute("Code", "OK");
		out.print("Logging Success");
	}

}
