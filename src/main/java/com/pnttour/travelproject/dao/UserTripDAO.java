/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.dao;


import com.pnttour.travelproject.model.UserTrip;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface UserTripDAO {
    public List<UserTrip> findUserTripByTourId(long id);
    
    public List<UserTrip> findUserTripByAccountId(long id);
    
    public List<UserTrip> findAll();
    
    public UserTrip findOne(long id);
    
    public Long create(UserTrip ut);
    
    public void update(long id, UserTrip ut);
    
    public void delete(long id);
}
