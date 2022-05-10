/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.service;

import com.pnttour.travelproject.model.Account;
import com.pnttour.travelproject.model.AvailTour;
import com.pnttour.travelproject.model.CategoryTour;
import com.pnttour.travelproject.model.Comment;
import com.pnttour.travelproject.model.PageFormInfor;
import com.pnttour.travelproject.model.Tour;
import com.pnttour.travelproject.model.TourFrontEnd;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Admin
 */

public interface TourService {
     public List<Tour> findAllTour();
     public List<AvailTour> findAllAvailTour();
     
     public List<Comment> findAllComment(long id);
     public List<Account> findAllUser(long id);
     
     public Tour getTourById(long id);
     public CategoryTour getCategory(Tour tour);
     public List<CategoryTour> findAllCategory();
     public AvailTour getAvailTour(Tour tour);
     public AvailTour findAvailTour(long id);
    
     public Long create(Tour tour);
    public Long createAvailTour(AvailTour tour);
    public void delete(long id);
    public void deleteAvailTour(long id);
    public void update(long id,Tour tour);
    public void updateAvailTour(long id,AvailTour tour);
    
    public int getCount(String tableName);
    public int getCountQuery(String query);
    public List<TourFrontEnd> getAllTourInfo(PageFormInfor page);
    public List<TourFrontEnd> getQueryTourInfo(PageFormInfor page);
    public TourFrontEnd getOneTourInfo(int id);
    public List<AvailTour> findRelateAvailTour(String relation);
    
     
}
