package com.services.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.Provider.Service;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class ServicesService {
	private ServicesDAO_interface dao;
	public static final int IMAGE_FILENAME_LENGTH = 20;
	Part part;

	public ServicesService() {
		dao = new ServicesDAO_Hibernate();
	}

	public ServicesVO addService(Integer servNo, String servTypeNo, String servName, String servDesc, byte[] servPhoto,
			Date servEffectiveDate, String servStatus) {
		ServicesVO servicesVO = new ServicesVO();
		ServicesService ss = new ServicesService();
		String fileName = "";
		fileName = ss.getFileName(part);
		fileName = ss.adjustFileName(fileName, ss.IMAGE_FILENAME_LENGTH);
		File f = new File(fileName);
		InputStream in;
		try {
			in = new FileInputStream(f);
			byte[] pic = new byte[in.available()];
			in.read(pic);
			in.close();
			servicesVO.setServNo(servNo);
			servicesVO.setServName(servName);
			servicesVO.setServDesc(servDesc);
			servicesVO.setServEffectiveDate(servEffectiveDate);
			servicesVO.setServPhoto(pic);
			servicesVO.setServStatus(servStatus);
			servicesVO.setServTypeNo(servTypeNo);
			// servicesVO.setServicecarclassVO(set);
			dao.insert(servicesVO);
			// System.out.println("完成insert");
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		return servicesVO;
	}

	public ServicesVO updateService(Integer servNo, String servTypeNo, String servName, String servDesc,
			byte[] servPhoto, Date servEffectiveDate, String servStatus) {
		ServicesVO servicesVO = new ServicesVO();
		servicesVO.setServNo(servNo);
		servicesVO.setServTypeNo(servTypeNo);
		servicesVO.setServName(servName);
		servicesVO.setServDesc(servDesc);
		servicesVO.setServEffectiveDate(servEffectiveDate);
		servicesVO.setServPhoto(servPhoto);
		servicesVO.setServStatus(servStatus);
		dao.update(servicesVO);
		return dao.findByPrimaryKey(servNo);
	}

	public List<ServicesVO> getAll() {
		return dao.getAll();
	}
	public List<ServicesVO> getAllForUser() {
		return dao.getAllForUser();
	}

	public ServicesVO getOneService(Integer servNo) {
		return dao.findByPrimaryKey(servNo);
	}

	public List<Map> getServicesForJson() {
		List<ServicesVO> list = dao.getAll();

		List<Map> list2 = new ArrayList<Map>();

		for (ServicesVO asvo : list) {
			if (asvo.getServPhoto() == null) {
				continue;
			}
			Map map = new LinkedHashMap<>();
			map.put("服務描述", asvo.getServDesc().replace("\n", "").replace("\r", ""));
			map.put("服務名稱", asvo.getServName());
			map.put("照片", Base64.getEncoder().encodeToString(asvo.getServPhoto()));
			// map.put(key, value);
			list2.add(map);
		}
		return list2;
	}

	// 本方法調整fileName的長度小於或等於maxLength。
	// 如果fileName的長度小於或等於maxLength，直接傳回fileName
	// 否則保留最後一個句點與其後的附檔名，縮短主檔名使得fileName的總長度
	// 等於maxLength。
	public static String adjustFileName(String fileName, int maxLength) {
		int length = fileName.length();
		if (length <= maxLength) {
			return fileName;
		}
		int n = fileName.lastIndexOf(".");
		int sub = fileName.length() - n - 1;
		fileName = fileName.substring(0, maxLength - 1 - sub) + "." + fileName.substring(n + 1);
		return fileName;
	}

	public static String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	// 此方法可檢視上傳資料的每個欄位與每個檔案，
	public static void exploreParts(Collection<Part> parts, HttpServletRequest req) {
		try {
			for (Part part : parts) {
				String name = part.getName();
				String contentType = part.getContentType();
				String value = "";
				long size = part.getSize(); // 上傳資料的大小，即上傳資料的位元組數
				InputStream is = part.getInputStream();
				if (contentType != null) { // 表示該part為檔案
					// 取出上傳檔案的檔名
					String filename = ServicesService.getFileName(part);

					// 將上傳的檔案寫入到location屬性所指定的資料夾
					if (filename != null && filename.trim().length() > 0) {
						part.write(filename);
						System.out.println(part.getClass().getName());
					}
				} else { // 表示該part為一般的欄位
					// 將上傳的欄位資料寫入到location屬性所指定的資料夾，檔名為"part_"+ name
					part.write("part_" + name);
					value = req.getParameter(name);
				}
				System.out.printf("%-15s %-15s %8d  %-20s \n", name, contentType, size, value);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
