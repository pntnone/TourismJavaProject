/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.Comment;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class CommentMapper extends RowMapper<Comment>{

    @Override
    public Comment mapRow(ResultSet rs) throws SQLException {
        Comment com = new Comment();
        Long tourId = rs.getLong("tour_id");
        Long accountId = rs.getLong("account_id");
        String content = rs.getString("content");
        
        setAbstractModel(com, rs);
        com.setAccountId(accountId);
        com.setTourId(tourId);
        com.setContent(content);
        
        return com;
    }
    
}
