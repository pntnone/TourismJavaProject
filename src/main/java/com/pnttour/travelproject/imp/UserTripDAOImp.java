/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.imp;

import com.pnttour.travelproject.dao.UserTripDAO;
import com.pnttour.travelproject.mapper.UserTripMapper;
import com.pnttour.travelproject.model.UserTrip;
import java.util.List;
import javax.annotation.ManagedBean;

/**
 *
 * @author Admin
 */
@ManagedBean
public class UserTripDAOImp extends BaseDAOImp<UserTrip> implements UserTripDAO{

    @Override
    public List<UserTrip> findUserTripByTourId(long id) {
        String sql = "select * from user_trip where tour_id = ?";
        return query(sql, new UserTripMapper(), id);
    }

    @Override
    public List<UserTrip> findUserTripByAccountId(long id) {
         String sql = "select * from user_trip where account_id = ?";
        return query(sql, new UserTripMapper(), id);
    }

    @Override
    public List<UserTrip> findAll() {
        String sql = "select * from user_trip";
        return query(sql, new UserTripMapper());
    }

    @Override
    public Long create(UserTrip ut) {
        String sql = "insert into user_trip values (?,?,?,?,?,?,?,?)";
        Object[] params = new Object[8];
        params[0] = ut.getTourId();
        params[1] = ut.getAccountId();
        params[2] = ut.getStatus();
        setParams(params, ut, 3);
        params[7]= ut.getAmount();
        return create(sql, params);
    }

    @Override
    public void update(long id, UserTrip ut) {
        String sql = "update user_trip set tour_id = ? ,account_id = ? ,"
                + "status = ?,created_date = ?, modified_date = ?, "
                + "created_by = ?, modified_by = ? , amount = ? where id = ?";
        Object[] params = new Object[9];
        params[0] = ut.getTourId();
        params[1] = ut.getAccountId();
        params[2] = ut.getStatus();
        setParams(params, ut, 3);
        params[7]= ut.getAmount();
        params[8] = id;
        update(sql, params);
    }

    @Override
    public void delete(long id) {
        String sql = "delete from user_trip where id = ?";
        update(sql, id);
    }

    @Override
    public UserTrip findOne(long id) {
        String sql = "select * from user_trip where id = ?";
        List<UserTrip> list = query(sql,new UserTripMapper(),id);
        return !list.isEmpty() ? list.get(0) : null;
    }
    
}
