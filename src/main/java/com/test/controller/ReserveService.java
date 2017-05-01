package com.test.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cartype.model.CarTypeVO;
import com.employee.model.EmployeeVO;
import com.membercars.model.MemberCarsDAO;
import com.membercars.model.MemberCarsHibernateDAO;
import com.membercars.model.MemberCarsVO;
import com.reservlist.model.ReservListVO;
import com.schedule.model.ReservDAO;
import com.schedule.model.ReservVO;
import com.servicecarclass.model.ServiceCarClassService;
import com.servicecarclass.model.ServiceCarClassVO;
import com.services.model.ServicesDAO_Hibernate;
import com.services.model.ServicesVO;

import myutil.MyUtil;

/**
 * Servlet implementation class ReserveService
 */
@WebServlet("/reserve/ReserveService")
public class ReserveService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReserveService() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String license = request.getParameter("license");
		String selectedDate = request.getParameter("selectedDate");
		String singleService = request.getParameter("service");
		String ckbox[] = request.getParameterValues("plus");
		String empNo = request.getParameter("empNo");

		// 全新的訂單物件
		ReservVO reservVO = new ReservVO();

		// new DAO 
		ServicesDAO_Hibernate sdao = new ServicesDAO_Hibernate();
		MemberCarsDAO cdao = new MemberCarsHibernateDAO();

		// 取得車VO
		MemberCarsVO memberCarsVO = cdao.findByPK(license);
		reservVO.setMembercarsVO(memberCarsVO);

		
		 String size = memberCarsVO.getCarTypeVO().getCarClassVO().getCarClass();
		
		// 日期-字串轉Calendar
		Calendar cal = MyUtil.getCalender(selectedDate);
		reservVO.setReservDateTime(cal);

		// 所選服務的集合-清單
		Set<ReservListVO> reservSet = new HashSet<ReservListVO>();

		// 加入一筆單選服務VO
		Integer singleServiceNo = Integer.parseInt(singleService);
		ServicesVO singleServiceVO = sdao.findByPrimaryKey(singleServiceNo);
		ServiceCarClassService svc = new ServiceCarClassService(); //查詢對應大小、服務的價錢和時間SVC
		
		ReservListVO singlerlvo = new ReservListVO();    //新增一筆訂單明細物件
		singlerlvo.setReservVO(reservVO);
		singlerlvo.setServicesVO(singleServiceVO);
		ServiceCarClassVO sccVO = svc.getOneServiceCarClass(singleServiceNo,size);
		singlerlvo.setServPrice(sccVO.getServPrice());
		singlerlvo.setServTime(sccVO.getServTime());
		singlerlvo.setServName(singleServiceVO.getServName());

		reservSet.add(singlerlvo);

		// 加入多筆多選服務VO
		for (int i = 0; i < ckbox.length; i++) {
			Integer serviceNo = Integer.parseInt(ckbox[i]);
			ServicesVO servicesVO = sdao.findByPrimaryKey(serviceNo);
			ReservListVO rlvo = new ReservListVO();
			rlvo.setReservVO(reservVO);
			rlvo.setServicesVO(servicesVO);
			ServiceCarClassVO sccvo = svc.getOneServiceCarClass(serviceNo, size);
			rlvo.setServPrice(sccvo.getServPrice());
			rlvo.setServTime(sccvo.getServTime());
			rlvo.setServName(servicesVO.getServName());

			reservSet.add(rlvo);
		}

		// 建立員工(?
		EmployeeVO evo = new EmployeeVO();
		evo.setEmployeeNo(Integer.parseInt(empNo));
		evo.setEmployeeName("JACK邱華捷");
		reservVO.setEmployeeVO(evo);

	
		//狀態為1(未到) 2(進行中) 3(已結束) 0(已取消)
		reservVO.setStatus(1);
		
		//把明細塞到訂單
		reservVO.setReservlists(reservSet);
		
		//新增訂單
		ReservDAO rdao = new ReservDAO();
		rdao.insert(reservVO);
		
		// 準備轉交
		request.setAttribute("reserve", reservVO);
		request.getRequestDispatcher("/reserve/success.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
