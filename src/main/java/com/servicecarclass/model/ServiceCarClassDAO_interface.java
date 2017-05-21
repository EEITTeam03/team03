package com.servicecarclass.model;

import java.util.List;
import java.util.Set;

import com.carclass.model.CarClassVO;
import com.services.model.ServicesVO;
import com.servicestep.model.ServiceStepVO;

public interface ServiceCarClassDAO_interface {
	public void insert(ServiceCarClassVO serCarVO);
	public void update(ServiceCarClassVO serCarVO);
	public void delete(Integer servNo,String carClass);
	public ServiceCarClassVO findByServAndClass(Integer servNo,String carClass);
	public ServiceCarClassVO findByPrimaryKey(Integer carClassNo);
	public List<ServiceCarClassVO> getAll();
	public Set<ServicesVO> getSerBySerNo(Integer servNo);
	public List<ServiceCarClassVO> findByForeignKey(Integer servNo);
	public ServiceCarClassVO findOne(ServicesVO servicesVO,CarClassVO carClassVO);
	public List<ServiceCarClassVO> fnidBySize(String size);
}
