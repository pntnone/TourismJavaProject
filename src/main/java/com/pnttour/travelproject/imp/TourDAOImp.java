/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.imp;


import com.pnttour.travelproject.dao.TourDAO;
import com.pnttour.travelproject.mapper.TourFrontEndMapper;
import com.pnttour.travelproject.mapper.TourMapper;
import com.pnttour.travelproject.model.Tour;
import com.pnttour.travelproject.model.TourFrontEnd;
import java.util.List;
import javax.annotation.ManagedBean;

/**
 *
 * @author Admin
 */
@ManagedBean
public class TourDAOImp extends BaseDAOImp<TourDAO> implements TourDAO{

    @Override
    public List<Tour> findAll() {
        String sql = "select * from tour";
        return query(sql, new TourMapper());
    }

    @Override
    public Tour findOne(long id) {
        String sql = "select * from tour where id = ?";
        List<Tour> list = query(sql,new TourMapper(),id);
        return list.isEmpty() ? null:list.get(0);
    }

    @Override
    public Long create(Tour tour) {
        String sql = "insert into tour values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] params = new Object[14];
        params[0] = tour.getDescription();
        params[1] = tour.getStatus();
        setParams(params, tour, 2);
        params[6] = tour.getTitle();
        params[7] = tour.getAvailTourId();
        params[8] = tour.getStartTime();
        params[9] = tour.getEndTime();
        params[10] = tour.getFlight();
        params[11] = tour.getMaxAmount();
        params[12] = tour.getCurAmount();
        params[13] = tour.getPrice();
        return create(sql, params);
    }

    @Override
    public void delete(long id) {
        String sql = "delete from tour where id = ?";
        update(sql, id);
    }

    @Override
    public void update(long id, Tour tour) {
        String sql = "update tour set description = ? ,status = ? , "
                + "created_date = ?, modified_date = ?, created_by = ?, "
                + "modified_by = ? , title = ? , avail_tour_id = ? , "
                + "start_time = ? , end_time = ? , flight = ? , max_amount = ?, current_amount = ? , price = ? where id = ?";
        Object[] params = new Object[15];
        params[0] = tour.getDescription();
        params[1] = tour.getStatus();
        setParams(params, tour, 2);
        params[6] = tour.getTitle();
        params[7] = tour.getAvailTourId();
        params[8] = tour.getStartTime();
        params[9] = tour.getEndTime();
        params[10] = tour.getFlight();
        params[11] = tour.getMaxAmount();
        params[12] = tour.getCurAmount();
        System.out.println(params[12]);
        params[13] = tour.getPrice();
        params[14] = id;
        update(sql, params);
    }

    @Override
    public int getCount() {
        return getCountAllRecord("tour","");
    }

    @Override
    public List<TourFrontEnd> findTourFrontEnd(String sqlExtend) {
        StringBuilder sql = new StringBuilder();
        sql.append("select t.created_by,t.created_date,t.modified_by,t.modified_date,t.id,t.description,t.status,t.title,");
        sql.append("t.avail_tour_id,t.start_time,t.end_time,t.flight,at.thumbnail,at.departure,at.destination,ct.code,ct.name,t.price,t.current_amount,t.max_amount ");
        sql.append("from tour as t join avail_tour as at on t.avail_tour_id = at.id join category_tour as ct on at.category_tour_id = ct.id ");
        sql.append(sqlExtend);
        System.out.println(sql);
        return query(sql.toString(), new TourFrontEndMapper());
    }

    @Override
    public TourFrontEnd getOneTourInfo(int id) {
        StringBuilder sql = new StringBuilder();
        sql.append("select t.created_by,t.created_date,t.modified_by,t.modified_date,t.id,t.description,t.status,t.title,");
        sql.append("t.avail_tour_id,t.start_time,t.end_time,t.flight,at.thumbnail,at.departure,at.destination,ct.code,ct.name,t.price,t.current_amount,t.max_amount ");
        sql.append("from tour as t join avail_tour as at on t.avail_tour_id = at.id join category_tour as ct on at.category_tour_id = ct.id where t.id = ?");
        List<TourFrontEnd> findTour =  query(sql.toString(), new TourFrontEndMapper(),id);
        return findTour.isEmpty() ? null : findTour.get(0);
    }

    @Override
    public int getCountTourFEQuery(String query) {
        return getCountAllRecord(" tour as t join avail_tour as at on t.avail_tour_id = at.id join category_tour as ct on at.category_tour_id = ct.id ",query);
    }
    
  
    
}
