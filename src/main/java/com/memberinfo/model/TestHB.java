package com.memberinfo.model;

import java.util.List;
import java.util.Set;

import com.membercars.model.MemberCarsVO;

public class TestHB {
	
	public static void main(String[] args) {
		MemberInfoDAO dao = new MemberInfoHibernateDAO();
	
//		MemberInfoVO memberInfoVO = dao.findByPhone("29435588");
		//MemberInfoVO memberInfoVO = dao.findByPK(5);
//		if (memberInfoVO != null) {
//			System.out.print(memberInfoVO.getMemberNo()+",");
//			System.out.print(memberInfoVO.getEmail()+",");
//			System.out.print(memberInfoVO.getMemberName()+",");
//			System.out.print(memberInfoVO.getPassword()+",");
//			System.out.print(memberInfoVO.getPhone()+",");
//			System.out.print(memberInfoVO.getBirthday()+",");
//			System.out.print(memberInfoVO.getAddress()+",");
//			Set<MemberCarsVO> set = memberInfoVO.getMemberCars();
//			System.out.print("<***");
//			for(MemberCarsVO anVO: set) {
//				System.out.print(anVO.getCarLicense()+"***");
//				System.out.print(anVO.getCarTypeVO().getBrand()+"***");
//				System.out.print(anVO.getCarTypeVO().getCarModel()+"~");
//				System.out.print(anVO.getCarTypeVO().getCarClassVO().getCarClass()+"~");
//				System.out.print(anVO.getCarTypeVO().getCarClassVO().getClassName()+"~");
//			}
//			System.out.println("***>");
//		}
		
//		List<MemberInfoVO> list = dao.listAll();
//		for(MemberInfoVO aVO : list) {
//			System.out.print(aVO.getMemberNo()+",");
//			System.out.print(aVO.getEmail()+",");
//			System.out.print(aVO.getMemberName()+",");
//			System.out.print(aVO.getPassword()+",");
//			System.out.print(aVO.getPhone()+",");
//			System.out.print(aVO.getBirthday()+",");
//			System.out.print(aVO.getAddress()+",");
//			System.out.print("<***");
//			Set<MemberCarsVO> set = aVO.getMemberCars();
//			for(MemberCarsVO anVO: set) {
//				System.out.print(anVO.getCarLicense()+"***");
//				System.out.print(anVO.getModelNo()+"");
//			}
//			System.out.println("***>");
//		
//		}
	MemberService svc = new MemberService();
	MemberInfoVO vo = svc.getOneMem(5);
	System.out.println(vo.getMemberName());
	}
}
