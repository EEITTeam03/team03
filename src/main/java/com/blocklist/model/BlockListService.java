package com.blocklist.model;

import java.util.Calendar;
import java.util.List;

import com.blockrule.model.BlockRuleVO;
import com.memberinfo.model.MemberInfoVO;
import com.memberinfo.model.MemberService;

import myutil.MyUtil;

public class BlockListService {
	private BlockListDAO_interface dao;
	public BlockListService(){
		dao = new BlockListHibernateDAO();
	}
	public BlockListVO addBlockList(String violationDate,Integer reservationNo,String blockState,BlockRuleVO blockRuleVO,MemberInfoVO memberInfoVO){
		BlockListVO blv= new BlockListVO();
		blv.setViolationDate(violationDate);
		blv.setReservationNo(reservationNo);
		blv.setMemberInfoVO(memberInfoVO);
		blv.setBlockState(blockState);
		blv.setBlockRuleVO(blockRuleVO);
		dao.insert(blv);
		return blv;
	}
	public Long countBlockListVO(MemberInfoVO memberInfoVO){
		return dao.countBlockList(memberInfoVO);
	}
	
//	public void checkTimesForBlock(MemberInfoVO memberInfoVO,String violationDate){
//		BlockListService bls = new BlockListService();
//		if((bls.countBlockListVO(memberInfoVO)%3)==0){
//			//java.util.Date date = DateFormat.getDateInstance().parse(violationDate);
//			java.util.Calendar calendar = MyUtil.getCalender(violationDate);
//			calendar.add(Calendar.MONTH,3);
//			//java.sql.Date sqlDate= (java.sql.Date)calendar.getInstance().getTime();
//			java.sql.Date sqlDate = new java.sql.Date(calendar.getTimeInMillis());
//			MemberService msvc = new MemberService();
//			msvc.updateMem(memberInfoVO.getMemberNo(), memberInfoVO.getMemberName(), memberInfoVO.getEmail(), memberInfoVO.getPassword(), memberInfoVO.getPhone(), memberInfoVO.getBirthday(), memberInfoVO.getAddress(), sqlDate);
//			System.out.println("懲處: "+memberInfoVO.getMemberName());
//		};
//	}
	
	public List<BlockListVO> getAllBlockList(){
		return dao.getAll();
	}
}
