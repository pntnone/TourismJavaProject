/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.UserTrip;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UserTripMapper extends RowMapper<UserTrip>{

    @Override
    public UserTrip mapRow(ResultSet rs) throws SQLException {
        UserTrip ut = new UserTrip();
        
        long tourId = rs.getLong("tour_id");
        long accountId = rs.getLong("account_id");
        int status = rs.getInt("status");
        int amount = rs.getInt("amount");
        setAbstractModel(ut, rs);
        ut.setStatus(status);
        ut.setTourId(tourId);
        ut.setAccountId(accountId);
        ut.setAmount(amount);
        return ut;
    }
    
}
