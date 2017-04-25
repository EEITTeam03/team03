package com.bocklist.model;

import java.util.List;

public interface BlockListDAO_interface {
	public void insert(BlockListVO blockListVO);
	public void update(BlockListVO blockListVO);
	public void delete(Short reservationNo);
	public BlockListVO findByPrimaryKey(Short reservationNo);
    public List<BlockListVO> getAll();
}
