/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.dao;

import com.pnttour.travelproject.model.Account;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface AccountDAO{
    
    public List<Account> findAll();
    
    public List<Account> findByPassword(String password);
    
    public Account findOne(String username, String password);
    
    public Account findOne(long id);
    
    public Long create(Account acc);
    
    public void delete(long id);
    
    public void update(long id,Account acc);
}
