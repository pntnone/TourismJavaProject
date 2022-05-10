/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.serviceimp;

import com.pnttour.travelproject.dao.UserTripDAO;
import com.pnttour.travelproject.model.UserTrip;
import com.pnttour.travelproject.service.UserTripService;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Admin
 */
public class UserTripServiceImp implements UserTripService{
    
    @Inject
    UserTripDAO userTripDao;
    
    @Override
    public List<UserTrip> findAllUserTripsByAccountId(long id) {
        return userTripDao.findUserTripByAccountId(id);
    }

    @Override
    public List<UserTrip> findAllUserTripsByTourId(long id) {
        return userTripDao.findUserTripByTourId(id);
    }

    @Override
    public UserTrip findOne(long id) {
        return userTripDao.findOne(id);
    }

    @Override
    public Long create(UserTrip cmt) {
        return userTripDao.create(cmt);
    }

    @Override
    public void delete(long id) {
       userTripDao.delete(id);
    }

    @Override
    public void update(long id, UserTrip cmt) {
        userTripDao.update(id, cmt);
    }
    
}
