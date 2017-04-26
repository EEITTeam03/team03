package myutil;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class MyUtil {
	
	public static Date getSqlDate(String strDate,String splitSign){
		String[] strArray = strDate.split(splitSign);
		Calendar cal = 
		new GregorianCalendar(Integer.parseInt(strArray[0]),Integer.parseInt(strArray[1]),Integer.parseInt(strArray[2]));
		Long ms = cal.getTimeInMillis();
		Date sqlDate = new Date(ms);
		return sqlDate;
	}
}
