package com.blocklist.model;

import com.blockrule.model.BlockRuleVO;
import com.memberinfo.model.MemberInfoVO;

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
}
