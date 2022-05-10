/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.controller.search;

import com.pnttour.travelproject.model.PageFormInfor;
import com.pnttour.travelproject.model.TourFrontEnd;
import com.pnttour.travelproject.service.TourService;
import com.pnttour.travelproject.utils.FormUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "SearchTour", urlPatterns = {"/search","/SearchTour"})
public class SearchTour extends HttpServlet {
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
        PageFormInfor page = FormUtil.toModel(PageFormInfor.class, request);
        
        List<TourFrontEnd> tours = tourService.getQueryTourInfo(page);
        if(tours==null){
            tours = new ArrayList<>();
        }
        
        if(page.getAmountOfItems()<=0){
            page.setAmountOfItems(2);
        }
      
        request.setAttribute("Tours", tours);
        request.setAttribute("Page", page);
        request.setAttribute("Cate", tourService.findAllCategory());
        request.setAttribute("AvailTour", tourService.findAllAvailTour());
        request.getRequestDispatcher("search.jsp").forward(request, response);
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
        PageFormInfor page = FormUtil.toModel(PageFormInfor.class, request);
        page.setMaxItemsInPage(6);
        System.out.println(page);
        List<TourFrontEnd> tours = tourService.getQueryTourInfo(page);
        if(tours==null){
            tours = new ArrayList<>();
        }
        request.setAttribute("Tours", tours);
        request.setAttribute("Page", page);
        request.setAttribute("Cate", tourService.findAllCategory());
        request.setAttribute("AvailTour", tourService.findAllAvailTour());
        request.getRequestDispatcher("search.jsp").forward(request, response);
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
