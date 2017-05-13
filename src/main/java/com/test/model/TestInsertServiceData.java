package com.test.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;

import com.services.model.ServicesDAO_Hibernate;
import com.services.model.ServicesVO;

public class TestInsertServiceData {

	public static void main(String[] args) {
		ServicesDAO_Hibernate sh = new ServicesDAO_Hibernate();
		ServicesVO svo = new ServicesVO();

		List<ServicesVO> list = sh.getAll();
		for (ServicesVO alist : list) {
			if (alist.getServPhoto() == null) {
				int i = 1;
				File f = new File("res\\" + i+".jpg");
				try {
					FileInputStream fis = new FileInputStream(f);
					byte[] b=new byte[fis.available()];
					fis.read(b);
					alist.setServPhoto(b);
					sh.update(alist);
					fis.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

}
