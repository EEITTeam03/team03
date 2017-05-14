package com.services.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.services.model.ServicesService;
import com.services.model.ServicesVO;

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

		// if ("insert".equals(action)) {
		// HttpSession session = request.getSession();
		//
		// request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
		// session.setAttribute("MsgOK", msgOK); // 顯示正常訊息
		// Integer servNo = 0;
		// String servTypeNo = "";
		// String servName = "";
		// String servDesc = "";
		// byte[] servPhoto = null;
		// Date servEffectiveDate = null;
		// String servStatus = "";
		// String fileName = "";
		// long sizeInBytes = 0;
		// InputStream is = null;
		// Collection<Part> parts = request.getParts(); // 取出HTTP multipart
		// // request內所有的parts
		// ServicesService.exploreParts(parts, request);
		// // 由parts != null來判斷此上傳資料是否為HTTP multipart request
		// if (parts != null) {
		// for (Part p : parts) {
		// String fldName = p.getName();
		// String value = request.getParameter(fldName);
		//
		// // 1. 讀取使用者輸入資料
		// if (p.getContentType() == null) {
		// if (fldName.equals("servNo")) {
		// if (value != null && value.length() != 0)
		// servNo = Integer.valueOf(value);
		//
		// } else if (fldName.equalsIgnoreCase("servTypeNo")) {
		// servTypeNo = value;
		// } else if (fldName.equalsIgnoreCase("servName")) {
		// servName = value;
		// } else if (fldName.equalsIgnoreCase("servDesc")) {
		// servDesc = value;
		// } else if (fldName.equalsIgnoreCase("servEffectiveDate")) {
		// if (value != null && value.length() != 0)
		// servEffectiveDate = Date.valueOf(value);
		// // servEffectiveDate = MyUtil.getSqlDate(value,
		// // "-");
		//
		// } else if (fldName.equalsIgnoreCase("servStatus")) {
		// servStatus = value;
		// }
		// } else {
		// fileName = ServicesService.getFileName(p); // 此為圖片檔的檔名
		// fileName = ServicesService.adjustFileName(fileName,
		// ServicesService.IMAGE_FILENAME_LENGTH);
		// if (fileName != null && fileName.trim().length() > 0) {
		// sizeInBytes = p.getSize();
		// is = p.getInputStream();
		// servPhoto = new byte[is.available()];
		// is.read(servPhoto);
		// is.close();
		// } else {
		// errorMsg.put("errPicture", "必須挑選圖片檔");
		// }
		//
		// }
		// }
		// }
		// // 2. 進行必要的資料轉換
		// if (servNo == 0) {
		// errorMsg.put("errorservNoEmpty", "服務編號欄必須輸入");
		// }
		// if (servTypeNo == null || servTypeNo.trim().length() == 0) {
		// errorMsg.put("errorservTypeNoEmpty", "服務類型編號欄必須輸入");
		// }
		// if (servName == null || servName.trim().length() == 0) {
		// errorMsg.put("errorservNameEmpty", "服務名稱欄必須輸入");
		// }
		// if (servDesc == null || servName.trim().length() == 0) {
		// errorMsg.put("errorservDesc", "服務描述欄必須輸入");
		// }
		// if (servEffectiveDate == null) {
		// errorMsg.put("errorservEffectiveDate", "服務有效日期必須輸入");
		// }
		// if (servStatus == null || servStatus.trim().length() == 0) {
		// errorMsg.put("errorservStatus", "服務狀態欄必須輸入");
		// }
		//
		// try {
		// // 4. 進行Business Logic運算
		// // RegisterServiceFile類別的功能：
		// // 1.檢查服務編號是否已經存在
		// // 2.儲存服務編號的資料
		// ServicesDAO_Hibernate sdao = new ServicesDAO_Hibernate();
		// // ServicesService ss = new ServicesService();
		// ServicesVO svo = new ServicesVO(servNo, servTypeNo, servName,
		// servDesc, servPhoto, servEffectiveDate,
		// servStatus);
		// boolean xx = sdao.servNoExists(servNo);
		// if (xx) {
		// errorMsg.put("errorIDDups1", "此服務編號號已存在，請換新代號");
		// } else {
		//
		// System.out.println("filename:" + fileName);
		//
		// sdao.insert(svo);
		// msgOK.put("ok", "新增成功!");
		// if (sdao.findByPrimaryKey(servNo) != null) {
		//// String insertPath=request.getContextPath();
		//// request.setAttribute("path", insertPath);
		// response.sendRedirect("SelectServicesForInsert.jsp");
		// return;
		// } else {
		// errorMsg.put("errorIDDup", "新增此筆資料有誤");
		// }
		// }
		// // 5.依照 Business Logic 運算結果來挑選適當的畫面
		// if (!errorMsg.isEmpty()) {
		// // 導向原來輸入資料的畫面，這次會顯示錯誤訊息
		// RequestDispatcher rd =
		// request.getRequestDispatcher("ServicesInsert.jsp");
		// rd.forward(request, response);
		// return;
		// }
		// } catch (Exception e) {
		// e.printStackTrace();
		// errorMsg.put("errorIDDups", e.getMessage());
		// RequestDispatcher rd =
		// request.getRequestDispatcher("ServicesInsert.jsp");
		// rd.forward(request, response);
		// }
		// }
		// 改成吳神版本
		if ("insert".equals(action)) {
			HttpSession session = request.getSession();
			request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
			session.setAttribute("MsgOK", msgOK); // 顯示正常訊息
			try {
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
				// ServicesService.exploreParts(parts, request);
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
				ServicesVO svo = new ServicesVO();
				svo.setServNo(servNo);
				svo.setServName(servName);
				svo.setServDesc(servDesc);
				svo.setServTypeNo(servTypeNo);
				svo.setServPhoto(servPhoto);
				svo.setServStatus(servStatus);
				svo.setServEffectiveDate(servEffectiveDate);
				if (!errorMsg.isEmpty()) {
					request.setAttribute("servicesVO", svo);
					String url = "ServicesInsert.jsp";
					RequestDispatcher failerView = request.getRequestDispatcher(url);
					failerView.forward(request, response);
				}

				ServicesService ss = new ServicesService();
				svo = ss.newAddService(servNo, servTypeNo, servName, servDesc, servPhoto, servEffectiveDate,
						servStatus);
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
