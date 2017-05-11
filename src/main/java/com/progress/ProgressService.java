package com.progress;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.reservlist.model.ReservListService;
import com.reservlist.model.ReservListVO;
import com.servicestep.model.ServiceStepService;
import com.servicestep.model.ServiceStepVO;

public class ProgressService {
	
	public List<Map> getProgressStep(Integer reservNo) {
		ReservListService reservList = new ReservListService();
		List<ReservListVO> list = reservList.findByReservNo(reservNo);		//預約編號2的所有服務
		
		ServiceStepService stepService = new ServiceStepService();	//預約編號2所有服務的步驟
		List<ServiceStepVO> stepList;
		
		
		List<Map> list2 = new ArrayList<Map>();
		
		for(ReservListVO alist : list){
			Map map = new LinkedHashMap<>();
			
			int servNo = alist.getServicesVO().getServNo();
			String servName = alist.getServName();
			int servTime = alist.getServTime();
			int startY = alist.getReservVO().getReservDateTime().get(Calendar.YEAR);
			int startM = alist.getReservVO().getReservDateTime().get(Calendar.MONTH)+1;
			int startD = alist.getReservVO().getReservDateTime().get(Calendar.DATE);
			int startHH = alist.getReservVO().getReservDateTime().get(Calendar.HOUR_OF_DAY);
			int startMM = alist.getReservVO().getReservDateTime().get(Calendar.MINUTE);
//			int startSS = alist.getReservVO().getReservDateTime().get(Calendar.SECOND);
//			int startSSM = alist.getReservVO().getReservDateTime().get(Calendar.MILLISECOND);
			String reservDateTime = startY+"-"+(startM>9?startM:("0"+startM))+"-"+(startD>9?startD:("0"+startD))+" "
							   +(startHH>9?startHH:("0"+startHH))+":"+(startMM>9?startMM:("0"+startMM))+":00.000";
			
			int endY = alist.getReservVO().getReservEndTime().get(Calendar.YEAR);
			int endM = alist.getReservVO().getReservEndTime().get(Calendar.MONTH)+1;
			int endD = alist.getReservVO().getReservEndTime().get(Calendar.DATE);
			int endHH = alist.getReservVO().getReservEndTime().get(Calendar.HOUR_OF_DAY);
			int endMM = alist.getReservVO().getReservEndTime().get(Calendar.MINUTE);
			String reservEndTime = endY+"-"+(endM>9?endM:("0"+endM))+"-"+(endD>9?endD:("0"+endD))+" "
					   		   +(endHH>9?endHH:("0"+endHH))+":"+(endMM>9?endMM:("0"+endMM))+":00.000";
			
			
			
			stepList = stepService.getMoreServiceStepbyFK(servNo);
			List<Map> innerlist = new ArrayList<>();
			
			map.put("reservDateTime", reservDateTime);
			map.put("reservEndTime", reservEndTime);
			map.put("servNo", servNo);		//服務代號
			map.put("servName", servName);	//服務名
			map.put("servTime", servTime);
			map.put("servStep", innerlist);
			
			for(ServiceStepVO astep:stepList) {
				int step = astep.getServStep();
				String descp = astep.getStepDescp();
				Map stepMap = new LinkedHashMap<>();
				stepMap.put("step", step);
				stepMap.put("descp", descp);
				innerlist.add(stepMap);
				
			}
				list2.add(map);
		}
	
		//------------------------------------
		
//		for(ReservListVO alist : list){
//			Map map = new LinkedHashMap<>();
//			
//			int servNo = alist.getServicesVO().getServNo();
//			String servName = alist.getServName();
//			int servTime = alist.getServTime();
////			System.out.print("服務項目代號:"+ servNo+",");
////			System.out.print("項目名:"+ servName+",");
////			System.out.println("時間"+servTime);
//			map.put("servNo", servNo);
//			map.put("servName", servName);
//			map.put("servTime", servTime);
//			
//			
//			stepList = stepService.getMoreServiceStepbyFK(servNo);
//			
//			for(int i=0;i<stepList.size();i++){
//				
////				int servStep = stepList.get(i).getServStep();
//				String stepDescp = stepList.get(i).getStepDescp();
////				map.put("servStep"+i, servStep);
//				map.put("stepDescp_"+(i+1), stepDescp);
//				
//				
//			}
//			list2.add(map);
//		}
		return list2;
	}

}
