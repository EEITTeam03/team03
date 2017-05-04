package com.schedule.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Timer
 */
@WebServlet(value="/Timer", loadOnStartup=1)
public class TimerForSchedule extends HttpServlet {
	Timer timer ; 
    int count = 0;        
    public void destroy(){
        timer.cancel();
    }
    
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
    }
            
    public void init(){        
//        timer = new Timer();
//        Calendar cal = new GregorianCalendar(2011, Calendar.MARCH, 5, 0, 0, 0);        
//        TimerTask task = new TimerTask(){
//                   
//            public void run(){
//                System.out.println("This is Task"+ count);
//                System.out.println("工作排定的時間 = " + new Date(scheduledExecutionTime()));
//                System.out.println("工作執行的時間 = " + new Date() + "\n");                
//                count++;
//            }
//        };
//        timer.scheduleAtFixedRate(task, cal.getTime(), 60*60*1000); 
    }
}



