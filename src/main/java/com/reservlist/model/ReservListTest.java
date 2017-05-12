package com.reservlist.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import com.membercars.model.MemberCarsVO;
import com.membercars.model.MembercarsService;
import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;
import com.reservlist.model.ReservListService;
import com.reservlist.model.ReservListVO;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;
import com.servicestep.model.ServiceStepService;
import com.servicestep.model.ServiceStepVO;

public class ReservListTest {
	
	public Map getReservListForJSON() {
		
		Map mapOuter = new LinkedHashMap<>();
		
		MembercarsService mcs = new MembercarsService();
		List<MemberCarsVO> carList = mcs.getListByMember(11);
		
		List<Map> list2 = new ArrayList<Map>();
		
		for(MemberCarsVO cList : carList){
			
			String license = cList.getCarLicense();
			System.out.println(license);
			
			ReservService rs = new ReservService();
			List<ReservVO> rslist = rs.fingReservNoByLicense(license);
			for(ReservVO rList : rslist){
				Map map = new LinkedHashMap<>();
				
				Integer reservNo = rList.getReservNo();
				System.out.println(reservNo);
				System.out.println(rList.getMembercarsVO().getMemberInfoVO().getMemberName());
				int startY = rList.getReservDateTime().get(Calendar.YEAR);
				int startM = rList.getReservDateTime().get(Calendar.MONTH)+1;
				int startD = rList.getReservDateTime().get(Calendar.DATE);
				int startHH = rList.getReservDateTime().get(Calendar.HOUR_OF_DAY);
				int startMM = rList.getReservDateTime().get(Calendar.MINUTE);
				String reservDateTime = startY+"-"+(startM>9?startM:("0"+startM))+"-"+(startD>9?startD:("0"+startD))+" "
								   +(startHH>9?startHH:("0"+startHH))+":"+(startMM>9?startMM:("0"+startMM))+":00.000";
				
				int endY = rList.getReservEndTime().get(Calendar.YEAR);
				int endM = rList.getReservEndTime().get(Calendar.MONTH)+1;
				int endD = rList.getReservEndTime().get(Calendar.DATE);
				int endHH = rList.getReservEndTime().get(Calendar.HOUR_OF_DAY);
				int endMM = rList.getReservEndTime().get(Calendar.MINUTE);
				String reservEndTime = endY+"-"+(endM>9?endM:("0"+endM))+"-"+(endD>9?endD:("0"+endD))+" "
						   		   +(endHH>9?endHH:("0"+endHH))+":"+(endMM>9?endMM:("0"+endMM))+":00.000";
				
				
				String brand = rList.getMembercarsVO().getCarTypeVO().getBrand();
				String carModel = rList.getMembercarsVO().getCarTypeVO().getCarModel();
				String employeeName = rList.getEmployeeVO().getEmployeeName();
				
				List<Map> innerlist = new ArrayList<>();
				map.put("reservNo", ""+reservNo);
				map.put("reservDateTime", reservDateTime);
				map.put("reservEndTime", reservEndTime);		//服務代號
				map.put("brand", brand);	//服務名
				map.put("carModel", carModel);
				map.put("employeeName", employeeName);
				map.put("reserv_list", innerlist);
				
				ReservListService svc = new ReservListService();
				List<ReservListVO> servDetail = svc.findByReservNo(reservNo);
				for(ReservListVO aList : servDetail){
					Map servDetailMap = new LinkedHashMap<>();
					Integer servNo = aList.getServicesVO().getServNo();
					Integer servPrice = aList.getServPrice();
					Integer servTime = aList.getServTime();
					String servName = aList.getServName();
					
					servDetailMap.put("servNo", ""+servNo);
					servDetailMap.put("servPrice", ""+servPrice);
					servDetailMap.put("servTime", ""+servTime);
					servDetailMap.put("servName", servName);
					innerlist.add(servDetailMap);
					
				}
			list2.add(map);
			mapOuter.put("list", list2);
			}
		}
		return mapOuter;
	}
	
	
	public static void main (String args[]){
		
		ReservListTest rsTest = new ReservListTest();
		Map mapOuter = new LinkedHashMap<>();
		mapOuter = rsTest.getReservListForJSON();
		
		String jsonString = JSONValue.toJSONString(mapOuter);
		System.out.println(jsonString);
		
		
	}
}
