/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.data;

import com.mayu.model.SubClassification;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MayuKogi
 */
public class SubClassificationDao {

    /**
     *
     * @param sc
     * @throws ClassNotFoundException
     */
    public static void saveSubClass(SubClassification sc) throws ClassNotFoundException{
         try { 
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection con = dbConnection.getConnection();
        
        Statement stmt =con.createStatement();
            String query ="INSERT INTO sub_classification(main_id,sub_id,sub_classification) VALUES ('"+sc.getMainId()+"','" + sc.getSubId() + "', '" + sc.getSubClassification() +"')";
            stmt.executeUpdate(query);
        } 
        catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
