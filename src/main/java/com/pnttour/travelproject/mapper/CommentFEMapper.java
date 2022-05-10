/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.CommentFE;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class CommentFEMapper extends RowMapper<CommentFE>{

    @Override
    public CommentFE mapRow(ResultSet rs) throws SQLException {
        CommentFE com = new CommentFE();
        Long tourId = rs.getLong("tour_id");
        Long accountId = rs.getLong("account_id");
        String content = rs.getString("content");
        String name = rs.getString("name");
        String title = rs.getString("title");
        long id = rs.getLong("id");
        com.setAccountId(accountId);
        com.setTourId(tourId);
        com.setContent(content);
        com.setName(name);
        com.setTourTitle(title);
        com.setId(id);
        return com;
    }
    
}
