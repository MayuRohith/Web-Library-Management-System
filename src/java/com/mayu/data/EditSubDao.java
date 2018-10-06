/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.data;

import com.mayu.model.MainClassification;
import com.mayu.model.SubClassification;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MayuKogi
 */
public class EditSubDao {
     public static void editSub(SubClassification subclassification) throws ClassNotFoundException, SQLException{
        try { 
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection con = dbConnection.getConnection();
        
        Statement stmt =con.createStatement();
       String sql = "UPDATE sub_classification SET "
            + "sub_classification='" + subclassification.getSubClassification() + "' ,"
               + "main_id='"+ subclassification.getMainId()+"' "
            + "WHERE sub_id='" + subclassification.getSubId() + "' ";
            stmt.executeUpdate(sql);
        } 
        catch (SQLException ex) {
            Logger.getLogger(EditMainDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static SubClassification viewSubClassById(String sub_Id) throws ClassNotFoundException, SQLException{
        SubClassification subclassification = new SubClassification();
        try { 
        DatabaseConnection dbConnection = new DatabaseConnection();
            try (Connection con = dbConnection.getConnection()) {
                Statement stmt =con.createStatement();
                String sql = "SELECT * FROM sub_classification WHERE sub_id='" + sub_Id + "'";
                
                ResultSet rs = stmt.executeQuery(sql);
                
                while(rs.next()){
                    subclassification.setMainId(rs.getString("main_id"));
                    subclassification.setSubId(rs.getString("sub_id"));
                    subclassification.setSubClassification(rs.getString("sub_classification"));
                    
                }    }
        } 
        catch (SQLException ex) {
            Logger.getLogger(EditMainDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return subclassification;
        
    }
    
}
