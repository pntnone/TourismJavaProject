/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.CategoryTour;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class CategoryTourMapper extends RowMapper<CategoryTour> {

    @Override
    public CategoryTour mapRow(ResultSet rs) throws SQLException {
        CategoryTour ct = new CategoryTour();
        
        String name = rs.getString("name");
        String code = rs.getString("code");
        setAbstractModel(ct, rs);
        
        ct.setCode(code);
        ct.setName(name);
        
        return ct;
    }
    
}
