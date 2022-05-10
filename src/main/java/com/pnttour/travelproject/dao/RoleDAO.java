/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.dao;

import com.pnttour.travelproject.model.Role;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface RoleDAO {
    
    public List<Role> getAllRole();
    
     public Role findOne(long id);
    
    public Long create(Role r);
    
    public void delete(long id);
    
    public void update(long id,Role r);
}
