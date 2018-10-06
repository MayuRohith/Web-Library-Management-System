<%-- 
    Document   : viewSubClassification
    Created on : 05/08/2018, 1:12:30 PM
    Author     : Mayuran
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Content/bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <script src="Content/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>

        <title>JSP Page</title>


    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="container-fluid" style="padding-top:20px" >
            
            <h4 align="center"style="color: darkslateblue">  View Sub Classification </h4>

            <%
                String id = request.getParameter("sub_id");
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
                        <tr>
                            <th scope="col" style="color: gold" class="text-center">Sub Id</th>
                            <th scope="col" style="color: gold" class="text-center">Sub Classification</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                connection = DriverManager.getConnection(DB_URL, userId, password);
                                statement = connection.createStatement();
                                String sql = "SELECT * FROM sub_classification";
                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
                        <tr>
                            <td class="text-center"><%=resultSet.getString("sub_id")%></td>
                            <td class="text-center"><%=resultSet.getString("sub_Classification")%></td>
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
