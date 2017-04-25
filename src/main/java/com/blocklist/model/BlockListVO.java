package com.blocklist.model;

import com.blockrule.model.BlockRuleVO;
import com.memberinfo.model.MemberInfoVO;

public class BlockListVO {
	private Short blockRuleNo;
	private String violationDate;
	private Integer reservationNo;
	private String blockState;
	private BlockRuleVO blockRuleVO;
	private MemberInfoVO memberInfoVO;
	
	public MemberInfoVO getMemberInfoVO() {
		return memberInfoVO;
	}
	public void setMemberInfoVO(MemberInfoVO memberInfoVO) {
		this.memberInfoVO = memberInfoVO;
	}
	
	public Short getBlockRuleNo() {
		return blockRuleNo;
	}
	public void setBlockRuleNo(Short blockRuleNo) {
		this.blockRuleNo = blockRuleNo;
	}
	public String getViolationDate() {
		return violationDate;
	}
	public void setViolationDate(String violationDate) {
		this.violationDate = violationDate;
	}
	public Integer getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(Integer reservationNo) {
		this.reservationNo = reservationNo;
	}
	public String getBlockState() {
		return blockState;
	}
	public void setBlockState(String blockState) {
		this.blockState = blockState;
	}
	public BlockRuleVO getBlockRuleVO() {
		return blockRuleVO;
	}
	public void setBlockRuleVO(BlockRuleVO blockRuleVO) {
		this.blockRuleVO = blockRuleVO;
	}
	
}
