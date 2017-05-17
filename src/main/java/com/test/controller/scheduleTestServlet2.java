package com.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blocklist.model.BlockListService;
import com.blockrule.model.BlockRuleService;
import com.employee.model.EmployeeService;
import com.employee.model.EmployeeVO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.membercars.model.MemberCarsVO;
import com.membercars.model.MembercarsService;
import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;
import com.progress.AutoSetTodayReservList;
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


@WebServlet(urlPatterns = {"/admin/scheduleTestServlet2","/scheduleTestServlet2"})
public class scheduleTestServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public scheduleTestServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String json = request.getParameter("data");
		String crudStatus = request.getParameter("status");
		HashMap<String,String> map = new HashMap<String,String>();
		map = new Gson().fromJson(json, new TypeToken<HashMap<String,String>>(){}.getType());
		
		String id = map.get("id");
		Integer reservNo = null;
		//透過師傅名字找編號(新單empNo=null，修改時empNo為原來的 calendar師傅名才有依修改變動)
		String empName = map.get("calendar");
		EmployeeService empService = new EmployeeService();
		EmployeeVO emp = empService.findNoByName(empName);
		Integer empNo = emp.getEmployeeNo();
		//如果id長度超過6，則為新增訂單 id為系統亂數
		if(id.length()<6){
			reservNo= Integer.valueOf(map.get("id"));	//取得預約編號
			System.out.println("修改時訂單編號: "+reservNo);
		}else{
			//設定編號為零的視為新訂單
			reservNo=0;		
			//System.out.println("新增時訂單編號: "+reservNo);
		}
		
		ReservService rs = new ReservService();
		//ReservVO rvo= rs.getOneReserv(reservNo);
		
		Calendar scalendar = MyUtil.getLocalTimeFromUTC(map.get("start")); //取得預約時間
		Calendar OldEnd = MyUtil.getLocalTimeFromUTC(map.get("end")); //取得原本的結束時間
		
		EmployeeService es = new EmployeeService();
		EmployeeVO eVO = es.getOneEmp(empNo);
		
		String license = map.get("subject"); //取得車牌
		MembercarsService mcs = new MembercarsService();
		MemberCarsVO mcv = mcs.getOneByPK(license);
		String memberNo = ""+mcv.getMemberInfoVO().getMemberNo();
		
		String noteC = map.get("description"); //取得noteC
		String notesE = map.get("noteE"); //取得notesE
		
		String statusS = map.get("status");
		Integer status=null;
		if(statusS.trim().equals("")){		//新增時如忘記輸入status 預設1
			//System.out.println("沒輸入Status(轉換前):"+status);
			status = 1;
		}else{
			status =Integer.valueOf( map.get("status"));
		}
		//System.out.println("Status(轉換後):"+status);
		
		String serviceS = map.get("serviceS"); //取得單選的服務
		Integer SS = Integer.valueOf(serviceS);
		
		
		String carSize= mcv.getCarTypeVO().getCarClassVO().getCarClass();
		
		ServiceCarClassService sccs = new ServiceCarClassService();
		ServiceCarClassVO sccVO = sccs.getOneServiceCarClass(SS, carSize);
		Integer sTime=0;
		if(sccVO.getServTime()!=null) sTime = sccVO.getServTime(); //得到單選服務的時間了
		
		String serviceM = map.get("serviceM"); //取得多選服務
		List<Integer> list = new ArrayList<Integer>();
		Integer mTime=0;
		Integer MM=null;
		if(serviceM.length()!=0){
			String[] M= serviceM.split(",");
			//計算多選服務的時間
			for(int i=0;i<M.length;i++){
				MM = Integer.valueOf(M[i]);
				ServiceCarClassVO mmVO = sccs.getOneServiceCarClass(MM,carSize );
				mTime += mmVO.getServTime(); 
				list.add(MM);
			}
		}
		
		Integer TTime = sTime + mTime; //單選和多選總共需要的時間
		//計算新的結束時間
		Calendar ecalendar = Calendar.getInstance();
		ecalendar.setTime(scalendar.getTime());
		ecalendar.add(Calendar.HOUR_OF_DAY, TTime/60);
		ecalendar.add(Calendar.MINUTE, TTime%60);
		
		CheckConflict cc = new CheckConflict();
		ReservListService rls = new ReservListService();
		ServicesService svs = new ServicesService();
		
		ReservVO rvo = new ReservVO();
		
		//判端預約有沒有衝突，若沒衝突則update
		if(cc.checkDateAndEmpUpdate(scalendar, ecalendar, empNo, reservNo)==false){
			//如果reservNo不為0，則為新增
			if(reservNo!=0){
				/*---------------update或delete預約單時，修改或刪除其監視器觀看權限時段------------------*/
				//新刪修訂單的預約日期為今天，才會更新觀看權限
				if(MyUtil.formatCalender(scalendar).equals(MyUtil.formatCalender(Calendar.getInstance()))){
					//System.out.println("新增:"+MyUtil.formatCalender(scalendar));
					//System.out.println(MyUtil.formatCalender(Calendar.getInstance()));
					AutoSetTodayReservList autoSet = new AutoSetTodayReservList();
					ServletContext application = request.getServletContext();
					for(Calendar startTime= rs.getOneReserv(reservNo).getReservDateTime();MyUtil.getHHmmFormat(OldEnd).compareTo(MyUtil.getHHmmFormat(startTime))>0;startTime.add(Calendar.MINUTE,30)){
						//String memberNo = ""+mcv.getMemberInfoVO().getMemberNo();
						autoSet.TodayReservListDelete(application,MyUtil.getHHmmFormat(startTime),memberNo);
						System.out.print("今日修改的時段及會員編號(先刪/delete則無後增): "+MyUtil.getHHmmFormat(startTime)+",");
						System.out.println(memberNo);
					}
				}
				/*-----------------------------------------------------------------------*/
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

				if(crudStatus.equals("delete")){
					rvo.setStatus(0);
					dao.update(rvo);
					//刪除自動加入黑名單(違反:1.取消預約)
					BlockListService bls = new BlockListService();
					BlockRuleService BRS = new BlockRuleService();
					String violationDate = MyUtil.formatCalender(Calendar.getInstance());
					bls.addBlockList(violationDate, reservNo, "", BRS.getOneByPK((short)1), mcv.getMemberInfoVO());
					bls.checkTimesForBlock(mcv.getMemberInfoVO(),violationDate);
				}else{
					dao.update(rvo);
					/*---------------update預約單時，修改其監視器觀看權限時段------------------*/
					if(MyUtil.formatCalender(scalendar).equals(MyUtil.formatCalender(Calendar.getInstance()))){
							AutoSetTodayReservList autoSet = new AutoSetTodayReservList();
							ServletContext application = request.getServletContext();
							for(Calendar startTime= scalendar;MyUtil.getHHmmFormat(ecalendar).compareTo(MyUtil.getHHmmFormat(startTime))>0;startTime.add(Calendar.MINUTE,30)){
								//String memberNo = ""+mcv.getMemberInfoVO().getMemberNo();
								autoSet.TodayReservListInsert(application,MyUtil.getHHmmFormat(startTime),memberNo);
								System.out.print("今日修改的時段及會員編號(後增): "+MyUtil.getHHmmFormat(startTime)+",");
								System.out.println(memberNo);
							}
					}
					/*------------------------------------------------------------*/
				}
			}else{
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
				rvo.setStatus(status);
				ReservDAO dao = new ReservDAO();
				dao.insert(rvo);
				/*---------------insert新預約單，增加監視器觀看權限------------------*/
				if(MyUtil.formatCalender(scalendar).equals(MyUtil.formatCalender(Calendar.getInstance()))){
					AutoSetTodayReservList autoSet = new AutoSetTodayReservList();
					ServletContext application = request.getServletContext();
					for(Calendar startTime= scalendar;MyUtil.getHHmmFormat(ecalendar).compareTo(MyUtil.getHHmmFormat(startTime))>0;startTime.add(Calendar.MINUTE,30)){
						//String memberNo = ""+mcv.getMemberInfoVO().getMemberNo();
						autoSet.TodayReservListInsert(application,MyUtil.getHHmmFormat(startTime),memberNo);
						System.out.print("今日新增的時段及會員編號: "+MyUtil.getHHmmFormat(startTime)+",");
						System.out.println(memberNo);
					}
				}
				/*---------------------------------------------------------*/
			}
		} else{
			System.out.println("預約時間衝突");
			out.println("預約時間衝突");
			return;
		}

		out.println("修改成功");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

