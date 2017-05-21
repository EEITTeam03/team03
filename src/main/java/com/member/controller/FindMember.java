package com.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;

/**
 * Servlet implementation class FindMember
 */
@WebServlet("/FindMember")
public class FindMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mode = request.getParameter("mode");
		MemberService svc = new MemberService();
		List<MemberInfoVO> member =null;
		
		if ("phone".equals(mode)) {
			String phone = request.getParameter("phone");
			 member = svc.getMemberPhone(phone);
		}
		
		else if ("email".equals(mode)){
			String email = request.getParameter("email");
			member = svc.getMemberEmail(email);
		}
		
		if (member!=null) {
			request.setAttribute("list", member);
			request.getRequestDispatcher("/admin/member.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("notFound", "no");
			response.sendRedirect(getServletContext().getContextPath()+"/admin/member.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
