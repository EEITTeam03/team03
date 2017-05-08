package com.progress;

import java.util.Calendar;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
 
public class ScheduleTask {
	/*******排程任務呼叫AutoSetTodayReservList******/
	private ScheduledExecutorService scheduler;
	private ServletContext application;
	
	public ScheduleTask(ServletContext application) {
		scheduler = Executors.newSingleThreadScheduledExecutor();
		this.application = application;
	}
	
	public void addTask (long delay, long breakTime) {
		scheduler.scheduleWithFixedDelay(new Shot(), delay, breakTime, TimeUnit.MILLISECONDS);
	}
	
	private class Shot implements Runnable {
		public Shot() {}
	
		public void run(){
			AutoSetTodayReservList s = new AutoSetTodayReservList();
			s.TodayReservListInit(application);
			s.TodayReservListQuery(application);
		}
	}
}