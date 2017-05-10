package com.progress;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import com.reservlist.model.ReservListService;
import com.reservlist.model.ReservListVO;
import com.servicestep.model.ServiceStepService;
import com.servicestep.model.ServiceStepVO;

public class ProgressTest {
	
	public List<Map> getProgressStep() {
		ReservListService reservList = new ReservListService();
		List<ReservListVO> list = reservList.findByReservNo(16);		//預約編號2的所有服務
		
		ServiceStepService stepService = new ServiceStepService();	//預約編號2所有服務的步驟
		List<ServiceStepVO> stepList;
		
		
		List<Map> list2 = new ArrayList<Map>();
		
		for(ReservListVO alist : list){
			Map map = new LinkedHashMap<>();
			
			int servNo = alist.getServicesVO().getServNo();
			String servName = alist.getServName();
			int servTime = alist.getServTime();
//			System.out.print("服務項目代號:"+ servNo+",");
//			System.out.print("項目名:"+ servName+",");
//			System.out.println("時間"+servTime);
			map.put("servNo", servNo);
			map.put("servName", servName);
			map.put("servTime", servTime);
			
			
			stepList = stepService.getMoreServiceStepbyFK(servNo);
			
//			for(ServiceStepVO blist : stepList){
//				int servStep = blist.getServStep();
//				String stepDescp = blist.getStepDescp();
//				System.out.print("步驟: "+ servStep+",");
//				System.out.println(stepDescp);
//				map.put("servStep", servStep);
//				map.put("stepDescp", stepDescp);
//				
//				list2.add(map);
//			}
			
			for(int i=0;i<stepList.size();i++){
				
//				int servStep = stepList.get(i).getServStep();
				String stepDescp = stepList.get(i).getStepDescp();
//				map.put("servStep"+i, servStep);
				map.put("stepDescp_"+(i+1), stepDescp);
				
				list2.add(map);
			}
			
		}
		return list2;
	}
	
	
	public static void main (String args[]){
		
		ProgressTest progressTest = new ProgressTest();
		List<Map> list = progressTest.getProgressStep();
		
		
		String jsonString = JSONValue.toJSONString(list);
		System.out.println(jsonString);
		
		
	}
}
