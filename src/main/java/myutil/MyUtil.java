package myutil;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;

public class MyUtil {
	
	public static Date getSqlDate(String strDate,String splitSign){
		String[] strArray = strDate.split(splitSign);
		Calendar cal = 
		new GregorianCalendar(Integer.parseInt(strArray[0]),Integer.parseInt(strArray[1])-1,Integer.parseInt(strArray[2]));
		Long ms = cal.getTimeInMillis();
		Date sqlDate = new Date(ms);
		return sqlDate;
	}
	
	public static Calendar getCalender(String strDate) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			cal.setTime(sdf.parse(strDate));
		} catch (ParseException e) {
			throw new RuntimeException("日期格式錯誤!");
		}
		return cal;
	}
	
	
	public static Calendar getCalender(String strDate , String strTime) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			cal.setTime(sdf.parse(strDate+" "+strTime));
		} catch (ParseException e) {
			throw new RuntimeException("日期或時間格式錯誤!");
		}
		return cal;
	}
	
	public static String formatCalender(Calendar calDate) {
		String calToString;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			calToString = (sdf.format(calDate.getTime()));
		} catch (Exception e) {
			throw new RuntimeException("日期格式錯誤!");
		}
		return calToString;
	}
	
	/*scheduler for admin*/
	public static Calendar getLocalTimeFromGMT(String timeGMT){
		  TimeZone gmt = TimeZone.getTimeZone("GMT");
		  SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		  f.setTimeZone(gmt);
		  Calendar cal = Calendar.getInstance();
		  
		  try {
		   cal.setTime(f.parse(timeGMT));
		  } catch (ParseException e) {
		   //日期格式錯誤無法轉換
		   e.printStackTrace();
		  }
		  
		  return cal;
	}
	public static Calendar getLocalTimeFromUTC(String timeUTC){
		  TimeZone utc = TimeZone.getTimeZone("UTC");
		  SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		  f.setTimeZone(utc);
		  Calendar cal = Calendar.getInstance();
		  
		  try {
		   cal.setTime(f.parse(timeUTC));
		  } catch (ParseException e) {
		   //日期格式錯誤無法轉換
		   e.printStackTrace();
		  }
		  
		  return cal;
	}
	
	public static Calendar getCalenderDH(String strDate) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		try {
			cal.setTime(sdf.parse(strDate));
		} catch (ParseException e) {
			throw new RuntimeException("日期或時間格式錯誤!");
		}
		return cal;
	}
	
	/*系統排程for TodayReservList*/
/*	public static String getNowTimeFormat(){
		Calendar now = Calendar.getInstance();
		int hr = now.get(Calendar.HOUR_OF_DAY);
		int min = now.get(Calendar.MINUTE);
		
//		if(min>30){
//			min = 30;
//		}else{
//			min = 0;
//		}
		min = min>30?30:0;
		
		return (hr>9?(""+hr):("0"+hr))+(min>9?(""+min):("0"+min));
	}*/
	/*系統排程for TodayReservList*/
	public static String getNowTimeFormat(){
		Calendar now = Calendar.getInstance();
		  
		return getHHmmFormat(now);
	}
	/*系統排程for TodayReservList*/ 
	public static String getHHmmFormat(Calendar time){
		int hr = time.get(Calendar.HOUR_OF_DAY);
		int min = time.get(Calendar.MINUTE);
		
		min = min>=30?30:0;
		  
		return (hr>9?(""+hr):("0"+hr))+(min>9?(""+min):("0"+min));
	}
}
