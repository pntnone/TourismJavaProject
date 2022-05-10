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
public class Tour extends AbstractModel{
    private Date startTime;
    private Date endTime;
    private String description;
    private String flight;
    private String title;
    private int status;
    private long availTourId;
    private int maxAmount;
    private int curAmount;
    private long price;
    private int amountInCart = 0;

    public int getAmountInCart() {
        return amountInCart;
    }

    public void setAmountInCart(int amountInCart) {
        if(amountInCart<0){
            this.amountInCart = 0;
            return;
        }
        this.amountInCart = amountInCart;
    }
    
    
    public int getMaxAmount() {
        return maxAmount;
    }

    public void setMaxAmount(int maxAmount) {
        this.maxAmount = maxAmount;
    }

    public int getCurAmount() {
        return curAmount;
    }

    public void setCurAmount(int curAmount) {
        this.curAmount = curAmount;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }
    
    

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getAvailTourId() {
        return availTourId;
    }

    public void setAvailTourId(long availTourId) {
        this.availTourId = availTourId;
    }
    

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFlight() {
        return flight;
    }

    public void setFlight(String flight) {
        this.flight = flight;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
}
