package com.services.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
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
	//TODO 還沒經過測試，晚點測
	public ServicesVO addService(Integer servNo, String servTypeNo, String servName, String servDesc, byte[] servPhoto,
			Date servEffectiveDate, String servStatus) {
		ServicesVO servicesVO = new ServicesVO();
		ServicesService ss= new ServicesService();
		File f = new File(ss.getFileName(part));
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
//			servicesVO.setServicecarclassVO(set);
			dao.insert(servicesVO);
//			System.out.println("完成insert");
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
//		
//		servicesVO.setServNo(servNo);
//		servicesVO.setServTypeNo(servTypeNo);
//		servicesVO.setServName(servName);
//		servicesVO.setServDesc(servDesc);
//		servicesVO.setServEffectiveDate(servEffectiveDate);
//		servicesVO.setServPhoto(servPhoto);
//		servicesVO.setServStatus(servStatus);
//		dao.insert(servicesVO);
		return servicesVO;
	}

	public List<ServicesVO> getAll() {
		return dao.getAll();
	}

	public ServicesVO getOneService(Integer servNo) {
		return dao.findByPrimaryKey(servNo);
	}

	public List<Map> getServicesForJson() {
		List<ServicesVO> list = dao.getAll();
		List<Map> list2 = new ArrayList<Map>();
		for (ServicesVO asvo : list) {
			Map map = new LinkedHashMap<>();
			map.put("服務描述:", asvo.getServDesc().replace("\n", "").replace("\r", ""));
			map.put("服務名稱", asvo.getServName());
			map.put("照片", asvo.getServPhoto());
			// map.put(key, value);
			list2.add(map);
		}
		return list2;
	}
	//TODO 還沒經過測試，晚點測
	public String adjustFileName(String fileName, int maxLength) {
		return fileName;
	}
	//TODO 還沒經過測試，晚點測
	public String getFileName(final Part part) {
		return null;
	}
	//TODO 還沒經過測試，晚點測
	public Collection<Part> exploreParts(Collection<Part> parts, HttpServletRequest req) {
		return parts;
	}
}
