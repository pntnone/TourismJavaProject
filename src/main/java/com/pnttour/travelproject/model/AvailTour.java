/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.model;


/**
 *
 * @author Admin
 */
public class AvailTour extends AbstractModel {
    private String thumbnail;
    private String departure;
    private String destination;
    private long categoryTourId;
    private CategoryTour categoryTour;

    public CategoryTour getCategoryTour() {
        return categoryTour;
    }

    public void setCategoryTour(CategoryTour categoryTour) {
        this.categoryTour = categoryTour;
    }
    
    

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public long getCategoryTourId() {
        return categoryTourId;
    }

    public void setCategoryTourId(long categoryTourId) {
        this.categoryTourId = categoryTourId;
    }
    
    
}
