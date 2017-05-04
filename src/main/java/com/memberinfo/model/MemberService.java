package com.memberinfo.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.cartype.model.CarTypeHibernateDAO;
import com.cartype.model.CarTypeVO;
import com.membercars.model.MemberCarsVO;

public class MemberService {
	
	private MemberInfoDAO dao;

	public MemberService() {
		dao = new MemberInfoHibernateDAO();
	}

	public List<MemberInfoVO> getMember(String email , String password){
		return dao.findMember(email, password);
	}
	
	public MemberInfoVO insertmem(String memberName, String password, String email, String phone, java.sql.Date birthday, String address, java.sql.Date effectiveDate) {

		MemberInfoVO memberinfoVO = new MemberInfoVO();

		memberinfoVO.setMemberName(memberName);
		memberinfoVO.setEmail(email);
		memberinfoVO.setPassword(password);
		memberinfoVO.setPhone(phone);
		memberinfoVO.setBirthday(birthday);
		memberinfoVO.setAddress(address);
		memberinfoVO.setEffectiveDate(effectiveDate);
		

		dao.insert(memberinfoVO);

		return memberinfoVO;
	}
	
	public MemberInfoVO insertMemAndCar
		(String memberName,String email , String password, String phone, java.sql.Date birthday, 
		 String address, java.sql.Date effectiveDate, String license) {
		
		MemberInfoVO memberinfoVO = new MemberInfoVO();
		Set<MemberCarsVO> memberCars = new HashSet<MemberCarsVO>();
		
		memberinfoVO.setMemberName(memberName);
		memberinfoVO.setEmail(email);
		memberinfoVO.setPassword(password);
		memberinfoVO.setPhone(phone);
		memberinfoVO.setBirthday(birthday);
		memberinfoVO.setAddress(address);
		memberinfoVO.setEffectiveDate(effectiveDate);
		memberinfoVO.setMemberCars(memberCars);
		
		MemberCarsVO membercarsVO = new MemberCarsVO();
		membercarsVO.setMemberInfoVO(memberinfoVO);
		membercarsVO.setCarLicense(license);
		CarTypeHibernateDAO ctdao = new CarTypeHibernateDAO();
		CarTypeVO cartypeVO = ctdao.findByPK("1220");
		membercarsVO.setCarTypeVO(cartypeVO);
		
		memberCars.add(membercarsVO);
		
		dao.insert(memberinfoVO);

		return memberinfoVO;
	}

	public MemberInfoVO updatemem(Integer memberNo, String email, String password, String memberName, String phone, java.sql.Date birthday, String address) {

		MemberInfoVO memberinfoVO = new MemberInfoVO();

		memberinfoVO.setMemberNo(memberNo);
		memberinfoVO.setMemberName(memberName);
		memberinfoVO.setEmail(email);
		memberinfoVO.setPassword(password);
		memberinfoVO.setPhone(phone);
		memberinfoVO.setBirthday(birthday);
		memberinfoVO.setAddress(address);
		memberinfoVO.setMemberCars(dao.findByPK(memberNo).getMemberCars());

		dao.update(memberinfoVO);

		return dao.findByPK(memberNo);
	}

	public void deleteEmp(Integer memberNo) {
		dao.delete(memberNo);
	}

	public MemberInfoVO getOneMem(Integer memberNo) {
		return dao.findByPK(memberNo);
	}

	public List<MemberInfoVO> getAll() {
		return dao.listAll();
	}
	public MemberInfoVO getOneByEmail(String email){
		return dao.findByEmail(email);
	}
	public String randomPswd(){
		int num=0;
		char c;
		String str="";
		for(int i=0;i<8;i++){
			num = (int)(Math.random() * 75);
			num+=48;
			c=(char)num;
			str = c+str;
		}
		return str;
	}
}