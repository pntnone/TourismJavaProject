/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.controller.tour;

import com.pnttour.travelproject.model.Tour;
import com.pnttour.travelproject.service.TourService;
import com.pnttour.travelproject.utils.FormUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateTourAdmin", urlPatterns = {"/admin-tour-update","/UpdateTourAdmin"})
public class UpdateTourAdmin extends HttpServlet {

    @Inject
    TourService tourService;
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
        String id = request.getParameter("id");
        Tour tour = tourService.getTourById(Long.valueOf(id));
        request.setAttribute("Tour", tour);
        request.setAttribute("AvailTours", tourService.findAllAvailTour());
        request.getRequestDispatcher("./tour/updateTour.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        Tour tour = FormUtil.toModel(Tour.class, request);
        tour.setModifiedDate(new Date(System.currentTimeMillis()));
        tourService.update(tour.getId(), tour);
        response.sendRedirect("./admin-tours");
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
