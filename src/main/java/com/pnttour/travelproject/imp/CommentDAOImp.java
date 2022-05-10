/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.imp;

import com.pnttour.travelproject.dao.CommentDAO;
import com.pnttour.travelproject.mapper.CommentFEMapper;
import com.pnttour.travelproject.mapper.CommentMapper;
import com.pnttour.travelproject.model.Comment;
import com.pnttour.travelproject.model.CommentFE;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CommentDAOImp extends BaseDAOImp<Comment> implements CommentDAO {

    @Override
    public List<Comment> findByTourId(long id) {
        String sql = " select * from Comment where tour_id = ?";
        return query(sql, new CommentMapper(), id);
    }

    @Override
    public List<Comment> findByAccountId(long id) {
        String sql = " select * from Comment where account_id = ?";
        return query(sql, new CommentMapper(), id);
    }

    @Override
    public List<Comment> findAll() {
        String sql = " select * from Comment";
        return query(sql, new CommentMapper());
    }

    @Override
    public Comment findOne(long id) {
        String sql = " select * from Comment where id = ? ";
        List<Comment> list = query(sql, new CommentMapper(), id);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public Long create(Comment cmt) {
        String sql = "insert into Comment values(?,?,?,?,?,?,?)";
        Object[] params = new Object[7];
        params[0] = cmt.getTourId();
        params[1] = cmt.getAccountId();
        setParams(params, cmt, 2);
        params[6] = cmt.getContent();
        return create(sql, params);
    }

    @Override
    public void delete(long id) {
        String sql = "delete from Comment where id = ?";
        update(sql, id);
    }

    @Override
    public void update(long id, Comment cmt) {
        String sql = "update comment set tour_id = ?  ,account_id =?,"
                + " created_date = ?, modified_date = ?, created_by = ?, "
                + "modified_by = ? where id = ?";
        Object[] params = new Object[8];
        params[0] = cmt.getTourId();
        params[1] = cmt.getAccountId();
        setParams(params, cmt, 2);
        params[6] = cmt.getContent();
        params[7] = cmt.getId();
        update(sql, params);
    }

    @Override
    public List<CommentFE> findByTourIdFE(long id) {
        String sql = "select c.account_id,c.id,c.tour_id,c.created_date,c.modified_date,c.content,c.created_by,c.modified_by,t.title,a.name from comment as c join account as a on c.account_id = a.id \n"
                + "join tour as t on t.id = c.tour_id where c.tour_id = ?";
        return query(sql, new CommentFEMapper(), id);
    }

    @Override
    public List<CommentFE> findByAccountIdFE(long id) {
        String sql = "select c.account_id,c.id,c.tour_id,c.created_date,c.modified_date,c.content,c.created_by,c.modified_by,t.title,a.name from comment as c join account as a on c.account_id = a.id \n"
                + "join tour as t on t.id = c.tour_id where c.account_id = ?";
        return query(sql, new CommentFEMapper(), id);
    }

}
