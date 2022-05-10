/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.imp;

import com.pnttour.travelproject.dao.BaseDAO;
import com.pnttour.travelproject.mapper.RowMapper;
import com.pnttour.travelproject.model.AbstractModel;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Admin
 * @param <T>
 */
public class BaseDAOImp<T> implements BaseDAO<T> {
    
   
    @Override
    public <T> List<T> query(String sql, RowMapper<T> mapper, Object... params) {
        List<T> results = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            setParams(ps, params);
            rs = ps.executeQuery();
            while (rs.next()) {
                T elem = mapper.mapRow(rs);
                results.add(elem);
            }
            return results;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            closeConnection(con, ps, rs);
        }
    }

    @Override
    public void update(String sql, Object... params) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql);
            setParams(ps, params);
            ps.executeUpdate();
            con.commit();
        } catch (SQLException e) {
            if(con!=null){
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            closeConnection(con, ps, rs);
        }
    }

    @Override
    public Long create(String sql, Object... params) {
        Long id = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            setParams(ps, params);
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if(rs.next()){
                id = rs.getLong(1);
            }
            con.commit();
            return id;
        } catch (SQLException e) {
            if(con!=null){
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return null;
        } finally {
            closeConnection(con, ps, rs);
        }
              
    }

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=pnttour;user=sa;password=123;useUnicode=true&characterEncoding=UTF-8";
            conn = DriverManager.getConnection(dbURL);
            System.out.println("Connect Success!");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            System.out.println("Connect Failed!");
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Connect Failed!");
        }

        return conn;
    }

    public void closeConnection(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (conn != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {

        }
    }

    private void setParams(PreparedStatement ps, Object... params) throws SQLException {
        for (int i = 0; i < params.length; i++) {
            Object param = params[i];
            if (param instanceof Integer) {
                ps.setInt(i + 1, (Integer) param);
            } else if (param instanceof Long) {
                ps.setLong(i + 1, (Long) param);
            } else if (param instanceof String) {
                ps.setString(i + 1, (String) param);
            } else if (param instanceof Date) {
                ps.setDate(i + 1, (Date) param);
            } else if (param instanceof Double) {
                ps.setDouble(i + 1, (Double) param);
            } else if (param instanceof Float) {
                ps.setFloat(i + 1, (Float) param);
            } else if (param instanceof Boolean) {
                ps.setBoolean(i + 1, (Boolean) param);
            } else if(param == null){
                ps.setNull(i+1, java.sql.Types.NULL);
            }
        }
    }
    
    protected void setParams(Object[] params, AbstractModel model ,int index){
        params[index] = model.getCreatedDate();
        params[index + 1] = model.getModifiedDate();
        params[index + 2] = model.getCreatedBy();
        params[index + 3] = model.getModifiedBy();
    }  

    @Override
    public int getCountAllRecord(String tableName,String query) {
        int count = 0;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            String sql = "select count(*) from " + tableName + query;
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        } catch (SQLException e) {
            return -1;
        } finally {
            closeConnection(con, ps, rs);
        }
    }

}
