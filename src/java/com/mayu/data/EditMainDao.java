/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.data;

import com.mayu.model.MainClassification;
import java.sql.Connection;
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
public class EditMainDao {
    public static void editMain(MainClassification mainclassification) throws ClassNotFoundException, SQLException{
        try { 
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection con = dbConnection.getConnection();
        
        Statement stmt =con.createStatement();
       String sql = "UPDATE main_classification SET "
            + "main_classification='" + mainclassification.getMainClassification() + "' "
            + "WHERE main_id='" + mainclassification.getMainId() + "' ";
            stmt.executeUpdate(sql);
        } 
        catch (SQLException ex) {
            Logger.getLogger(EditMainDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static MainClassification viewMainClassById(String main_Id) throws ClassNotFoundException, SQLException{
        MainClassification mainclassification = new MainClassification();
        try { 
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection con = dbConnection.getConnection();
        
        Statement stmt =con.createStatement();
       String sql = "SELECT * FROM main_classification WHERE main_id='" + main_Id + "'";
        
       ResultSet rs = stmt.executeQuery(sql);
      
       while(rs.next()){           
           mainclassification.setMainId(rs.getString("main_id"));
           mainclassification.setMainClassification(rs.getString("main_classification"));          
       }
       con.close();
        } 
        catch (SQLException ex) {
            Logger.getLogger(EditMainDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return mainclassification;
        
    }
    
}


