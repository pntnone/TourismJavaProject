/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.dao;

import com.pnttour.travelproject.model.CategoryTour;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface CategoryTourDAO {
    
    public List<CategoryTour> findAll();
    
    public CategoryTour findOne(long id);
    
    public Long create(CategoryTour cmt);
    
    public void delete(long id);
    
    public void update(long id,CategoryTour cmt);
    
    
}
