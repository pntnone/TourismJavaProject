/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.pnttour.travelproject.model.Tour;
import com.pnttour.travelproject.model.TourCart;
import com.pnttour.travelproject.service.TourService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart","/CartServlet"})
public class CartServlet extends HttpServlet {
    
    @Inject
    TourService tourService;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Tour tour = tourService.getTourById(Long.valueOf(id));
        if(session.getAttribute("Cart") == null){
            session.setAttribute("Cart", new TourCart(tour));
        }
        
        TourCart cart = (TourCart) session.getAttribute("Cart");
        cart.processCart(tour,action);
        
        JsonObject obj = new JsonObject();
        obj.addProperty("amount", cart.getAmountOfItems());
        obj.addProperty("cartVolume", cart.getCurrentTour().getAmountInCart());
        obj.addProperty("curVolume", cart.getCurrentTour().getCurAmount());
        obj.addProperty("maxVolume", cart.getCurrentTour().getMaxAmount());
        obj.addProperty("allPrice", cart.getPriceAllItems());
        System.out.println(obj.toString());
        response.getWriter().print(obj.toString());
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
