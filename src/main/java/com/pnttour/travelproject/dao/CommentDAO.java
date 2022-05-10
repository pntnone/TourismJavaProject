/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.dao;

import com.pnttour.travelproject.model.Comment;
import com.pnttour.travelproject.model.CommentFE;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface CommentDAO {
    
    public List<Comment> findByTourId(long id);
    
    public List<Comment> findByAccountId(long id);
    
    public List<Comment> findAll();
    
    public Comment findOne(long id);
    
    public Long create(Comment cmt);
    
    public void delete(long id);
    
    public void update(long id,Comment cmt);
    
    public List<CommentFE> findByTourIdFE(long id);
    
    public List<CommentFE> findByAccountIdFE(long id);
    
}
