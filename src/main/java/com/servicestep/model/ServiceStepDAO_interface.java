package com.servicestep.model;

import java.util.List;

import com.services.model.ServicesVO;

public interface ServiceStepDAO_interface {
	public void insert(ServiceStepVO serviceStepVO);
	public void update(ServiceStepVO serviceStepVO);
	public void delete(Integer servNo);
	public ServiceStepVO findByPrimaryKey(Integer servNo);
	public List<ServiceStepVO> getAll();
	
	public ServiceStepVO findByPrimaryKeyServStepNo(Integer servStepNo);
}
