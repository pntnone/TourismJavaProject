/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.AbstractModel;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public abstract class RowMapper<T> {
    public abstract <T> T mapRow(ResultSet rs) throws SQLException;
    
    public void createModelMethod(AbstractModel model, PreparedStatement ps,int i) throws SQLException{
        ps.setDate(i,  model.getCreatedDate());
        ps.setDate(i+1,  model.getModifiedDate());
        ps.setString(i+2, model.getCreatedBy());
        ps.setString(i+3, model.getModifiedBy());
    }
    
    public void setAbstractModel(AbstractModel model, ResultSet rs) throws SQLException{
        long id = rs.getLong("id");
        Date createdDate = rs.getDate("created_date");
        Date modifiedDate = rs.getDate("modified_date");
        String createdBy = rs.getString("created_by");
        String modifiedBy = rs.getString("modified_by");
        
        model.setId(id);
        model.setModifiedBy(modifiedBy);
        model.setCreatedBy(createdBy);
        model.setModifiedDate(modifiedDate);
    }

    
    
}
