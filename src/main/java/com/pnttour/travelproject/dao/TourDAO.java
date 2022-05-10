/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.dao;

import com.pnttour.travelproject.model.Tour;
import com.pnttour.travelproject.model.TourFrontEnd;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface TourDAO {
    
    public List<Tour> findAll();
    
    public Tour findOne(long id);
    
    public Long create(Tour tour);
    
    public void delete(long id);
    
    public void update(long id,Tour tour);
    
    public int getCount();
    
    public int getCountTourFEQuery(String query);
    
    public List<TourFrontEnd> findTourFrontEnd(String sqlExtend);
    
    public TourFrontEnd getOneTourInfo(int id);
    
}
