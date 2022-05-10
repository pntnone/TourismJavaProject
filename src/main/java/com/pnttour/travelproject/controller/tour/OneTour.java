/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.controller.tour;

import com.pnttour.travelproject.model.AvailTour;
import com.pnttour.travelproject.model.CommentFE;
import com.pnttour.travelproject.model.TourFrontEnd;
import com.pnttour.travelproject.service.CommentService;
import com.pnttour.travelproject.service.TourService;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "OneTour", urlPatterns = {"/tour","/OneTour"})
public class OneTour extends HttpServlet {
    
    @Inject
    TourService tourService;
    
    @Inject
    CommentService cmtService;
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
        String idStr = request.getParameter("id");
        if(idStr==null){
            response.sendRedirect("errorpage.jsp");
        }
        int id = Integer.valueOf(idStr);
        TourFrontEnd tour = tourService.getOneTourInfo(id);
        if(tour==null){
            response.sendRedirect("errorpage.jsp");
        }
            List<AvailTour> availTours = tourService.findRelateAvailTour(tour.getDeparture());
        if(availTours.size()>5){
            availTours = availTours.subList(0, 5);
        }
        List<CommentFE> cmts = cmtService.findAllCommentsByTourIdFE(tour.getId());
        System.out.println(tour.getId());
        System.out.println(cmts.size());
        request.setAttribute("Comments", cmts);
        request.setAttribute("Tour",tour);
        request.setAttribute("AvailTours", availTours);
        request.getRequestDispatcher("./tour.jsp").forward(request, response);
        
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
