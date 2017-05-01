package com.servicecarclass.model;

import java.util.List;
import java.util.Set;

import com.services.model.ServicesVO;

public interface ServiceCarClassDAO_interface {
	public void insert(ServiceCarClassVO serCarVO);
	public void update(ServiceCarClassVO serCarVO);
	public void delete(Integer servNo,String carClass);
	public ServiceCarClassVO findByServAndClass(Integer servNo,String carClass);
	public List<ServiceCarClassVO> getAll();
	public Set<ServicesVO> getSerBySerNo(Integer servNo);
}
