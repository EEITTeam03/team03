package com.test.datasource;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.memberinfo.model.MemberInfoDAO;
import com.memberinfo.model.MemberInfoHibernateDAO;
import com.memberinfo.model.MemberInfoVO;

/**
 * Servlet implementation class ModelTest
 */
@WebServlet("/ModelTest")
public class ModelTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Integer memberNo = (Integer) request.getAttribute("memberNo");
		Integer memberNo = 6;
		
		MemberInfoDAO dao = new MemberInfoHibernateDAO();
		MemberInfoVO aVO = dao.findByPK(memberNo);
		
		request.setAttribute("memberVO", aVO);
		RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
