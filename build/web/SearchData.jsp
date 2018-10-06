<%-- 
    Document   : SearchData
    Created on : Aug 4, 2018, 7:50:27 AM
    Author     : MayuKogi
--%>

<%@page import="java.sql.DriverManager"%>
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

        
            <title>JSP Page</title>
        </head>
        <body>
             <%@include file="Header.jsp" %>
           
                    <%
                        String id = request.getParameter("bookId");
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

                    <nav class="navbar navbar-light bg-light">
                        <form class="form-inline">

                            <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

                           
                            <table class="table table-hover table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">Book Id</th>
                                        <th scope="col">Title</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">M Classification</th>
                                        <th scope="col">S Classification</th>
                                        <th scope="col">Last Printed year</th>
                                        <th scope="col">year of publishing</th>
                                        <th scope="col">ISBN No</th>
                                        <th scope="col">No of Pages</th>
                                    </tr>
                                </thead>


                                <%
                                    try {
                                        connection = DriverManager.getConnection(DB_URL, userId, password);
                                        statement = connection.createStatement();
                                        String sql = "SELECT * FROM book_details where bookId= '" + request.getParameter("search") + "'|| author= '" + request.getParameter("search") + "'";
                                        resultSet = statement.executeQuery(sql);
                                        while (resultSet.next()) {
                                %>
                                <tr>
                                    <td><%=resultSet.getString("bookId")%></td>
                                    <td><%=resultSet.getString("title")%></td>
                                    <td><%=resultSet.getString("author")%></td>
                                    <td><%=resultSet.getString("mainClassification")%></td>
                                    <td><%=resultSet.getString("subClassification")%></td>
                                    <td><%=resultSet.getString("yearOfPublishing")%></td>
                                    <td><%=resultSet.getString("lastPrintedYear")%></td>
                                    <td><%=resultSet.getString("isbnNo")%></td>
                                    <td><%=resultSet.getString("noOfPages")%></td>
                                </tr>

                                <%
                                        }

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </table>    
                        </form>
                    </nav>
            </body>
        </html>
