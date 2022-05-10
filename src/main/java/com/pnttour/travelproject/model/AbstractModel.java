/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public abstract class AbstractModel {
//    created_date date null,
//    modified_date date null,
//    created_by varchar(255) null,
//    modified_by varchar(255) null
    private long id;
    private Date createdDate = new Date(System.currentTimeMillis());
    private Date modifiedDate = new Date(System.currentTimeMillis()); 
    private String createdBy;
    private String modifiedBy;
    
    public AbstractModel(){}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    
    
    
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    
    
    
}
