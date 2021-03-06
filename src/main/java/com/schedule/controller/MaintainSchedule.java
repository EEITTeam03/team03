package com.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carclass.model.CarClassHibernateDAO;
import com.carclass.model.CarClassVO;
import com.employee.model.EmployeeService;
import com.employee.model.EmployeeVO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.membercars.model.MemberCarsVO;
import com.membercars.model.MembercarsService;
import com.reservlist.model.ReservListService;
import com.reservlist.model.ReservListVO;
import com.schedule.model.ReservDAO;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;
import com.servicecarclass.model.ServiceCarClassService;
import com.servicecarclass.model.ServiceCarClassVO;
import com.services.model.ServicesService;
import com.services.model.ServicesVO;

import myutil.CheckConflict;
import myutil.MyUtil;

/**
 * Servlet implementation class MaintainSchedule
 */
@WebServlet("/MaintainSchedule")
public class MaintainSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MaintainSchedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String json = request.getParameter("data");
		HashMap<String,String> map = new HashMap<String,String>();
		map = new Gson().fromJson(json, new TypeToken<HashMap<String,String>>(){}.getType());
		
		Integer reservNo= Integer.valueOf(map.get("id"));
		ReservService rs = new ReservService();
		//ReservVO rvo= rs.getOneReserv(reservNo);
		
		Calendar scalendar = MyUtil.getLocalTimeFromUTC(map.get("start"));
		Calendar OldEnd = MyUtil.getLocalTimeFromUTC(map.get("end"));
		
		Integer empNo= Integer.valueOf(map.get("empNo"));
		EmployeeService es = new EmployeeService();
		EmployeeVO eVO = es.getOneEmp(empNo);
		
		String license = map.get("subject");
		MembercarsService mcs = new MembercarsService();
		MemberCarsVO mcv = mcs.getOneByPK(license);
		
		String noteC = map.get("description");
		
		String notesE = map.get("noteE");
		
		Integer status =Integer.valueOf( map.get("status"));
		
		String serviceS = map.get("serviceS");
		Integer SS = Integer.valueOf(serviceS);
		
		
		String carSize= mcv.getCarTypeVO().getCarClassVO().getCarClass();
		
		ServiceCarClassService sccs = new ServiceCarClassService();
		ServiceCarClassVO sccVO = sccs.getOneServiceCarClass(SS, carSize);
		Integer sTime=0;
		if(sccVO.getServTime()!=null) sTime = sccVO.getServTime(); //得到單選服務的時間了
		
		String serviceM = map.get("serviceM");
		List<Integer> list = new ArrayList<Integer>();
		Integer mTime=0;
		Integer MM=null;
		if(serviceM.length()!=0){
			String[] M= serviceM.split(",");
			
			for(int i=0;i<M.length;i++){
				MM = Integer.valueOf(M[i]);
				ServiceCarClassVO mmVO = sccs.getOneServiceCarClass(MM,carSize );
				mTime += mmVO.getServTime();
				list.add(MM);
			}
		}
		
		Integer TTime = sTime + mTime;
		
		Calendar ecalendar = Calendar.getInstance();
		ecalendar.setTime(scalendar.getTime());
		ecalendar.add(Calendar.HOUR_OF_DAY, TTime/60);
		ecalendar.add(Calendar.MINUTE, TTime%60);
		
		CheckConflict cc = new CheckConflict();
		ReservListService rls = new ReservListService();
		ServicesService svs = new ServicesService();
		
		ReservVO rvo = new ReservVO();
		
		
		if(cc.checkDateAndEmpUpdate(scalendar, ecalendar, empNo, reservNo)==false){
			rls.deleteListByNo(reservNo);//先把舊預約的ReservList刪除
			Set<ReservListVO>reservlists=new HashSet<ReservListVO>();
			ReservListVO rlVO = new ReservListVO();
			ServicesVO svo = svs.getOneService(SS);
			rlVO.setReservVO(rvo);
			rlVO.setServicesVO(svo);
			rlVO.setServName(svo.getServName());
			rlVO.setServPrice(sccVO.getServPrice());
			rlVO.setServTime(sccVO.getServTime());
			reservlists.add(rlVO);
			if(list!=null&&list.size()!=0){
				for(Integer servNo:list){
					ReservListVO mrlVO = new ReservListVO();
					ServicesVO mvo = svs.getOneService(servNo);
					ServiceCarClassVO mmVO = sccs.getOneServiceCarClass(servNo,carSize );
					mrlVO.setReservVO(rvo);
					mrlVO.setServicesVO(mvo);
					mrlVO.setServName(mvo.getServName());
					mrlVO.setServPrice(mmVO.getServPrice());
					mrlVO.setServTime(mmVO.getServTime());
					reservlists.add(mrlVO);
				}
			}
			rvo.setEmployeeVO(eVO);
			rvo.setMembercarsVO(mcv);
			rvo.setNoteC(noteC);
			rvo.setNotesE(notesE);
			rvo.setReservDateTime(scalendar);
			rvo.setReservEndTime(ecalendar);
			rvo.setReservlists(reservlists);
			rvo.setReservNo(reservNo);
			rvo.setStatus(status);
			ReservDAO dao = new ReservDAO();
			dao.update(rvo);
//			ReservService rsvc =new ReservService();
			
			//rs.updateReserv(reservNo, scalendar, noteC, notesE, status, membercarsVO, employeeVO, reservlists)
		} else{
			System.out.println("預約時間衝突");
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
