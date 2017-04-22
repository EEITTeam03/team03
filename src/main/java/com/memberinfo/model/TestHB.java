package com.memberinfo.model;

import java.util.List;
import java.util.Set;

import com.membercars.model.MemberCarsVO;

public class TestHB {
	
	public static void main(String[] args) {
		MemberInfoDAO dao = new MemberInfoHibernateDAO();
	
		List<MemberInfoVO> list = dao.listAll();
		
		for(MemberInfoVO aVO : list) {
			System.out.print(aVO.getMemberNo()+",");
			System.out.print(aVO.getEmail()+",");
			System.out.print(aVO.getMemberName()+",");
			System.out.print(aVO.getPassword()+",");
			System.out.print(aVO.getPhone()+",");
			System.out.print(aVO.getBirthday()+",");
			System.out.print(aVO.getAddress()+",");
			System.out.print("<***");
			Set<MemberCarsVO> set = aVO.getMemberCars();
			for(MemberCarsVO anVO: set) {
				System.out.print(anVO.getCarLicense()+"***");
				System.out.print(anVO.getModelNo()+"");
			}
			System.out.println("***>");
		
		}
	
	
	}
}
