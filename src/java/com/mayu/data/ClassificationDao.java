package com.mayu.data;

import com.mayu.model.MainClassification;
import com.mayu.model.SubClassification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MayuKogi
 */
public class ClassificationDao {

    public List mainClass() throws ClassNotFoundException {
        List<MainClassification> classificationList = new ArrayList<>();
        try {
            DatabaseConnection conn = new DatabaseConnection();
            Connection Con = conn.getConnection();
            String query = "select * from main_classification";
            Statement stmt = Con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                MainClassification main = new MainClassification();
                main.setMainId(rs.getString("main_id"));
                main.setMainClassification(rs.getString("main_classification"));
                classificationList.add(main);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return classificationList;
    }

    public List subClass() throws ClassNotFoundException {
        List<SubClassification> sclassificationList = new ArrayList<>();
        try {
            DatabaseConnection conn = new DatabaseConnection();
            Connection con = conn.getConnection();
            String query = "select * from sub_classification";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                SubClassification sub = new SubClassification();
                sub.setSubId(rs.getString("sub_id"));
                sub.setSubClassification(rs.getString("sub_classification"));
                sclassificationList.add(sub);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return sclassificationList;
    }

    public List Subname(String mId) throws ClassNotFoundException {
        List<SubClassification> subclassList = new ArrayList<>();
        try {
            DatabaseConnection conn = new DatabaseConnection();
            Connection con = conn.getConnection();
            String query = "SELECT * FROM sub_classification WHERE main_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, mId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                SubClassification sub = new SubClassification();
                sub.setSubId(rs.getString("sub_id"));
                sub.setSubClassification(rs.getString("sub_classification"));
                subclassList.add(sub);
            }

        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return subclassList;
    }
}
