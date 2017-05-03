package com.services.controller;

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

import com.services.model.ServicesDAO_Hibernate;
import com.services.model.ServicesService;
import com.services.model.ServicesVO;

import myutil.MyUtil;

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
		if ("insert".equals(action)) {
			HttpSession session = request.getSession();
			request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
			session.setAttribute("MsgOK", msgOK); // 顯示正常訊息
			Integer servNo = 0;
			String servTypeNo = "";
			String servName = "";
			String servDesc = "";
			byte[] servPhoto = null;
			Date servEffectiveDate = null;
			String servStatus = "";
			String fileName = "";
			long sizeInBytes = 0;
			InputStream is = null;
			Collection<Part> parts = request.getParts(); // 取出HTTP multipart
															// request內所有的parts
			ServicesService.exploreParts(parts, request);
			// 由parts != null來判斷此上傳資料是否為HTTP multipart request
			if (parts != null) {
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);

					// 1. 讀取使用者輸入資料
					if (p.getContentType() == null) {
						if (fldName.equals("servNo")) {
							if (value != null && value.length() != 0)
								servNo = Integer.valueOf(value);

						} else if (fldName.equalsIgnoreCase("servTypeNo")) {
							servTypeNo = value;
						} else if (fldName.equalsIgnoreCase("servName")) {
							servName = value;
						} else if (fldName.equalsIgnoreCase("servDesc")) {
							servDesc = value;
						} else if (fldName.equalsIgnoreCase("servEffectiveDate")) {
							if (value != null && value.length() != 0)
								servEffectiveDate = Date.valueOf(value);
							// servEffectiveDate = MyUtil.getSqlDate(value,
							// "-");

						} else if (fldName.equalsIgnoreCase("servStatus")) {
							servStatus = value;
						}
					} else {
						fileName = ServicesService.getFileName(p); // 此為圖片檔的檔名
						fileName = ServicesService.adjustFileName(fileName, ServicesService.IMAGE_FILENAME_LENGTH);
						if (fileName != null && fileName.trim().length() > 0) {
							sizeInBytes = p.getSize();
							is = p.getInputStream();
							servPhoto = new byte[is.available()];
							is.read(servPhoto);
							is.close();
						} else {
							errorMsg.put("errPicture", "必須挑選圖片檔");
						}

					}
				}
			}
			// 2. 進行必要的資料轉換
			if (servNo == 0) {
				errorMsg.put("errorservNoEmpty", "服務編號欄必須輸入");
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
			if (servEffectiveDate == null) {
				errorMsg.put("errorservEffectiveDate", "服務有效日期必須輸入");
			}
			if (servStatus == null || servStatus.trim().length() == 0) {
				errorMsg.put("errorservStatus", "服務狀態欄必須輸入");
			}

			try {
				// 4. 進行Business Logic運算
				// RegisterServiceFile類別的功能：
				// 1.檢查服務編號是否已經存在
				// 2.儲存服務編號的資料
				ServicesDAO_Hibernate sdao = new ServicesDAO_Hibernate();
				// ServicesService ss = new ServicesService();
				ServicesVO svo = new ServicesVO(servNo, servTypeNo, servName, servDesc, servPhoto, servEffectiveDate,
						servStatus);
				boolean xx = sdao.servNoExists(servNo);
				if (xx) {
					errorMsg.put("errorIDDups1", "此服務編號號已存在，請換新代號");
					// RequestDispatcher rd =
					// request.getRequestDispatcher("ServicesInsert.jsp");
					// rd.forward(request, response);
					// return;
				} else {

					System.out.println("filename:" + fileName);

					sdao.insert(svo);
					if (sdao.findByPrimaryKey(servNo) != null) {
						// msgOK.put("InsertOK", "<Font
						// color='red'>新增成功，請開始使用本系統</Font>");
						response.sendRedirect("../index.jsp");
						return;
					} else {
						errorMsg.put("errorIDDup", "新增此筆資料有誤");
					}
				}
				// 5.依照 Business Logic 運算結果來挑選適當的畫面
				if (!errorMsg.isEmpty()) {
					// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
					RequestDispatcher rd = request.getRequestDispatcher("ServicesInsert.jsp");
					rd.forward(request, response);
					return;
				}
			} catch (Exception e) {
				e.printStackTrace();
				errorMsg.put("errorIDDups", e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("ServicesInsert.jsp");
				rd.forward(request, response);
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
				String url = "ListOneServices.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				errorMsg.put("errorInfo", "無法取得資料");
				RequestDispatcher fauilerView = request.getRequestDispatcher("SelectServices.jsp");
				fauilerView.forward(request, response);
			}

		}
		if("getOne_For_Update".equals(action)){
			try{
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}
