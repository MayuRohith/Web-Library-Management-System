/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mayuran
 */
public class DeleteDao {
    public static void deleteBook(String bookid) throws ClassNotFoundException, SQLException{
    try { 
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection con = dbConnection.getConnection();
       
        PreparedStatement ps=null;
       
       String sql = "DELETE from book_details where bookId= ?";
        ps=con.prepareStatement(sql);
        ps.setString(1, bookid);
        ps.executeUpdate();
        
        } 
        catch (SQLException ex) {
            Logger.getLogger(DeleteDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
