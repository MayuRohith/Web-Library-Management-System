/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import com.mayu.data.BookDao;
import com.mayu.data.ClassificationDao;
import com.mayu.model.Book;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MayuKogi
 */
@WebServlet(name = "BookController", urlPatterns = {"/BookController"})
public class BookController extends HttpServlet {

    Book book = new Book();
    BookDao bookDao = new BookDao();
    ClassificationDao classC =new ClassificationDao();

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println(request.getParameter("bookId"));
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
            book.setBookId(request.getParameter("bookId"));
            book.setAuthor(request.getParameter("author"));
            book.setBookTitle(request.getParameter("bookTitle"));
            book.setMainClassification(request.getParameter("main_classification"));
            book.setSubClassification(request.getParameter("sub_classification"));
            book.setYearOfPublishing(request.getParameter("yop"));
            book.setLastPrintedYear(request.getParameter("lpy"));
            book.setISBNNo(request.getParameter("isbn"));
            book.setNoOfPages(request.getParameter("nop"));
            //String s=request.getParameter("bookId");
            //processRequest(request, response);
            BookDao.saveBook(book);
            
            request.getRequestDispatcher("ListController").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BookController.class.getName()).log(Level.SEVERE, null, ex);
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
        //request.getRequestDispatcher("ListController").forward(request, response); // processRequest(request, response);
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
