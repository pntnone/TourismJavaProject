/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.dao;

import com.pnttour.travelproject.model.AvailTour;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface AvailTourDAO {
    
    public List<AvailTour> findAll();
    
    public AvailTour findOne(long id);
    
    public Long create(AvailTour avtour);
    
    public void delete(long id);
    
    public void update(long id,AvailTour avtour);
    
    public List<AvailTour> findRelateAvailTour(String relation);
}
