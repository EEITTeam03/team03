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
@WebServlet("/services.do")
public class TestServices extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 文字資料轉內碼
		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> msgOK = new HashMap<String, String>();
		HttpSession session = request.getSession();
		request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
		session.setAttribute("MsgOK", msgOK); // 顯示正常訊息
		Integer servNo = 0;
		String servTypeNo = "";
		String servName = "";
		String servDesc = "";

		Date servEffectiveDate = null;
		String servStatus = "";
		String fileName = "";
		long sizeInBytes = 0;
		InputStream is = null;
		Collection<Part> parts = request.getParts(); // 取出HTTP multipart request內所有的parts
		ServicesService ss = new ServicesService();
		ss.exploreParts(parts, request);
		// 由parts != null來判斷此上傳資料是否為HTTP multipart request
		if (parts != null) {
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);

				// 1. 讀取使用者輸入資料
				if (p.getContentType() == null) {
					if (fldName.equals("servNo")) {
						try{
							servNo = Integer.valueOf(value);
						}catch(NumberFormatException e){
							e.printStackTrace();
						}
						
					} else if (fldName.equalsIgnoreCase("servTypeNo")) {
						servTypeNo = value;
					} else if (fldName.equalsIgnoreCase("servName")) {
						servName = value;
					} else if (fldName.equalsIgnoreCase("servDesc")) {
						servDesc = value;
					} else if (fldName.equalsIgnoreCase("servEffectiveDate")) {
						try{
							servEffectiveDate = MyUtil.getSqlDate(value, "-");
						}catch(Exception e){
							e.printStackTrace();
						}
						
					} else if (fldName.equalsIgnoreCase("servStatus")) {
						servStatus = value;
					}
				} else {
					fileName = ss.getFileName(p); // 此為圖片檔的檔名
					fileName = ss.adjustFileName(fileName, ServicesService.IMAGE_FILENAME_LENGTH);
					if (fileName != null && fileName.trim().length() > 0) {
						sizeInBytes = p.getSize();
						is = p.getInputStream();
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
		// 如果有錯誤
		if (!errorMsg.isEmpty()) {
			// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
			RequestDispatcher rd = request.getRequestDispatcher("TestServices.jsp");
			rd.forward(request, response);
			return;
		}
		try {
			// 4. 進行Business Logic運算
			// RegisterServiceFile類別的功能：
			// 1.檢查帳號是否已經存在
			// 2.儲存會員的資料
			ServicesDAO_Hibernate rs = new ServicesDAO_Hibernate();
			if (rs.servNoExists(servNo)) {
				errorMsg.put("errorIDDup", "此服務編號號已存在，請換新代號");
			} else {
				ServicesVO svo = new ServicesVO(servNo, servTypeNo, servName, servDesc, servEffectiveDate, servStatus);
				
				System.out.println("filename:" + fileName);
				
				rs.insert(svo);
//				if (true) {
//					msgOK.put("InsertOK", "<Font color='red'>新增成功，請開始使用本系統</Font>");
//					response.sendRedirect("../index.jsp");
//					return;
//				} else {
//					errorMsg.put("errorIDDup", "新增此筆資料有誤(RegisterServlet)");
//				}
			}
			// 5.依照 Business Logic 運算結果來挑選適當的畫面
			if (!errorMsg.isEmpty()) {
				// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg.put("errorIDDup", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
	}
}
