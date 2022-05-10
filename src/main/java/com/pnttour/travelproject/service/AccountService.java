/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.service;

import com.pnttour.travelproject.model.Account;
import com.pnttour.travelproject.model.Comment;
import com.pnttour.travelproject.model.Role;
import com.pnttour.travelproject.model.Tour;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface AccountService {
    public Account findOne(String username, String password);
    public Account findOne(long id);
    public List<Account> findAll();
    
    public Long create(Account acc);
    public void delete(long id);
    public void update(long id,Account acc);
    Account save(Account account);    
    
    public Role getRole(Account acc);
    public List<Comment> getComments(long id);
    public List<Tour> getTours(long id);
    
    
    
}
