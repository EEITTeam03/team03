package com.carclass.model;

import java.util.List;
import java.util.Set;

import com.cartype.model.CarTypeVO;

public interface CarClassDAO {

    public void insert(CarClassVO carClassVO);
    public void update(CarClassVO carClassVO);
    public void delete(String carClass);
    public CarClassVO findByPK(String carClass);
    public List<CarClassVO> listAll();
    public Set<CarTypeVO> findTypesByClass(String carClass);
    
}
