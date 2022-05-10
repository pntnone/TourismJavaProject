/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.controller.availtour;

import com.pnttour.travelproject.model.AvailTour;
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
@WebServlet(name = "AvailTourUpdate", urlPatterns = {"/avail-tour-update","/AvailTourUpdate"})
public class AvailTourUpdate extends HttpServlet {


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
        AvailTour av = tourService.findAvailTour(Long.valueOf(id));
        request.setAttribute("Tour", av);
        request.getRequestDispatcher("./availtour/updateAvail.jsp").forward(request, response);
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
        AvailTour av = FormUtil.toModel(AvailTour.class, request);
        av.setModifiedDate(new Date(System.currentTimeMillis()));
        tourService.updateAvailTour(av.getId(), av);
        response.sendRedirect("./avail-tour-list");
        
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
