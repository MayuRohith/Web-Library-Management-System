/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.controller;

import com.mayu.data.EditDao;
import static com.mayu.data.EditDao.editBook;
import com.mayu.model.Book;
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
@WebServlet(name = "UpdateController", urlPatterns = {"/UpdateController"})
public class UpdateController extends HttpServlet {
    EditDao editDao = new EditDao();
    Book book = new Book();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String bookId= request.getParameter("bookId");
            String bookTitle = request.getParameter("bookTitle");
            String author = request.getParameter("author");
            String mainClassification = request.getParameter("main_classification");
            String subClassification = request.getParameter("sub_classification");
            String yearOfPublishing = request.getParameter("yop");
            String lastPrintedYear = request.getParameter("lpy");
            String isbnNo = request.getParameter("isbn");
            String noOfPages = request.getParameter("nop");
            
            book.setBookId(bookId);
            book.setBookTitle(bookTitle);
            book.setAuthor(author);
            book.setMainClassification(mainClassification);
            book.setSubClassification(subClassification);
            book.setYearOfPublishing(yearOfPublishing);
            book.setLastPrintedYear(lastPrintedYear);
            book.setISBNNo(isbnNo);
            book.setNoOfPages(noOfPages);
            
            
            editDao.editBook(book);
            
            request.setAttribute("Book", book);
            request.setAttribute("bookId", book.getBookId());
            request.getRequestDispatcher("Edit.jsp").forward(request, response);
            
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
