package com.cartype.model;

import java.util.List;

public interface CarTypeDAO {

    public void insert(CarTypeVO carTypeVO);
    public void update(CarTypeVO carTypeVO);
    public void delete(String modelNo);
    public CarTypeVO findByPK(String modelNo);
    public List<CarTypeVO> findByBrand(String brand);
    public List<CarTypeVO> listAll();
    
}
