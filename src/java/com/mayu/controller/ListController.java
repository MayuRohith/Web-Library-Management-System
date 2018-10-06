/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.controller;

import com.mayu.data.ClassificationDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MayuKogi
 */
@WebServlet(name = "ListController", urlPatterns = {"/ListController"})
public class ListController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          

               request.setAttribute("bookId", request.getParameter("bookId"));
               request.setAttribute("bookTitle",request.getParameter("bookTitle"));
               request.setAttribute("author", request.getParameter("author"));
               request.setAttribute("mainClassification", request.getParameter("main_classification"));
               request.setAttribute("subClassification", request.getParameter("sub_classification"));
               request.setAttribute("yearOfPublishing", request.getParameter("yop"));
               request.setAttribute("lastPrintedYear", request.getParameter("lpy"));
               request.setAttribute("isbnNo", request.getParameter("isbn"));
               request.setAttribute("noOfPages", request.getParameter("nop"));
               
            String mname=request.getParameter("main_classification");
            request.setAttribute("main_classification", mname);
            ClassificationDao classDao = new ClassificationDao();
            List x;
            
            if (request.getAttribute("subClassList")!= null){            
                x = (List)request.getAttribute("subClassList");
            } else{
                x = classDao.subClass();
                
            }
             List y = classDao.mainClass();
             
             request.setAttribute("mainClassificationList", y);
             request.setAttribute("subClassificationList", x);
           //request.setAttribute("bookObject", book);
             
             ServletContext context= getServletContext();
            RequestDispatcher rd= context.getRequestDispatcher("/AddBook.jsp");
            rd.forward(request, response);
            
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ListController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
//        try {
//            request.setAttribute("bookId", request.getParameter(""));
//               request.setAttribute("bookTitle",request.getParameter(""));
//               request.setAttribute("author", request.getParameter(""));
//               request.setAttribute("mainClassification", request.getParameter(""));
//               request.setAttribute("subClassification", request.getParameter(""));
//               request.setAttribute("yearOfPublishing", request.getParameter(""));
//               request.setAttribute("lastPrintedYear", request.getParameter(""));
//               request.setAttribute("isbnNo", request.getParameter(""));
//               request.setAttribute("noOfPages", request.getParameter(""));
//            processRequest(request, response);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(ListController.class.getName()).log(Level.SEVERE, null, ex);
//        }

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
