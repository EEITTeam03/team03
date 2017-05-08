package com.blocklist.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blocklist.model.BlockListService;
import com.blocklist.model.BlockListVO;
import com.blockrule.model.BlockRuleService;
import com.blockrule.model.BlockRuleVO;
import com.membercars.model.MemberCarsVO;
import com.membercars.model.MembercarsService;
import com.memberinfo.model.MemberInfoVO;
import com.schedule.model.ReservService;

/**
 * Servlet implementation class maintain
 */
@WebServlet("/admin/maintain.do")
public class maintain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public maintain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		if("insert".equals(action)){
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			request.setAttribute("ErrorMsgKey", errorMsgMap);
			try{
				String license = request.getParameter("license");
				String blockRuleNo = request.getParameter("blockRuleNo");
				String violationDate = request.getParameter("violationDate");
				String reservationNo = request.getParameter("reservationNo");
				
				if(license==null|| license.length()==0){
					errorMsgMap.put("LicenseError", "請輸入車牌");
				}
				if(blockRuleNo==null|| blockRuleNo.length()==0){
					errorMsgMap.put("BlockRuleNoError", "請輸入違規規則");
				}
				if(violationDate==null|| violationDate.length()==0){
					errorMsgMap.put("ViolationDateError", "請輸入違規日期");
				}
				if(reservationNo==null|| reservationNo.length()==0){
					errorMsgMap.put("ReservationNoError", "請輸入預約編號");
				}
				
				if (!errorMsgMap.isEmpty()) {
					RequestDispatcher failureView = request
							.getRequestDispatcher("maintainBlockList.jsp");
					failureView.forward(request, response);
					return;
				}
				
				MembercarsService ms = new MembercarsService();
				MemberCarsVO mc = ms.getOneByPK(license);
				MemberInfoVO miv = null;
				BlockListVO blv = new BlockListVO();
				if(mc!=null){
					miv = mc.getMemberInfoVO();
					blv.setMemberInfoVO(miv);
				}else{
					errorMsgMap.put("LicenseError", "沒有這個車牌號碼");
//					RequestDispatcher failureView = request
//							.getRequestDispatcher("maintainBlockList.jsp");
//					failureView.forward(request, response);
//					return;
				}
					Short RuleNo = Short.valueOf(blockRuleNo);
					BlockRuleService BRS = new BlockRuleService();
					BlockRuleVO brv= BRS.getOneByPK(RuleNo);
					blv.setBlockRuleVO(BRS.getOneByPK(RuleNo));
					blv.setViolationDate(violationDate);
					blv.setBlockState("");
					
					ReservService rs= new ReservService();
					Integer reservNo=null;
					try {
						reservNo = Integer.valueOf(reservationNo);
						if(rs.getOneReserv(reservNo)!=null)
							blv.setReservationNo(reservNo);
						else 
							errorMsgMap.put("ReservationNoError", "查不到此編號");
					} catch (IllegalArgumentException e) {
						errorMsgMap.put("ReservationNoError", "編號錯誤");
					}
					if (!errorMsgMap.isEmpty()) {
						RequestDispatcher failureView = request
								.getRequestDispatcher("maintainBlockList.jsp");
						failureView.forward(request, response);
						return;
					}
					BlockListService bls = new BlockListService();
					bls.addBlockList(violationDate, reservNo, "", brv, miv);
					
					HttpSession session = request.getSession();
					
					if(bls.countBlockListVO(miv) >= 3){
						
						
					};
					
					String url = "/listAllBlockList.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllBlockList.jsp
					successView.forward(request, response);
				
				
			}catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "其他錯誤");
				RequestDispatcher failureView = request
						.getRequestDispatcher("maintainBlockList.jsp");
				failureView.forward(request, response);
			}
		}
		
	}

}
