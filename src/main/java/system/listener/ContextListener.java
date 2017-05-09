package system.listener;

import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.progress.AutoSetTodayReservList;
import com.progress.ScheduleTask;


@WebListener
public class ContextListener implements ServletContextListener {


    public ContextListener() {
        
    }


    public void contextDestroyed(ServletContextEvent arg0)  { 
    	System.out.println("=======ServletContextListener destroyed======");
    }


    public void contextInitialized(ServletContextEvent event)  { 
    	System.out.println("=======ServletContextListener started======");
    	ServletContext ctx = event.getServletContext();
    	String ctxPath = ctx.getContextPath();
    	ctx.setAttribute("ctx", ctxPath);
    	System.out.println("當前ctx: "+ ctxPath);
    	
    	
    	/**********塞入今日預約名單(for VideoServlet)----------------開始*************/
    	/**********ApplicationListener伺服器啟動時呼叫排程任務ScheduleTask*************/
    	Calendar reSetTime = Calendar.getInstance();
    	//隔天的半夜一點
    	reSetTime.add(Calendar.DATE, 1);
    	reSetTime.set(Calendar.HOUR_OF_DAY, 1);
    	reSetTime.set(Calendar.MINUTE, 0);
    	reSetTime.set(Calendar.SECOND, 0);
    	reSetTime.set(Calendar.MILLISECOND, 0);
    	Long reSetMillis = reSetTime.getTimeInMillis();
    	
    	Calendar now = Calendar.getInstance();
    	Long nowMillis = now.getTimeInMillis();
    	
    	
    	//這個是排程
    	ScheduleTask schedule = new ScheduleTask(event.getServletContext());
    	//schedule.addTask(多久以後去做  , 間隔多久做一次)
    	schedule.addTask(reSetMillis-nowMillis, 1000*60*60*24);
    	//schedule.addTask(1000, 10000);//測試用
    	
    	//這個是今天的
    	AutoSetTodayReservList s = new AutoSetTodayReservList();
		s.TodayReservListInit(event.getServletContext());
		s.TodayReservListQuery(event.getServletContext());
    	
    	
		//若攝影機VideoServlet的ip從WEB-INF/properties/team03.properties讀取	    	
//    	Properties prop = new Properties(); 	
//    	try {
//			prop.load(event.getServletContext().getResourceAsStream("/WEB-INF/properties/team03.properties"));
//			event.getServletContext().setAttribute("prop", prop);
//    	} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		/**********塞入今日預約名單(for VideoServlet)----------------結束*************/
		
		
    }
	
}
