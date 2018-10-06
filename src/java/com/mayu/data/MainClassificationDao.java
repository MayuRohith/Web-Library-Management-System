/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.data;
import com.mayu.model.MainClassification;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MayuKogi
 */
public class MainClassificationDao {
    public static void saveMainClass(MainClassification mc) throws ClassNotFoundException{
         try { 
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection con = dbConnection.getConnection();
        
        Statement stmt =con.createStatement();
            String query ="INSERT INTO main_classification(main_id,main_classification) VALUES ('" + mc.getMainId() + "', '" + mc.getMainClassification() +"')";
            stmt.executeUpdate(query);
        } 
        catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
        
    }
    

