/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.imp;

import com.pnttour.travelproject.dao.RoleDAO;
import com.pnttour.travelproject.mapper.RoleMapper;
import com.pnttour.travelproject.model.Role;
import java.util.List;
import javax.annotation.ManagedBean;

/**
 *
 * @author Admin
 */
@ManagedBean
public class RoleDAOImp extends BaseDAOImp<Role> implements RoleDAO{

    @Override
    public List<Role> getAllRole() {
        String sql = "select * from role";
        return query(sql, new RoleMapper());
    }

    @Override
    public Role findOne(long id) {
        String sql = "select * from role where id = ?";
        List<Role> list = query(sql,new RoleMapper(),id);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public Long create(Role r) {
        String sql = "insert into role values (?,?,?,?,?,?)";
        Object[] params = new Object[6];
        params[0] = r.getName();
        params[1] = r.getCode();
        setParams(params, r, 2);
        return create(sql, params);
    }

    @Override
    public void delete(long id) {
        String sql = "delete from role where id = ?";
        update(sql, id);
    }

    @Override
    public void update(long id, Role r) {
        String sql = "update role name = ?, code = ? ,created_date = ?, "
               + "modified_date = ?, created_by = ?, modified_by = ? "
               + "where id = ?";
        Object[] params = new Object[7];
        params[0] = r.getName();
        params[1] = r.getCode();
        setParams(params, r, 2);
        params[6] = id;
        update(sql, params);
    }
    
}
