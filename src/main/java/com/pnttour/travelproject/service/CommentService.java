/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.service;

import com.pnttour.travelproject.model.Comment;
import com.pnttour.travelproject.model.CommentFE;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface CommentService {
    public List<Comment> findAllCommentsByAccountId(long id);
    public List<Comment> findAllCommentsByTourId(long id);
    public List<CommentFE> findAllCommentsByAccountIdFE(long id);
    public List<CommentFE> findAllCommentsByTourIdFE(long id);
    public Comment findOne(long id);
    public Long create(Comment cmt);
    public void delete(long id);
    public void update(long id,Comment cmt);
}
