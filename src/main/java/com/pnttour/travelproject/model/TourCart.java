/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.model;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TourCart {

    private Hashtable<Long, Tour> tourMap;
    private Tour currentTour;

    public Tour getCurrentTour() {
        return currentTour;
    }

    public void setCurrentTour(Tour currentTour) {
        this.currentTour = currentTour;
    }
    
    

    public TourCart(Tour tour) {
        tourMap = new Hashtable<>();

        if (isFull(tour)) {
            return;
        }
        currentTour = tour;
        tourMap.put(tour.getId(), tour);
    }

    public List<Tour> getTours() {
        List<Tour> tours = new ArrayList<>(tourMap.values());
        return tours;
    }

    public Hashtable<Long, Tour> getTourMap() {
        return tourMap;
    }

    public void setTourMap(Hashtable<Long, Tour> tourMap) {
        this.tourMap = tourMap;
    }

    public boolean isFull(Tour tour) {
        return tour.getCurAmount() + tour.getAmountInCart() == tour.getMaxAmount();
    }

    public Long contains(long id) {
        for (Long idf : tourMap.keySet()) {
            if (idf == id) {
                currentTour = tourMap.get(idf);
                return idf;
            }
        }

        return null;
    }

    public void processCart(Tour tour, String action) {

        Long idF = contains(tour.getId());

        if (idF != null) {
            if (action == null || action.equals("plus")) {
                if (isFull(tour)) {
                    return;
                }
                currentTour.setAmountInCart(currentTour.getAmountInCart() + 1);
            } else if (action.equals("minus")) {
                if (currentTour.getAmountInCart() > 1) {
                    currentTour.setAmountInCart(currentTour.getAmountInCart() - 1);
                } else {
                    currentTour.setAmountInCart(0);
                    tourMap.remove(idF);
                }
            } else if (action.equals("huy")) {
                tourMap.remove(idF);
            }
        } else {
            currentTour = tour;
            currentTour.setAmountInCart(1);
            tourMap.put(tour.getId(), currentTour);
        }

    }

    public int getAmountOfItems() {
        int amount = 0;
        for (Tour tour : tourMap.values()) {
            amount += tour.getAmountInCart();
        }

        return amount;
    }

    public long getPriceAllItems() {
        int amount = 0;
        for (Tour tour : tourMap.values()) {
            amount += tour.getAmountInCart() * tour.getPrice();
        }
        
        System.out.println(amount);
        return amount;
    }
    

}
