/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.imp;

import com.pnttour.travelproject.dao.CategoryTourDAO;
import com.pnttour.travelproject.mapper.CategoryTourMapper;
import com.pnttour.travelproject.model.CategoryTour;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryTourDAOImp extends BaseDAOImp<CategoryTour> implements CategoryTourDAO{

    @Override
    public List<CategoryTour> findAll() {
        String sql = "select * from category_tour";
        return query(sql, new CategoryTourMapper());
    }

    @Override
    public CategoryTour findOne(long id) {
        String sql = "select * from category_tour where id = ?";
        List<CategoryTour> list = query(sql,new CategoryTourMapper(),id);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public Long create(CategoryTour ct) {
        String sql = "insert into category_tour values (?,?,?,?,?,?)";
        Object[] params = new Object[6];
        params[0] = ct.getName();
        params[1] = ct.getCode();
        setParams(params, ct, 2);
        return create(sql, params);
    }

    @Override
    public void delete(long id) {
        String sql = "delete from category_tour where id = ?";
        update(sql, id);
    }

    @Override
    public void update(long id, CategoryTour ct) {
       String sql = "update category_tour name = ?, code = ? ,created_date = ?, "
               + "modified_date = ?, created_by = ?, modified_by = ? "
               + "where id = ?";
        Object[] params = new Object[7];
        params[0] = ct.getName();
        params[1] = ct.getCode();
        setParams(params, ct, 2);
        params[6] = id;
        update(sql, params);
    }


}
