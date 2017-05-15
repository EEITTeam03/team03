package com.services.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.carclass.model.CarClassHibernateDAO;
import com.carclass.model.CarClassService;
import com.carclass.model.CarClassVO;
import com.cartype.model.CarTypeVO;
import com.servicecarclass.model.ServiceCarClassService;
import com.servicecarclass.model.ServiceCarClassVO;
import com.services.model.ServicesService;
import com.services.model.ServicesVO;
import com.servicestep.model.ServiceStepService;
import com.servicestep.model.ServiceStepVO;

@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
		* 1024 * 500 * 5)
@WebServlet("/services/services.do")
public class ServicesInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 文字資料轉內碼
		String action = request.getParameter("action");

		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> msgOK = new HashMap<String, String>();
		// 改成吳神版本
		if ("insert".equals(action)) {
			HttpSession session = request.getSession();
			request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
			session.setAttribute("MsgOK", msgOK); // 顯示正常訊息
			try {
				//新增服務的部分
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer servNo =null;
				try{
					servNo = Integer.valueOf(request.getParameter("servNo").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservNoEmpty", "服務編號欄必須輸入");
				}
				String servTypeNo = request.getParameter("servTypeNo").trim();
				String servName = request.getParameter("servName").trim();
				String servDesc = request.getParameter("servDesc").trim();
				byte[] servPhoto = null;
				Date servEffectiveDate = null;
				try {
					servEffectiveDate = Date.valueOf(request.getParameter("servEffectiveDate").trim());
				} catch (IllegalArgumentException e) {
					servEffectiveDate = new Date(System.currentTimeMillis());
					errorMsg.put("errorservEffectiveDate", "請選擇日期");
				}
				String servStatus = request.getParameter("servStatus").trim();
				String fileName = null;
				// long sizeInBytes = 0;
				InputStream is = null;
				
				Part parts = request.getPart("servPhoto");
				try {
					fileName = parts.getName();
					fileName = ServicesService.getFileName(parts);
					fileName = ServicesService.adjustFileName(fileName, ServicesService.IMAGE_FILENAME_LENGTH);
					if (fileName != null && fileName.trim().length() > 0) {
						is = parts.getInputStream();
						servPhoto = new byte[is.available()];
						is.read(servPhoto);
						is.close();
					}
				} catch (Exception e) {
					errorMsg.put("errPicture", "必須挑選圖片檔");
				}
				if (servTypeNo == null || servTypeNo.trim().length() == 0) {
					errorMsg.put("errorservTypeNoEmpty", "服務類型編號欄必須輸入");
				}
				if (servName == null || servName.trim().length() == 0) {
					errorMsg.put("errorservNameEmpty", "服務名稱欄必須輸入");
				}
				if (servDesc == null || servName.trim().length() == 0) {
					errorMsg.put("errorservDesc", "服務描述欄必須輸入");
				}
				
				if (servStatus == null || servStatus.trim().length() == 0) {
					errorMsg.put("errorservStatus", "服務狀態欄必須輸入");
				}
				//新增服務車級價格的部分
				Integer servPriceL=null;
				try{
					servPriceL =Integer.valueOf(request.getParameter("servPriceL").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservPriceLEmpty", "服務價格必須輸入");
				}
				Integer servPriceM=null;
				try{
					servPriceM =Integer.valueOf(request.getParameter("servPriceM").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservPriceMEmpty", "服務價格必須輸入");
				}
				Integer servPriceS=null;
				try{
					servPriceS =Integer.valueOf(request.getParameter("servPriceS").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservPriceSEmpty", "服務價格必須輸入");
				}
				Integer servPriceXL=null;
				try{
					servPriceXL =Integer.valueOf(request.getParameter("servPriceXL").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservPriceXLEmpty", "服務價格必須輸入");
				}
				Integer servPriceXXL=null;
				try{
					servPriceXXL =Integer.valueOf(request.getParameter("servPriceXXL").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservPriceXXLEmpty", "服務價格必須輸入");
				}
				//新增服務車級時間的部分
				Integer servTimeL =null;
				try{
					servTimeL=Integer.valueOf(request.getParameter("servTimeL").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservTimeLEmpty", "服務價格必須輸入");
				}
				Integer servTimeM =null;
				try{
					servTimeM=Integer.valueOf(request.getParameter("servTimeM").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservTimeMEmpty", "服務價格必須輸入");
				}
				Integer servTimeS =null;
				try{
					servTimeS=Integer.valueOf(request.getParameter("servTimeS").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservTimeSEmpty", "服務價格必須輸入");
				}
				Integer servTimeXL =null;
				try{
					servTimeXL=Integer.valueOf(request.getParameter("servTimeXL").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservTimeXLEmpty", "服務價格必須輸入");
				}
				Integer servTimeXXL =null;
				try{
					servTimeXXL=Integer.valueOf(request.getParameter("servTimeXXL").trim());
				}catch(IllegalArgumentException e){
					errorMsg.put("errorservTimeXXLEmpty", "服務價格必須輸入");
				}
				//新增服務車級的部分
				String carClassL = "L";
				String carClassM = "M";
				String carClassS = "S";
				String carClassXL = "XL";
				String carClassXXL = "XXL";
				
				//新增服務步驟的部分
//				Integer servStepOne=Integer.valueOf(request.getParameter("servStepOne"));
//				Integer servStepTwo=Integer.valueOf(request.getParameter("servStepTwo"));
//				Integer servStepThree=Integer.valueOf(request.getParameter("servStepThree"));
//				
//				String stepNameOne=request.getParameter("stepNameOne");
//				String stepNameTwo=request.getParameter("stepNameTwo");
//				String stepNameThree=request.getParameter("stepNameThree");
//				
//				String stepDescpOne=request.getParameter("stepDescpOne");
//				String stepDescpTwo=request.getParameter("stepDescpTwo");
//				String stepDescpThree=request.getParameter("stepDescpThree");
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				//新增服務的部分
				ServicesVO svo = new ServicesVO();
				svo.setServNo(servNo);
				svo.setServName(servName);
				svo.setServDesc(servDesc);
				svo.setServTypeNo(servTypeNo);
				svo.setServPhoto(servPhoto);
				svo.setServStatus(servStatus);
				svo.setServEffectiveDate(servEffectiveDate);
				
				//新增服務價格和時間(L)的部分
				ServiceCarClassVO sccvoL=new ServiceCarClassVO();
				CarClassService ccsL= new CarClassService();
				CarClassVO ccvoL=ccsL.findByPrimaryKey(carClassL);
				sccvoL.setServicesVO(svo);
				sccvoL.setServPrice(servPriceL);
				sccvoL.setCarClassVO(ccvoL);
				sccvoL.setServTime(servTimeL);
				//新增服務價格和時間(M)的部分
				ServiceCarClassVO sccvoM=new ServiceCarClassVO();
				CarClassService ccsM= new CarClassService();
				CarClassVO ccvoM=ccsM.findByPrimaryKey(carClassM);
				sccvoM.setServicesVO(svo);
				sccvoM.setServPrice(servPriceM);
				sccvoM.setCarClassVO(ccvoM);
				sccvoM.setServTime(servTimeM);
				//新增服務價格和時間(S)的部分
				ServiceCarClassVO sccvoS=new ServiceCarClassVO();
				CarClassService ccsS= new CarClassService();
				CarClassVO ccvoS=ccsS.findByPrimaryKey(carClassS);
				sccvoS.setServicesVO(svo);
				sccvoS.setServPrice(servPriceS);
				sccvoS.setCarClassVO(ccvoS);
				sccvoS.setServTime(servTimeS);
				//新增服務價格和時間(XL)的部分
				ServiceCarClassVO sccvoXL=new ServiceCarClassVO();
				CarClassService ccsXL= new CarClassService();
				CarClassVO ccvoXL=ccsXL.findByPrimaryKey(carClassXL);
				sccvoXL.setServicesVO(svo);
				sccvoXL.setServPrice(servPriceXL);
				sccvoXL.setCarClassVO(ccvoXL);
				sccvoXL.setServTime(servTimeXL);
				//新增服務價格和時間(XXL)的部分
				ServiceCarClassVO sccvoXXL=new ServiceCarClassVO();
				CarClassService ccsXXL= new CarClassService();
				CarClassVO ccvoXXL=ccsXXL.findByPrimaryKey(carClassXXL);
				sccvoXXL.setServicesVO(svo);
				sccvoXXL.setServPrice(servPriceXXL);
				sccvoXXL.setCarClassVO(ccvoXXL);
				sccvoXXL.setServTime(servTimeXXL);
				
				//新增服務步驟
//				ServiceStepVO ssvoOne=new ServiceStepVO();
//				ssvoOne.setServicesVO(svo);
//				ssvoOne.setServStep(servStepOne);
//				ssvoOne.setStepName(stepNameOne);
//				ssvoOne.setStepName(stepNameOne);
//				ServiceStepVO ssvoTwo=new ServiceStepVO();
//				ssvoTwo.setServicesVO(svo);
//				ssvoTwo.setServStep(servStepTwo);
//				ssvoTwo.setStepName(stepNameTwo);
//				ssvoOne.setStepName(stepNameTwo);
//				ServiceStepVO ssvoThree=new ServiceStepVO();
//				ssvoThree.setServicesVO(svo);
//				ssvoThree.setServStep(servStepThree);
//				ssvoThree.setStepName(stepNameThree);
//				ssvoOne.setStepName(stepNameThree);
				
				if (!errorMsg.isEmpty()) {
					request.setAttribute("servicesVO", svo);
					request.setAttribute("serviceCarClassVOL",sccvoL);
					request.setAttribute("serviceCarClassVOM",sccvoM);
					request.setAttribute("serviceCarClassVOS",sccvoS);
					request.setAttribute("serviceCarClassVOXL",sccvoXL);
					request.setAttribute("serviceCarClassVOXXL",sccvoXXL);
//					request.setAttribute("servStepVOOne", ssvoOne);
//					request.setAttribute("servStepVOTwo", ssvoTwo);
//					request.setAttribute("servStepVOThree", ssvoThree);
					String url = "ServicesInsert.jsp";
					RequestDispatcher failerView = request.getRequestDispatcher(url);
					failerView.forward(request, response);
					return;//程式中斷
				}
				/***************************2.開始查詢資料*****************************************/
				//服務的部分
				ServicesService ss = new ServicesService();
				svo = ss.newAddService(servNo, servTypeNo, servName, servDesc, servPhoto, servEffectiveDate,
						servStatus);
				//服務價格的部分
				ServiceCarClassService sccsL=new ServiceCarClassService();
				ServiceCarClassService sccsM=new ServiceCarClassService();
				ServiceCarClassService sccsS=new ServiceCarClassService();
				ServiceCarClassService sccsXL=new ServiceCarClassService();
				ServiceCarClassService sccsXXL=new ServiceCarClassService();
				sccvoL=sccsL.addServiceCarClassAndCarClass(svo, ccvoL, servPriceL, servTimeL);		
				sccvoM=sccsM.addServiceCarClassAndCarClass(svo, ccvoM, servPriceM, servTimeM);		
				sccvoS=sccsS.addServiceCarClassAndCarClass(svo, ccvoS, servPriceS, servTimeS);		
				sccvoXL=sccsXL.addServiceCarClassAndCarClass(svo, ccvoXL, servPriceXL, servTimeXL);		
				sccvoXXL=sccsXXL.addServiceCarClassAndCarClass(svo, ccvoXXL, servPriceXXL, servTimeXXL);
				
				//服務步驟的部分
//				ServiceStepService sssOne=new ServiceStepService();
//				ServiceStepService sssTwo=new ServiceStepService();
//				ServiceStepService sssThree=new ServiceStepService();
//				ssvoOne=sssOne.addServiceStepForInsert(svo, servStepOne, stepNameOne, stepDescpOne);
//				ssvoTwo=sssTwo.addServiceStepForInsert(svo, servStepOne, stepNameOne, stepDescpOne);
//				ssvoThree=sssThree.addServiceStepForInsert(svo, servStepOne, stepNameOne, stepDescpOne);
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "SelectServicesForInsert.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);

			} catch (Exception e) {
				String url = "ServicesInsert.jsp";
				RequestDispatcher failerView = request.getRequestDispatcher(url);
				failerView.forward(request, response);
				System.out.println("錯惹");
			}

		}

		if ("getOne_For_Display".equals(action)) {
			try {
				String str = request.getParameter("servNo");
				Integer servNo = null;
				servNo = new Integer(str);
				ServicesService ssForDisplay = new ServicesService();
				ServicesVO svoForDisplay = ssForDisplay.getOneService(servNo);
				if (svoForDisplay == null) {
					errorMsg.put("errorservNo", "查無資料");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher fauilerView = request.getRequestDispatcher("SelectServices.jsp");
					fauilerView.forward(request, response);
					return;
				}
				request.setAttribute("servicesVO", svoForDisplay);
				if (svoForDisplay.getServStatus() == "1") {
					String url = "ListOneServicesForUser.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
				} else {
					String url = "ListOneServices.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
				}

			} catch (Exception e) {
				errorMsg.put("errorInfo", "無法取得資料");
				RequestDispatcher fauilerView = request.getRequestDispatcher("SelectServices.jsp");
				fauilerView.forward(request, response);
			}

		}
		if ("getOne_For_Update".equals(action)) {
			try {
				String Path = request.getServletPath();
				request.setAttribute("xx", Path);
				Integer servNo = new Integer(request.getParameter("servNo"));
				ServicesService ss = new ServicesService();
				ServicesVO servicesVO = ss.getOneService(servNo);
				request.setAttribute("servicesVO", servicesVO);
				String url = "/services/UpdateService.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = request.getRequestDispatcher("/services/UpdateService.jsp");
				failureView.forward(request, response);
			}
		}
		if ("update".equals(action)) {
			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				Integer servNo = new Integer(request.getParameter("servNo"));
				String servTypeNo = request.getParameter("servTypeNo");
				String servName = request.getParameter("servName");
				String servDesc = request.getParameter("servDesc");
				Date servEffectiveDate = Date.valueOf(request.getParameter("servEffectiveDate"));
				String servStatus = request.getParameter("servStatus");
				byte[] servPhoto = null;
				String fileName = "";

				long sizeInBytes = 0;
				InputStream is = null;
				Collection<Part> parts = request.getParts();
				ServicesService.exploreParts(parts, request);
				try {
					for (Part p : parts) {
						// String fldName = p.getName();
						// String value = request.getParameter(fldName);
						if (p.getContentType() != null) {
							fileName = ServicesService.getFileName(p); // 此為圖片檔的檔名
							fileName = ServicesService.adjustFileName(fileName, ServicesService.IMAGE_FILENAME_LENGTH);
							if (fileName != null && fileName.trim().length() > 0) {
								sizeInBytes = p.getSize();
								is = p.getInputStream();
								servPhoto = new byte[is.available()];
								is.read(servPhoto);
								is.close();
								System.out.println("已上傳圖片");
							} else {
								errorMsg.put("errPicture", "必須挑選圖片檔");
							}
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("出錯啦!");
				}
				ServicesVO servicesVO = new ServicesVO();
				servicesVO.setServNo(servNo);
				servicesVO.setServEffectiveDate(servEffectiveDate);
				servicesVO.setServName(servName);
				servicesVO.setServDesc(servDesc);
				servicesVO.setServPhoto(servPhoto);
				servicesVO.setServStatus(servStatus);
				servicesVO.setServTypeNo(servTypeNo);
				if (!errorMsg.isEmpty()) {
					request.setAttribute("servicesVO", servicesVO); // 含有輸入格式錯誤的ServicesVOO物件,也存入request
					RequestDispatcher failureView = request.getRequestDispatcher("/services/UpdateService.jsp");
					failureView.forward(request, response);
					return; // 程式中斷
				}
				/*************************** 2.開始修改資料 *****************************************/
				ServicesService ss = new ServicesService();
				servicesVO = ss.updateService(servNo, servTypeNo, servName, servDesc, servPhoto, servEffectiveDate,
						servStatus);
				/***************************
				 * 3.修改完成,準備轉交(Send the Success view)
				 *************/
				request.setAttribute("servicesVO", servicesVO);
				String url = "ListAllServices.jsp";
				String url1 = "ListOneServicesForUser.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url1);
				successView.forward(request, response);
				// response.sendRedirect(url1);
			} catch (Exception e) {
				e.printStackTrace();
				errorMsg.put("errorservPhoto", "修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/services/UpdateService.jsp");
				failureView.forward(request, response);
			}
		}
		if ("offshelf".equals(action)) {
			try {
				/***************************
				 * 1.接收請求參數
				 **********************/
				Integer servNo = new Integer(request.getParameter("servNo"));
				ServicesService ss = new ServicesService();
				ServicesVO servicesVO = ss.getOneService(servNo);
				String servTypeNo = servicesVO.getServTypeNo();
				String servName = servicesVO.getServName();
				String servDesc = servicesVO.getServDesc();
				Date servEffectiveDate = servicesVO.getServEffectiveDate();
				String servStatus = "0";
				byte[] servPhoto = servicesVO.getServPhoto();
				if (!errorMsg.isEmpty()) {
					request.setAttribute("servicesVO", servicesVO); // 含有輸入格式錯誤的ServicesVOO物件,也存入request
					String url = "ListAllServices.jsp";
					RequestDispatcher failureView = request.getRequestDispatcher(url);
					failureView.forward(request, response);
					return; // 程式中斷
				}
				/*************************** 2.開始修改資料 *****************************************/
				servicesVO = ss.updateService(servNo, servTypeNo, servName, servDesc, servPhoto, servEffectiveDate,
						servStatus);
				/***************************
				 * 3.修改完成,準備轉交(Send the Success view)
				 *************/
				request.setAttribute("servicesVO", servicesVO);
				String url = "ListAllServices.jsp";
				String url1 = "ListOneServices.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				errorMsg.put("errorservPhoto", "修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/services/UpdateService.jsp");
				failureView.forward(request, response);
			}
		}
	}
}
