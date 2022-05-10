/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.serviceimp;

import com.pnttour.travelproject.dao.AccountDAO;
import com.pnttour.travelproject.dao.CommentDAO;
import com.pnttour.travelproject.dao.RoleDAO;
import com.pnttour.travelproject.dao.TourDAO;
import com.pnttour.travelproject.dao.UserTripDAO;
import com.pnttour.travelproject.imp.CommentDAOImp;
import com.pnttour.travelproject.imp.RoleDAOImp;
import com.pnttour.travelproject.imp.TourDAOImp;
import com.pnttour.travelproject.imp.UserTripDAOImp;
import com.pnttour.travelproject.model.Account;
import com.pnttour.travelproject.model.Comment;
import com.pnttour.travelproject.model.Role;
import com.pnttour.travelproject.model.Tour;
import com.pnttour.travelproject.model.UserTrip;
import com.pnttour.travelproject.service.AccountService;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.ManagedBean;
import javax.inject.Inject;


/**
 *
 * @author Admin
 */
@ManagedBean
public class AccountServiceImp implements AccountService{
    
    @Inject
    private AccountDAO accountDAO;
    
    
    public void setAccountDAO(AccountDAO accountDAO) {
        this.accountDAO = accountDAO;
    }

    
    
    @Override
    public Account findOne(String username, String password) {
        return accountDAO.findOne(username, password);
    }

    @Override
    public Account save(Account account) {
        Long id = accountDAO.create(account);
        Account accFind = accountDAO.findOne(id);
        return accFind;
    }

    @Override
    public Account findOne(long id) {
       return accountDAO.findOne(id);
    }

    @Override
    public Long create(Account acc) {
        return accountDAO.create(acc);
    }

    @Override
    public void delete(long id) {
        accountDAO.delete(id);
    }

    @Override
    public void update(long id, Account acc) {
        accountDAO.update(id, acc);
    }

    @Override
    public Role getRole(Account acc) {
        RoleDAO roleDAO = new RoleDAOImp();
        return roleDAO.findOne(acc.getRoleId());
    }

    @Override
    public List<Comment> getComments(long id) {
       CommentDAO commentDAO = new CommentDAOImp();
       return commentDAO.findByAccountId(id);
    }

    @Override
    public List<Tour> getTours(long id) {
       List<Tour> tours = new ArrayList<>();
       UserTripDAO userTripDAO = new UserTripDAOImp();
       TourDAO tourDAO = new TourDAOImp();
       
        for (UserTrip userTrip : userTripDAO.findUserTripByAccountId(id)) {
            Tour tour = tourDAO.findOne(userTrip.getTourId());
            tours.add(tour);
        }
        
        return tours.isEmpty() ? null : tours;
       
    }

    @Override
    public List<Account> findAll() {
         return accountDAO.findAll();
    }
    
}
