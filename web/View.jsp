<%-- 
    Document   : View
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
        <title>JSP Page</title>
        <!-- Bootstrap core CSS -->

        <!-- Bootstrap core CSS -->
        <link href="Temp/startbootstrap-simple-sidebar-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="Temp/startbootstrap-simple-sidebar-gh-pages/css/simple-sidebar.css" rel="stylesheet">
    </head>
        <body>
            <%@include file="Header.jsp" %>
            <div class="container-fluid" style="padding-top:20px">
                    
                    <div id="rightsidepane" class="myclass">
                        <h4 align="center"style="color: darkslateblue">  Book Details   </h4>

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

                        <table class="table table-hover table-dark">
                            <thead>
                                <tr>
                                    <th scope="col" style="color: gold">Book Id</th>
                                    <th scope="col" style="color: gold">Title</th>
                                    <th scope="col" style="color: gold">Author</th>
                                    <th scope="col" style="color: gold">M Classification</th>
                                    <th scope="col" style="color: gold">S Classification</th>
                                    <th scope="col" style="color: gold">Last Printed year</th>
                                    <th scope="col" style="color: gold">year of publishing</th>
                                    <th scope="col" style="color: gold">ISBN No</th>
                                    <th scope="col" style="color: gold">No of Pages</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        connection = DriverManager.getConnection(DB_URL, userId, password);
                                        statement = connection.createStatement();
                                        String sql = "SELECT * FROM book_details";
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


