package com.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.model.EmployeeService;
import com.employee.model.EmployeeVO;
import com.membercars.model.MemberCarsDAO;
import com.membercars.model.MemberCarsHibernateDAO;
import com.membercars.model.MemberCarsVO;
import com.memberinfo.model.MemberInfoVO;
import com.progress.AutoSetTodayReservList;
import com.reservlist.model.ReservListVO;
import com.schedule.model.ReservDAO;
import com.schedule.model.ReservVO;
import com.servicecarclass.model.ServiceCarClassService;
import com.servicecarclass.model.ServiceCarClassVO;
import com.services.model.ServicesDAO_Hibernate;
import com.services.model.ServicesVO;

import myutil.CheckConflict;
import myutil.MyUtil;
import myutil.SendEmail;

			  
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
//		String singleService = request.getParameter("service");
		String singleService = request.getParameter("radio1");
//		String ckbox[] = request.getParameterValues("plus");
		String ckbox[] = request.getParameterValues("checkbox");
//		String empNo = request.getParameter("empNo");
		String empNo = request.getParameter("radio2");
		
		if(license.equals(""))
			errmsg.add("未選擇車牌!");
		
		if(selectedDate.equals("")) 
			errmsg.add("未選擇日期!");
		
		if(selectedTime.equals(""))
			errmsg.add("未選擇時間!");
		
		if(singleService.equals(""))
			errmsg.add("至少要選擇一種主要服務!");
		
		if(empNo.equals("")) 
			errmsg.add("請選擇服務的技師");
		
		//****************失敗*******************
		if (errmsg.size() != 0) {
			request.getRequestDispatcher("/start_reserve.jsp")
			.forward(request, response);
			return;
		}
		
		//日期-字串轉Calendar
		Calendar cal = null;
		try {
			cal = MyUtil.getCalender(selectedDate,selectedTime);
		} catch (RuntimeException e) {
			errmsg.add("日期格式錯誤，你再亂打什麼啦");
		}
		
		//****************失敗*******************
		if (errmsg.size() != 0) {
			request.getRequestDispatcher("/start_reserve.jsp")
			.forward(request, response);
			return;
		}
		
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

		//判斷有沒有選多選
		if (ckbox != null) {
		
		// 加入多筆多選服務VO (如果有選的話)
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
		}
		//加入結束時間
		long endms = end*60*1000;
		calEnd.setTimeInMillis(cal.getTimeInMillis() + endms);
		reservVO.setReservEndTime(calEnd);
		
		Integer endint = Calendar.HOUR_OF_DAY;
		 if(endint>21||cal.get(Calendar.DATE)!=calEnd.get(Calendar.DATE)) {
				errmsg.add("所選的時段超過營業時間!");
			}
		
		// 查他選的員工
		int emp = Integer.parseInt(empNo); 
		EmployeeService esvc = new EmployeeService();
		EmployeeVO evo = esvc.getOneEmp(emp);
		reservVO.setEmployeeVO(evo);
		
		
		//狀態為1(未到) 2(進行中) 3(已結束) 0(已取消)
		reservVO.setStatus(1);
		
		//把明細塞到訂單
		reservVO.setReservlists(reservSet);
		
		
		//查詢當日預約-檢查有無重複 (不同師傅可)
		CheckConflict ccf = new CheckConflict();
		boolean conflict = ccf.checkDateAndEmp(cal, calEnd, emp);
		if(conflict) {
				errmsg.add("所選的時段重複!");
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
//		ReservService resvc = new ReservService();
//		resvc.addReservAndList(cal, calEnd, memberCarsVO, "", "", evo, 1, reservSet);
		ReservDAO rdao = new ReservDAO();
		rdao.insert(reservVO);
		
		//寄信通知
		 SendEmail se= new SendEmail();
		 se.reserveOK(reservVO);
		//預約即將到期寄信通知
		 MemberInfoVO mivo = memberCarsVO.getMemberInfoVO();
		 se.setProps(mivo.getEmail(), mivo.getMemberName(), cal);
		 
			/*---------------insert新預約單，增加監視器觀看權限------------------*/
			if(MyUtil.formatCalender(cal).equals(MyUtil.formatCalender(Calendar.getInstance()))){
				AutoSetTodayReservList autoSet = new AutoSetTodayReservList();
				ServletContext application = request.getServletContext();
				for(Calendar startTime= cal;MyUtil.getHHmmFormat(calEnd).compareTo(MyUtil.getHHmmFormat(startTime))>0;startTime.add(Calendar.MINUTE,30)){
					String memberNo = ""+mivo.getMemberNo();
					autoSet.TodayReservListInsert(application,MyUtil.getHHmmFormat(startTime),memberNo);
					System.out.print("今日新增的時段及會員編號: "+MyUtil.getHHmmFormat(startTime)+",");
					System.out.println(memberNo);
				}
			}
		 
		 
		 
		// 準備轉交
		request.setAttribute("reserve", reservVO);
		request.getRequestDispatcher("/reserve_success.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
