package com.schedule.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Calendar;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.membercars.model.MemberCarsHibernateDAO;
import com.membercars.model.MemberCarsVO;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;

import myutil.SendEmail;

/**
 * Servlet implementation class Timer
 */
@WebServlet(value="/Timer.do", loadOnStartup=1)
public class TimerForSchedule extends HttpServlet {
	Timer timer ; 
//    int count = 0;        
    public void destroy(){
        timer.cancel();
    }
    
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
    }
            
    public void init(){        
        timer = new Timer();
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY,0);
		cal.set(Calendar.MINUTE,0);
        TimerTask task = new TimerTask(){
        ReservService rs = new ReservService();
        //List<Object>list = null;
            public void run(){
//                System.out.println("This is Task"+ count);
                System.out.println("工作排定的時間 = " + new Date(scheduledExecutionTime()));
                System.out.println("工作執行的時間 = " + new Date() + "\n");                
                Calendar calendar = Calendar.getInstance();
                calendar.add(Calendar.DATE, 1);
                List<ReservVO> list = rs.AllOrderByTime(calendar);
                MemberCarsHibernateDAO dao = new MemberCarsHibernateDAO();
                if(list!=null&&list.size()!=0){
                	for(ReservVO rv:list){
                		MemberCarsVO mcv= dao.findByPK(rv.getMembercarsVO().getCarLicense());
//                		mcv.getMemberInfoVO().getMemberName();
//                		mcv.getMemberInfoVO().getEmail();
//                		rv.getReservDateTime();
                		 new SendEmail().setProps(mcv.getMemberInfoVO().getEmail(), mcv.getMemberInfoVO().getMemberName(),rv.getReservDateTime());
                	}
                }

//                count++;
            }
        };
        timer.scheduleAtFixedRate(task, cal.getTime(), 60*60*1000*24); 
    }
}



