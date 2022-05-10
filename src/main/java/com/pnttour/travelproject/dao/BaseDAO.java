/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.dao;

import com.pnttour.travelproject.mapper.RowMapper;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface BaseDAO<T> {
    <T> List<T> query(String sql,RowMapper<T> mapper,Object... params);
    public void update(String sql,Object... params);
    public Long create(String sql,Object... params);
    public int getCountAllRecord(String tableName,String query);
    
}
