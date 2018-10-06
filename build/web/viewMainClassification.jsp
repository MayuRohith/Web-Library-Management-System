<%-- 
    Document   : viewMainClassification
    Created on : Jul 30, 2018, 3:07:47 PM
    Author     : MayuKogi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Content/bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <!--        <link rel="stylesheet" href="fontawesome/fontawesome-free-5.2.0-web/css/fontawesome.min.css" >
                <script src="fontawesome/fontawesome-free-5.2.0-web/js/fontawesome.min"></script>-->
        <script src="Content/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
<!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->

        <title>JSP Page</title>
        </head>
        <body>
            <%@include file="Header.jsp" %>
            <div class="container-fluid" style="padding-top:20px">
                    
                    <h4 align="center" style="color: darkslateblue">  View Main Classification </h4>

                    <%
                        String id = request.getParameter("main_id");
                        String driverName = "com.mysql.jdbc.Driver";
                        String DB_URL = "jdbc:mysql://localhost/libraryser?useSSL=false";
                        String userId = "root";
                        String password = "root";

                        try {
                            Class.forName(driverName);
                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                        }

                        Connection connection = null;
                        Statement statement = null;
                        ResultSet resultSet = null;
                    %>
                    <div class="col-md-6 offset-3">
                    <table class="table table-hover table-dark" >
                        <thead>
                            <tr style="background-color: graytext">
                                <th scope="col" style="color: gold"class="text-center" >Main Id</th>
                                <th scope="col" style="color: gold"class="text-center">Main Classification</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    connection = DriverManager.getConnection(DB_URL, userId, password);
                                    statement = connection.createStatement();
                                    String sql = "SELECT * FROM main_classification";
                                    resultSet = statement.executeQuery(sql);
                                    while (resultSet.next()) {
                            %>
                            <tr>
                                <td class="text-center"><%=resultSet.getString("main_id")%></td>
                                <td class="text-center"><%=resultSet.getString("main_Classification")%></td>
                        </tbody>
                        <%
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </table> 
                    </div>
            </body>
        </html>


