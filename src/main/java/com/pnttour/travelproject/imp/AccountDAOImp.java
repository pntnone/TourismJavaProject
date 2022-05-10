    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.imp;

import com.pnttour.travelproject.dao.AccountDAO;
import com.pnttour.travelproject.mapper.UserMapper;
import com.pnttour.travelproject.model.Account;
import java.util.List;
import javax.annotation.ManagedBean;

/**
 *
 * @author Admin
 */
@ManagedBean
public class AccountDAOImp extends BaseDAOImp<Account> implements AccountDAO{
    
    @Override
    public List<Account> findAll() {
        String sql = "select * from account";
        return query(sql, new UserMapper());
    }

    @Override
    public List<Account> findByPassword(String password) {
        String sql = "select * from account where password = ?";
        return query(sql,new UserMapper(),password);
    }

    @Override
    public Account findOne(String username, String password) {
        String sql = "select * from account where username = ? and password = ?";
        List<Account> list = query(sql,new UserMapper(),username,password);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public Long create(Account acc) {
        String sql = "insert into account values (?,?,?,?,?,?,?,?,?)";
        Object[] params = new Object[9];
        params[0] = acc.getUsername();
        params[1] = acc.getPassword();
        params[2] = acc.getName();
        params[3] = acc.getStatus();
        params[4] = acc.getRoleId();
        setParams(params, acc, 5);
        return create(sql, params);
    }

    @Override
    public void delete(long id) {
        String sql = "delete from account where id = ?";
        update(sql, id);
    }

    @Override
    public void update(long id,Account acc) {
       String sql = "update account set username = ? ,password = ? , name = ? , status = ?, role_id = ?,created_date = ?, modified_date = ?, created_by = ?, modified_by = ? where id = ?";
       Object[] params = new Object[10];
        params[0] = acc.getUsername();
        params[1] = acc.getPassword();
        params[2] = acc.getName();
        params[3] = acc.getStatus();
        params[4] = acc.getRoleId();
        setParams(params, acc, 5);
        params[9] = id;
        update(sql, params);
    }

    @Override
    public Account findOne(long id) {
        String sql = "select * from account where id = ?";
        List<Account> accounts = query(sql, new UserMapper(),id);
        return accounts.isEmpty() ? null : accounts.get(0);
    }
    

}
