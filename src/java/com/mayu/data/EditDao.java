/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.data;

import com.mayu.model.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mayuran
 */
public class EditDao {
    public static void editBook(Book book) throws ClassNotFoundException, SQLException{
        try { 
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection con = dbConnection.getConnection();
        
        Statement stmt =con.createStatement();
       String sql = "UPDATE book_details SET "
            + "title='" + book.getBookTitle() + "' ,"
            + "author='"+book.getAuthor()+"' ,"
            + "mainClassification='"+book.getMainClassification()+"' ,"
            + "subClassification='"+book.getSubClassification()+"' ,"
            + "yearOfPublishing='"+book.getYearOfPublishing()+"' ,"
            + "lastPrintedYear='"+book.getLastPrintedYear()+"' ,"
            + "isbnNo='"+book.getISBNNo()+"' ,"
            + "noOfPages='"+book.getNoOfPages()+"' "
            + "WHERE bookId='" + book.getBookId() + "' ";
            stmt.executeUpdate(sql);
        } 
        catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static ArrayList viewBookById(String bookId) throws ClassNotFoundException, SQLException{
       ArrayList<Book> bookList = new ArrayList<>();
        try { 
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection con = dbConnection.getConnection();
        PreparedStatement pstmt;
        Statement stmt =con.createStatement();
       String sql = "SELECT * FROM book_details WHERE bookId = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, bookId);
        ResultSet rs = pstmt.executeQuery();
       
       while(rs.next()){
           Book book = new Book();
           book.setBookId(rs.getString("bookId"));
           book.setBookTitle(rs.getString("title"));
           book.setAuthor(rs.getString("author"));
           book.setMainClassification(rs.getString("mainClassification"));
           book.setSubClassification(rs.getString("subClassification"));
           book.setYearOfPublishing(rs.getString("yearOfPublishing"));
           book.setLastPrintedYear(rs.getString("lastPrintedYear"));
           book.setISBNNo(rs.getString("isbnNo"));
           book.setNoOfPages(rs.getString("noOfPages"));
           
           bookList.add(book);
       }
        } 
        catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return bookList;
        
    }
    
}
