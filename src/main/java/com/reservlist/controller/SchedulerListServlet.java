package com.reservlist.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.membercars.model.MemberCarsVO;
import com.membercars.model.MembercarsService;
import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;

import myutil.MyUtil;

@WebServlet("/admin/SchedulerListServlet")
public class SchedulerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setHeader("content-type", "text/html;charset=UTF-8");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		String action = req.getParameter("action");
		System.out.println("!!!!!!!!!"+action);
		
				
		if ("searchDate".equals(action)) {
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			req.setAttribute("ErrorMsgKey", errorMsgMap);
			
			try {
				/***************************1.接收請求參數**********************/
				String searchDate = req.getParameter("searchDate");
				String searchView = req.getParameter("searchView");
				Calendar cal =  MyUtil.getCalender(searchDate);
				System.out.println("!!!!!!!!!searchDate: "+searchDate);
				System.out.println("!!!!!!!!!searchView: "+searchView);
				
				/***************************2.開始查詢資料***************************************/
				ReservService rs = new ReservService();
				List<ReservVO> reservVO = rs.getAllReservByDate(cal);
				
				
				
				/***************************3.查詢完成,準備轉交(Send the Success view)***********/
				req.setAttribute("rservOuterList", reservVO);
				String url = "/admin/schedulerList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "無法取得要修改的資料:");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/admin/scheduler.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("searchALL".equals(action)) {
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			req.setAttribute("ErrorMsgKey", errorMsgMap);
			
			try {
				/***************************1.接收請求參數**********************/
//				String searchDate = req.getParameter("searchDate");
//				String searchView = req.getParameter("searchView");
//				Calendar cal =  MyUtil.getCalender(searchDate);
//				System.out.println("!!!!!!!!!searchDate: "+searchDate);
//				System.out.println("!!!!!!!!!searchView: "+searchView);
				
				/***************************2.開始查詢資料***************************************/
				ReservService rs = new ReservService();
				List<ReservVO> reservVO = rs.getAll();
				
				
				
				/***************************3.查詢完成,準備轉交(Send the Success view)***********/
				req.setAttribute("rservOuterList", reservVO);
				String url = "/admin/schedulerList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "無法取得要修改的資料:");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/admin/scheduler.jsp");
				failureView.forward(req, res);
			}
		}
//		if ("delete".equals(action)) {
//			Map<String, String> errorMsgMap = new HashMap<String, String>();
//			req.setAttribute("ErrorMsgKey", errorMsgMap);
//			
//			try {
//				/***************************1.接收請求參數**********************/
//				Integer memberNo = new Integer(req.getParameter("memberNo"));
////				String carLicense = req.getParameter("carLicense");
//				
//				/***************************2.開始刪除資料***************************************/
//				MemberService memberSvc = new MemberService();
//				memberSvc.deleteMem(memberNo);
//				
//				/***************************3.查詢完成,準備轉交(Send the Success view)***********/
//				
//				String url = "MemberUpdate.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);				
//				
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgMap.put(e.getMessage(), "刪除資料失敗:");
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("MemberUpdate.jsp");
//				failureView.forward(req, res);
//			}
//		}
	}

}
