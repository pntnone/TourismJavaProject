/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.Account;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UserMapper extends RowMapper<Account> {

    @Override
    public Account mapRow(ResultSet rs) throws SQLException{
        Account acc = new Account();
        String name = rs.getString("name");
        int status = rs.getInt("status");
        long roleId = rs.getLong("role_id");
        setAbstractModel(acc, rs);
        acc.setName(name);
        acc.setPassword(rs.getString("password"));
        acc.setUsername(rs.getString("username"));
        acc.setRoleId(roleId);
        acc.setStatus(status);
        
        return acc;
    }

}
