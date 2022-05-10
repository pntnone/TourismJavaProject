/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.imp;

import com.pnttour.travelproject.dao.AvailTourDAO;
import com.pnttour.travelproject.mapper.AvailTourMapper;
import com.pnttour.travelproject.model.AvailTour;
import java.util.List;
import javax.annotation.ManagedBean;

/**
 *
 * @author Admin
 */
@ManagedBean
public class AvailTourDAOImp extends BaseDAOImp<AvailTour> implements AvailTourDAO{

    @Override
    public List<AvailTour> findAll() {
        String sql = "select * from avail_tour";
        return query(sql, new AvailTourMapper());
    }

    @Override
    public AvailTour findOne(long id) {
        String sql = "select * from avail_tour where id = ?";
        List<AvailTour> list = query(sql,new AvailTourMapper(),id);
        return list.isEmpty() ? null:list.get(0);
    }

    @Override
    public Long create(AvailTour avtour) {
        String sql = "insert into avail_tour values (?,?,?,?,?,?,?,?)";
        Object[] params = new Object[8];
        params[0] = avtour.getThumbnail();
        params[1] = avtour.getDeparture();
        params[2] = avtour.getDestination();
        params[3] = avtour.getCategoryTourId();
        setParams(params, avtour, 4);
        return create(sql, params);
    }

    @Override
    public void delete(long id) {
        String sql = "delete from avail_tour where id = ?";
        update(sql, id);
    }

    @Override
    public void update(long id, AvailTour avtour) {
         String sql = "update avail_tour set thumbnail = ? ,departure = ? , destination = ? ,"
                 + " category_tour_id = ? , created_date = ?, modified_date = ?, created_by = ?, "
                 + "modified_by = ? where id = ?";
        Object[] params = new Object[9];
        params[0] = avtour.getThumbnail();
        params[1] = avtour.getDeparture();
        params[2] = avtour.getDestination();
        params[3] = avtour.getCategoryTourId();
        setParams(params, avtour, 4);
        params[8] = id;
        update(sql, params);
    }

    @Override
    public List<AvailTour> findRelateAvailTour(String relation) {
        String sql = "select * from avail_tour where departure = N'" + relation + "'";
        return query(sql, new AvailTourMapper());
    }
    


}
