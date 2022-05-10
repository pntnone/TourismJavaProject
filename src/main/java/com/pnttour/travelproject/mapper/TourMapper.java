/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.Tour;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class TourMapper extends RowMapper<Tour> {

    @Override
    public Tour mapRow(ResultSet rs) throws SQLException {
        Tour tour = new Tour();
        
        Date startTime = rs.getDate("start_time");
        Date endTime = rs.getDate("end_time");
        String flight = rs.getString("flight");
        long availTourId = rs.getLong("avail_tour_id");
        int status = rs.getInt("status");
        String title = rs.getString("title");
        int maxAmount = rs.getInt("max_amount");
        int currentAmount = rs.getInt("current_amount");
        long price = rs.getLong("price");
        String description = rs.getString("description");
        
        setAbstractModel(tour, rs);
        tour.setAvailTourId(availTourId);
        tour.setStartTime(startTime);
        tour.setEndTime(endTime);
        tour.setFlight(flight);
        tour.setTitle(title);
        tour.setDescription(description);
        tour.setStatus(status);
        //add lan 2
        tour.setPrice(price);
        tour.setCurAmount(currentAmount);
        tour.setMaxAmount(maxAmount);

        return tour;
    }

}
