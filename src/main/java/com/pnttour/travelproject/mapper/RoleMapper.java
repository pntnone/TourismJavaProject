/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.mapper;

import com.pnttour.travelproject.model.Role;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class RoleMapper extends RowMapper<Role>{

    @Override
    public Role mapRow(ResultSet rs) throws SQLException {
        Role role = new Role();
        
        String name = rs.getString("name");
        String code = rs.getString("code");
        setAbstractModel(role, rs);
        
        role.setCode(code);
        role.setName(name);
        
        return role;
    }
    
}
