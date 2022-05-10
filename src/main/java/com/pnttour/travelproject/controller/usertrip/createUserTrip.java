/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.controller.usertrip;

import com.pnttour.travelproject.dao.UserTripDAO;
import com.pnttour.travelproject.model.Account;
import com.pnttour.travelproject.model.Tour;
import com.pnttour.travelproject.model.TourCart;
import com.pnttour.travelproject.model.UserTrip;
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
@WebServlet(name = "createUserTrip", urlPatterns = {"/createUserTrip"})
public class createUserTrip extends HttpServlet {

    @Inject
    UserTripDAO userTripDAO;
    
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
        try (PrintWriter out = response.getWriter()) {
           
            HttpSession session = request.getSession();
            if (session.getAttribute("Cart") == null) {
                 request.getRequestDispatcher("./tourCartInfor.jsp").include(request, response);
                String notice = "<p class=\"btn btn-danger\"> Không Có Tour Để Thanh Toán </p> ";
                out.println("<script> $('#notice').html('" + notice + " ');  </script>");
                return;
            }
            TourCart cart = (TourCart) session.getAttribute("Cart");
            
            if(cart.getAmountOfItems()==0){
                 request.getRequestDispatcher("./tourCartInfor.jsp").include(request, response);
                  String notice = "<p class=\"btn btn-danger\"> Không Có Tour Để Thanh Toán </p> ";
                out.println("<script> $('#notice').html('" + notice + " ');  </script>");
                return;
            }
            
            Account acc = (Account)session.getAttribute("User");
            
            for (Tour tour : cart.getTours()) {
                UserTrip ut = new UserTrip();
                ut.setAccountId(acc.getId());
                ut.setTourId(tour.getId());
                ut.setAmount(tour.getAmountInCart());
                tour.setCurAmount(tour.getCurAmount() + tour.getAmountInCart());
                tourService.update(tour.getId(), tour);
                userTripDAO.create(ut);
            }
            session.removeAttribute("Cart");
             request.getRequestDispatcher("./tourCartInfor.jsp").include(request, response);
            String notice = "<p class=\"btn btn-success\"> Thanh Toán Thành Công </p> ";
            out.println("<script> $('#notice').html('" + notice + " ');  </script>");
            
        }
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
