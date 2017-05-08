package com.progress;

import com.progress.ScheduleTask;

import java.util.Calendar;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ApplicationListener
 *
 */
@WebListener
public class ApplicationListener implements ServletContextListener {
	/**********伺服器啟動時呼叫排程任務ScheduleTask*************/
    public ApplicationListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	System.out.println("啟動囉");

    	Calendar reSetTime = Calendar.getInstance();
    	//隔天的半夜一點
    	reSetTime.add(Calendar.DATE, 1);
    	reSetTime.set(Calendar.HOUR, 1);
    	reSetTime.set(Calendar.MINUTE, 0);
    	reSetTime.set(Calendar.SECOND, 0);
    	reSetTime.set(Calendar.MILLISECOND, 0);
    	
    	Long reSetMillis = reSetTime.getTimeInMillis();
    	
    	Calendar now = Calendar.getInstance();
    	Long nowMillis = now.getTimeInMillis();
    	
    	
    	//這個是排程
    	ScheduleTask schedule = new ScheduleTask(sce.getServletContext());
    	//schedule.addTask(多久以後去做  , 間隔多久做一次)
    	schedule.addTask(reSetMillis-nowMillis, 1000*60*60*24);
    	
    	//這個是今天的
    	AutoSetTodayReservList s = new AutoSetTodayReservList();
		s.TodayReservListInit(sce.getServletContext());
		s.TodayReservListQuery(sce.getServletContext());
    	
    	
//若攝影機VideoServlet的ip從WEB-INF/properties/team03.properties讀取	    	
//    	Properties prop = new Properties(); 	
//    	try {
//			prop.load(sce.getServletContext().getResourceAsStream("/WEB-INF/properties/team03.properties"));
//			sce.getServletContext().setAttribute("prop", prop);
//    	} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
    }
}
