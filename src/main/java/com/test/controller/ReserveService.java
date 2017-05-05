package com.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.model.EmployeeVO;
import com.membercars.model.MemberCarsDAO;
import com.membercars.model.MemberCarsHibernateDAO;
import com.membercars.model.MemberCarsVO;
import com.reservlist.model.ReservListVO;
import com.schedule.model.ReservDAO;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;
import com.servicecarclass.model.ServiceCarClassService;
import com.servicecarclass.model.ServiceCarClassVO;
import com.services.model.ServicesDAO_Hibernate;
import com.services.model.ServicesVO;

import myutil.MyUtil;


@WebServlet("/ReserveService")
public class ReserveService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReserveService() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		HttpSession session = request.getSession();
		
		List<String> errmsg = new ArrayList<String>();
		request.setAttribute("errorMsg", errmsg);
		
		String license = request.getParameter("license");
		String selectedDate = request.getParameter("selectedDate");
		String selectedTime = request.getParameter("selectedTime");
		String singleService = request.getParameter("service");
		String ckbox[] = request.getParameterValues("plus");
		String empNo = request.getParameter("empNo");
		
//		Map<String,String> par = new HashMap<>();
//		par.put("license",license);
//		par.put("selectedDate",selectedDate);
//		par.put("selectedTime",selectedTime);
//		par.put("singleService",singleService);
//		par.put("empNo",empNo);
//		session.setAttribute("par", par);
		
		//日期-字串轉Calendar
		Calendar cal = MyUtil.getCalender(selectedDate,selectedTime);
		

		
		// 全新的訂單物件
		ReservVO reservVO = new ReservVO();
		
		// new DAO 
		ServicesDAO_Hibernate sdao = new ServicesDAO_Hibernate();
		MemberCarsDAO cdao = new MemberCarsHibernateDAO();

		// 取得車VO
		MemberCarsVO memberCarsVO = cdao.findByPK(license);
		reservVO.setMembercarsVO(memberCarsVO);
		
		String size = memberCarsVO.getCarTypeVO().getCarClassVO().getCarClass();
		
		//放入日期
		reservVO.setReservDateTime(cal);
		
		//宣告結束時間
		Calendar calEnd = Calendar.getInstance();
		Integer end = 0;
		
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
		
		end += sccVO.getServTime();
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
			end += sccvo.getServTime();
			
			reservSet.add(rlvo);
		}
		
		//加入結束時間
		long endms = end*60*1000;
		calEnd.setTimeInMillis(cal.getTimeInMillis() + endms);
		reservVO.setReservEndTime(calEnd);
		
		// 建立員工(?
		EmployeeVO evo = new EmployeeVO();
		int emp = Integer.parseInt(empNo); 
		evo.setEmployeeNo(emp);
		evo.setEmployeeName("JACK邱華捷");
		reservVO.setEmployeeVO(evo);

	
		//狀態為1(未到) 2(進行中) 3(已結束) 0(已取消)
		reservVO.setStatus(1);
		
		//把明細塞到訂單
		reservVO.setReservlists(reservSet);
		
		
		//查詢當日預約-檢查有無重複 (不同師傅可)
		ReservService rsvc = new ReservService();
		List<ReservVO> list = rsvc.getAllReservByDateAndEmp(cal, emp);
		for(ReservVO aReserve :list){
			int aemp = aReserve.getEmployeeVO().getEmployeeNo();
			Calendar acal = aReserve.getReservDateTime();
			Calendar acalEnd = aReserve.getReservEndTime();
			long tstart = cal.getTimeInMillis();
			long tend = calEnd.getTimeInMillis();
			long xstart = acal.getTimeInMillis();
			long xend = acalEnd.getTimeInMillis();
			
				if(xstart < tstart && xend <= tstart){
					//System.out.println("OK前");
				}else if (xstart > tstart && xstart >= tend){
					//System.out.println("OK後");
				}else {
					errmsg.add("所選的時段重複!");
				}
			
//		for(ReservVO aReserve :list){
//			Calendar acal = aReserve.getReservDateTime();
//			Calendar acalEnd = aReserve.getReservEndTime();
//			//long et = acalEnd.getTimeInMillis()-1;
//			
//			if(acal.before(cal) && acalEnd.before(cal)){
//				//System.out.println("OK前");
//			}else if (acal.after(cal) && acal.after(calEnd)){
//				//System.out.println("OK後");
//			}else {
//				errmsg.add("所選的時段重複!");
//			}
			
		
				
		}
		
		//****************失敗*******************
		if (errmsg.size() != 0) {
//			request.getSession().setAttribute("reservVO", reservVO);
//			response.sendRedirect(request.getContextPath()+"/start_reserve.jsp");
			request.setAttribute("reservVO", reservVO);
			request.getRequestDispatcher("/start_reserve.jsp")
			.forward(request, response);
//			request.getRequestDispatcher("/reserve/reserve_page.jsp")
			return;
		}
		
		
		//***********資料都正確-新增訂單*************
		ReservDAO rdao = new ReservDAO();
		rdao.insert(reservVO);
		
		// 準備轉交
		request.setAttribute("reserve", reservVO);
		request.getRequestDispatcher("/reserve_success.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
