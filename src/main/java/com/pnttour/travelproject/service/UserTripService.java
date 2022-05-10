/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.service;

import com.pnttour.travelproject.model.UserTrip;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface UserTripService {
     public List<UserTrip> findAllUserTripsByAccountId(long id);
    public List<UserTrip> findAllUserTripsByTourId(long id);
    public UserTrip findOne(long id);
    public Long create(UserTrip cmt);
    public void delete(long id);
    public void update(long id,UserTrip cmt);
}
