package com.blocklist.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blocklist.model.BlockListService;
import com.blocklist.model.BlockListVO;
import com.blockrule.model.BlockRuleService;
import com.blockrule.model.BlockRuleVO;
import com.membercars.model.MemberCarsVO;
import com.membercars.model.MembercarsService;
import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;
import com.schedule.model.ReservService;
import com.schedule.model.ReservVO;

import myutil.MyUtil;

/**
 * Servlet implementation class Cancel
 */
@WebServlet("/Cancel")
public class Cancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cancel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		if("cancel".equals(action)){
			Map<String, String> errorMsgMap = new HashMap<String, String>();
			request.setAttribute("ErrorMsgKey", errorMsgMap);
			try{
				//String license = request.getParameter("license");
				String reservationNo = request.getParameter("reservNo");
				String blockRuleNo = "1";
				
				Calendar violationDate = Calendar.getInstance();
				//DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				String vDate = MyUtil.formatCalender(violationDate);
				
				ReservService resvc = new ReservService();
				ReservVO vo = resvc.getOneReserv(Integer.valueOf(reservationNo));
				String license = vo.getMembercarsVO().getCarLicense();
//				if(license==null|| license.length()==0){
//					errorMsgMap.put("LicenseError", "請輸入車牌");
//				}
//				if(blockRuleNo==null|| blockRuleNo.length()==0){
//					errorMsgMap.put("BlockRuleNoError", "請輸入違規規則");
//				}
//				if(violationDate==null|| violationDate.length()==0){
//					errorMsgMap.put("ViolationDateError", "請輸入違規日期");
//				}
//				if(reservationNo==null|| reservationNo.length()==0){
//					errorMsgMap.put("ReservationNoError", "請輸入預約編號");
//				}
//				
//				if (!errorMsgMap.isEmpty()) {
//					RequestDispatcher failureView = request
//							.getRequestDispatcher("maintainBlockList.jsp");
//					failureView.forward(request, response);
//					return;
//				}
				
				MembercarsService ms = new MembercarsService();
				MemberCarsVO mc = ms.getOneByPK(license);
				MemberInfoVO miv = null;
				BlockListVO blv = new BlockListVO();
				if(mc!=null){
					miv = mc.getMemberInfoVO();
					blv.setMemberInfoVO(miv);
				}else{
					errorMsgMap.put("LicenseError", "沒有這個車牌號碼");

				}
					Short RuleNo = Short.valueOf(blockRuleNo);
					BlockRuleService BRS = new BlockRuleService();
					BlockRuleVO brv= BRS.getOneByPK(RuleNo);
					blv.setBlockRuleVO(BRS.getOneByPK(RuleNo));
					blv.setViolationDate(vDate);
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
								.getRequestDispatcher("/orderStatus.jsp");
						failureView.forward(request, response);
						return;
					}
					BlockListService bls = new BlockListService();
					bls.addBlockList(vDate, reservNo, "", brv, miv);
					
					//HttpSession session = request.getSession();
					
					if((bls.countBlockListVO(miv)%3)==0){
//						java.util.Date date = DateFormat.getDateInstance().parse(violationDate);
						java.util.Calendar calendar = Calendar.getInstance();
						calendar.add(Calendar.MONTH,3);
						//java.sql.Date sqlDate= (java.sql.Date)calendar.getInstance().getTime();
						java.sql.Date sqlDate = new java.sql.Date(calendar.getTimeInMillis());
						MemberService msvc = new MemberService();
						MemberInfoVO mvo = msvc.updateMem(miv.getMemberNo(), miv.getMemberName(), miv.getEmail(), miv.getPassword(), miv.getPhone(), miv.getBirthday(), miv.getAddress(), sqlDate);
						request.getSession().setAttribute("memberInfo", mvo);
					};
					//更新預約狀態(0)
					ReservService rsvc = new ReservService();
					ReservVO rVO = rsvc.getOneReserv(reservNo);
					rVO.setStatus(0);
					rsvc.updateReserv(rVO.getReservNo(), rVO.getReservDateTime(), rVO.getNoteC(), rVO.getNotesE(), rVO.getStatus(), rVO.getMembercarsVO(), rVO.getEmployeeVO(), rVO.getReservlists());
					
//					request.getSession().setAttribute("OKalert","updateOK");
					String url = "/orderStatus.jsp";
					response.sendRedirect(getServletContext().getContextPath()+url);
					
			}catch (Exception e) {
				errorMsgMap.put(e.getMessage(), "其他錯誤");
				RequestDispatcher failureView = request
						.getRequestDispatcher("/orderStatus.jsp");
				failureView.forward(request, response);
			}
		}
		
	
				
				
				
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
