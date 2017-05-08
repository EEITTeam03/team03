package com.blocklist.model;

import java.util.List;

import com.memberinfo.model.MemberInfoVO;

public interface BlockListDAO_interface {
	public void insert(BlockListVO blockListVO);
	public void update(BlockListVO blockListVO);
	public void delete(Integer reservationNo);
	public BlockListVO findByPrimaryKey(Integer reservationNo);
    public List<BlockListVO> getAll();
    public Long countBlockList(MemberInfoVO miv);
}
