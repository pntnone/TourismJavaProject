/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.serviceimp;

import com.pnttour.travelproject.dao.CommentDAO;
import com.pnttour.travelproject.model.Comment;
import com.pnttour.travelproject.model.CommentFE;
import com.pnttour.travelproject.service.CommentService;
import java.util.List;
import javax.annotation.ManagedBean;
import javax.inject.Inject;

/**
 *
 * @author Admin
 */
@ManagedBean
public class CommentServiceImp implements CommentService{
    
    @Inject
    public CommentDAO commentDAO;
    
    @Override
    public List<Comment> findAllCommentsByAccountId(long id) {
        return commentDAO.findByAccountId(id);
    }

    @Override
    public List<Comment> findAllCommentsByTourId(long id) {
        return commentDAO.findByTourId(id);
    }

    @Override
    public Comment findOne(long id) {
        return commentDAO.findOne(id);
    }
    

    @Override
    public Long create(Comment cmt) {
        return commentDAO.create(cmt);
    }

    @Override
    public void delete(long id) {
        commentDAO.delete(id);
    }

    @Override
    public void update(long id,Comment cmt) {
        commentDAO.update(id, cmt);
    }

    @Override
    public List<CommentFE> findAllCommentsByAccountIdFE(long id) {
        return commentDAO.findByAccountIdFE(id);
    }

    @Override
    public List<CommentFE> findAllCommentsByTourIdFE(long id) {
        return commentDAO.findByTourIdFE(id);
    }
    
}
