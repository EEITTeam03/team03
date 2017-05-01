package com.test.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.membercars.model.MemberCarsVO;
import com.memberinfo.model.MemberInfoHibernateDAO;
import com.memberinfo.model.MemberInfoVO;

/**
 * Servlet implementation class ShowCars
 */
@WebServlet("/reserve/ShowCars")
public class ShowCars extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberNo = request.getParameter("memberNo");
		
		MemberInfoHibernateDAO dao = new MemberInfoHibernateDAO();
		MemberInfoVO memberInfoVO = dao.findByPK(Integer.parseInt(memberNo));
		Set<MemberCarsVO> cars = memberInfoVO.getMemberCars();
		
		request.setAttribute("cars", cars);
		request.getRequestDispatcher("/reserve/start.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
