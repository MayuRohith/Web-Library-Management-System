/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.controller;

import com.mayu.data.EditMainDao;
import com.mayu.model.MainClassification;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mayuran
 */
@WebServlet(name = "MainUpdateController", urlPatterns = {"/MainUpdateController"})
public class MainUpdateController extends HttpServlet {
    EditMainDao editMainDao = new EditMainDao();
    MainClassification mainclassification = new MainClassification();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String mainId= request.getParameter("mainId");
            String mainClass = request.getParameter("mainclass");
            
            mainclassification.setMainId(mainId);
           mainclassification.setMainClassification(mainClass);
            
            
            EditMainDao.editMain(mainclassification);
            
            request.setAttribute("mainclassi", mainclassification);
            request.setAttribute("mainId", mainclassification.getMainId());
            request.getRequestDispatcher("EditMain.jsp").forward(request, response);
            
            //processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
