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
public class TourFrontEnd extends Tour {
    private String thumbnail;
    private String departure;
    private String destination;
    private String categoryName;
    private String categoryCode;

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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("title=").append(getTitle());
        sb.append(", thumbnail=").append(thumbnail);
        sb.append(", departure=").append(departure);
        sb.append(", destination=").append(destination);
        sb.append(", categoryName=").append(categoryName);
        sb.append(", categoryCode=").append(categoryCode);
        sb.append('}');
        return sb.toString();
    }
    
    
    
    
}
