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
			
			
			stepList = stepService.getMoreServiceStepbyFK(servNo);
			List<Map> innerlist = new ArrayList<>();
			
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
//			for(int j=0;j<stepList.size();j++){
//				
//				int servStep = stepList.get(j).getServStep();
//				String stepDescp = stepList.get(j).getStepDescp();
//				map.put("servNo", servNo);		//服務代號
//				map.put("servName", servName);	//服務名
//				map.put("servTime", servTime);
//				map.put("servStep", servStep);
//				map.put("stepDescp", stepDescp);
				list2.add(map);
//					
//			}
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
