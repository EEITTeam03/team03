package com.test.datasource;

import java.io.IOException;

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
 * Servlet implementation class PhoneTest
 */
@WebServlet("/PhoneTest")
public class PhoneTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PhoneTest() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String memberPhone = request.getParameter("memberPhone");
		String[] memberPhones = request.getParameterValues("memberPhone");
		String memberPhone= memberPhones[0];
		//Integer memberNo = 4;
		
		MemberInfoDAO dao = new MemberInfoHibernateDAO();
		MemberInfoVO aVO = dao.findByPhone(memberPhone);
		
		request.setAttribute("memberPhone", aVO);
		RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
