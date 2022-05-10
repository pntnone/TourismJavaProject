/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.TourFrontEnd;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class TourFrontEndMapper extends RowMapper<TourFrontEnd>{

    @Override
    public TourFrontEnd mapRow(ResultSet rs) throws SQLException {
        TourFrontEnd tour = new TourFrontEnd();
        Date startTime = rs.getDate("start_time");
        Date endTime = rs.getDate("end_time");
        String flight = rs.getString("flight");
        long availTourId = rs.getLong("avail_tour_id");
        int status = rs.getInt("status");
        String title = rs.getString("title");
        String description = rs.getString("description");
        String thumbnail = rs.getString("thumbnail");
        String departure = rs.getString("departure");
        String destination = rs.getString("destination"); 
        int maxAmount = rs.getInt("max_amount");
        int currentAmount = rs.getInt("current_amount");
        long price = rs.getLong("price");
        
        String name = rs.getString("name");
        String code = rs.getString("code");
        
        tour.setCategoryCode(code);
        tour.setCategoryName(name);
        
        setAbstractModel(tour, rs);
        tour.setAvailTourId(availTourId);
        tour.setStartTime(startTime);
        tour.setEndTime(endTime);
        tour.setFlight(flight);
        tour.setTitle(title);
        tour.setDescription(description);
        tour.setStatus(status);
        tour.setThumbnail(thumbnail);
        tour.setDeparture(departure);
        tour.setDestination(destination);
        tour.setPrice(price);
        tour.setCurAmount(currentAmount);
        tour.setMaxAmount(maxAmount);

        
        return tour;
    }
    
}
