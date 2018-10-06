/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.data;

import com.mayu.model.Book;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MayuKogi
 */
public class BookDao {

    public static void saveBook(Book book) throws ClassNotFoundException, SQLException {
        try {
            DatabaseConnection dbConnection = new DatabaseConnection();
            Connection con = dbConnection.getConnection();

            Statement stmt = con.createStatement();
            String query = "INSERT INTO book_details(bookId,title,author,mainClassification,subClassification,yearOfPublishing,lastPrintedYear,isbnNo,noOfPages) VALUES ('" + book.getBookId() + "', '" + book.getBookTitle() + "', '" + book.getAuthor() + "','" + book.getMainClassification() + "','" + book.getSubClassification() + "','" + book.getYearOfPublishing() + "','" + book.getLastPrintedYear() + "','" + book.getISBNNo() + "','" + book.getNoOfPages() + "')";
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
