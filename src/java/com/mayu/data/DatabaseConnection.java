/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author MayuKogi
 */
public class DatabaseConnection {
        /**
         * @param args the command line arguments
         */
        // JDBC driver name and database URL
        static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        static final String DB_URL = "jdbc:mysql://localhost/libraryser?useSSL=false";

        //  Database credentials
        static final String USER = "root";
        static final String PASS = "root";

        public Connection getConnection() throws ClassNotFoundException, SQLException{
            Connection conn = null;
            try {
                //STEP 2: Register JDBC driver
                Class.forName(JDBC_DRIVER);

                //STEP 3: Open a connection
                System.out.println("Connecting to a selected database...");
                conn = DriverManager.getConnection(DB_URL, USER, PASS);
                System.out.println("Connected database successfully...");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(com.mayu.data.DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
            return conn;
        }

//    Connection connect() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
   }

    

