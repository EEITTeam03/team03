package com.servicestep.model;

import java.util.List;

import com.services.model.ServicesVO;

public interface ServiceStepDAO_interface {
	public void insert(ServiceStepVO serviceStepVO);
	public void update(ServiceStepVO serviceStepVO);
	public void delete(Integer servStepNo);
	public ServiceStepVO findByPrimaryKey(Integer servStepNo);
	public List<ServiceStepVO> getAll();
	public List<ServiceStepVO> findByForeignKey(Integer servNo);
}
