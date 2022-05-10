/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.controller;


import com.pnttour.travelproject.dao.AccountDAO;
import com.pnttour.travelproject.imp.AccountDAOImp;
import com.pnttour.travelproject.model.Account;
import com.pnttour.travelproject.service.AccountService;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login", "/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    @Inject
    AccountService accService;
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
        
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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username != null && password != null && !username.equals("") && !password.equals("")) {
                Account account = accService.findOne(username, password);
                if (account != null) {
                    request.getSession().setAttribute("User", account);
                    String roleName = accService.getRole(account).getName();
                    request.getSession().setAttribute("RoleUser",roleName);
                    
                    String uriBefore = (String)request.getParameter("beforeUri");
                    if(uriBefore == null){
                        response.sendRedirect("./home");
                    }
                    else{
                        response.sendRedirect("." + uriBefore);
                    }
                    return;
                } 
            }
            request.getRequestDispatcher("login.jsp").include(request, response);
            out.print("<script> document.getElementById(\"saimk\").style.display = \"block\"  </script>");
        }

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
