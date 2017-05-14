package com.progress;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;

import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;

import myutil.MyUtil;

public class AutoSetTodayReservList {
	/*********系統排程自動讀入當天所有被預約時段及會員編號***********/
	//半夜12點的時候去跑
	public void TodayReservListInit(ServletContext application){
		
		for(int i=0;i<=23;i++){
//		for(int i=9;i<=20;i++){	//營業時間
			List<String> list1 = new ArrayList<String>();
			List<String> list2 = new ArrayList<String>();
			//洗掉昨天的 重製今天的
			application.removeAttribute((i>9?i:("0"+i))+"00");
			application.setAttribute((i>9?i:("0"+i))+"00", list1);
			application.removeAttribute((i>9?i:("0"+i))+"30");
			application.setAttribute((i>9?i:("0"+i))+"30", list2);
			
		}
		
		//MemberID
//		application.setAttribute("0900", "10");
//		application.setAttribute("0930", "10");
//		//......
//		//......
//		//......
//		application.setAttribute("2030", "9");
	}
	
	public void TodayReservListQuery(ServletContext application){
		//dao 讀取今天的排程 將今天排程寫到 application
		
		ReservService rsvc = new ReservService();
		Calendar cal = Calendar.getInstance();
		List<ReservVO> list = rsvc.getAllReservByDate(cal);
		
		System.out.println("今日已預約時段(單位:半小時)");
		for(ReservVO rsv : list){
			//每次加30分鐘
			for(Calendar sTime= rsv.getReservDateTime();MyUtil.getHHmmFormat(rsv.getReservEndTime()).compareTo(MyUtil.getHHmmFormat(sTime))>0;sTime.add(Calendar.MINUTE,30)){
				String memberNo = ""+rsv.getMembercarsVO().getMemberInfoVO().getMemberNo();
				TodayReservListInsert(application,MyUtil.getHHmmFormat(sTime),memberNo);
				
				System.out.print("時段及會員編號: "+MyUtil.getHHmmFormat(sTime)+",");
				System.out.println(memberNo);
			}
		}
		
		
		//假設今天預約9點~10點 洗車 會員編號是10號
		//這個是假的
//		TodayReservListInsert(application,"1330","10");
//		TodayReservListInsert(application,"1400","8");
		
	}
	
	//更新使用 當今天有人又預約今天時間的情況
	//新增預約時 請加做
	public void TodayReservListInsert(ServletContext application,String time,String member){
		List<String> list = (List<String>)application.getAttribute(time);
		if(null != list)
			list.add(member);
	}
	
	//取消預約時 請加做
	public void TodayReservListDelete(ServletContext application,String time,String member){
		List<String> list = (List<String>)application.getAttribute(time);
		if(null != list)
			list.remove(member);
	}

}
