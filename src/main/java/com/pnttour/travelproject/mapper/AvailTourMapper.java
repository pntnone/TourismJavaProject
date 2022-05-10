/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.AvailTour;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class AvailTourMapper extends RowMapper<AvailTour>{

    @Override
    public AvailTour mapRow(ResultSet rs) throws SQLException {
        AvailTour tour = new AvailTour();
        
        String thumbnail = rs.getString("thumbnail");
        String departure = rs.getString("departure");
        String destination = rs.getString("destination"); 
        long categoryTourId = rs.getLong("category_tour_id");
        
        setAbstractModel(tour, rs);
        tour.setThumbnail(thumbnail);
        tour.setCategoryTourId(categoryTourId);
        tour.setDeparture(departure);
        tour.setDestination(destination);
        
        return tour;
    }
    
}
