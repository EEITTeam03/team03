package com.progress;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.memberinfo.model.MemberInfoVO;

/**
 * Servlet implementation class ChangeApplication
 */
@WebServlet("/ChangeApplication")
public class ChangeApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeApplication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
//		String user = request.getParameter("user");
//		ServletContext 權限控管Application = request.getServletContext();
//		//要記得清空，如果一直set他會變成陣列
//		權限控管Application.removeAttribute("user");
//		權限控管Application.setAttribute("user", user);
//		response.getWriter().append("目前有權限的人是:"+user);
		
		
		
		HttpSession session = request.getSession();
		
		MemberInfoVO menberInfo;
		menberInfo = (MemberInfoVO)session.getAttribute("memberInfo");
		
		if(null != menberInfo){
			System.out.println("現在的使用者是:"+menberInfo.getMemberName());
			response.getWriter().append("目前有權限的人編碼:"+menberInfo.getMemberNo());
			response.getWriter().append("目前有權限的人是:"+menberInfo.getMemberName());
		}else{
			System.out.println("請登入後再使用此功能");
			session.setAttribute("target",request.getContextPath() + "/ChangeApplication");
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/login.jsp"));
			return;
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
