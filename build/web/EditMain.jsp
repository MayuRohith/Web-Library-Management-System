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
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
       
        <title>JSP Page</title>

         <style type="text/css">
            .table-wrapper {
                background: #fff;
                padding: 20px;
                margin: 30px 0;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 10px;
                margin: 0 0 10px;
            }
            .table-title h2 {
                margin: 8px 0 0;
                font-size: 22px;
            }
            .search-box {
                position: relative;        
                float: right;
            }
            .search-box input {
                height: 34px;
                border-radius: 20px;
                padding-left: 35px;
                border-color: #ddd;
                box-shadow: none;
            }
            .search-box input:focus {
                border-color: #3FBAE4;
            }
            .search-box i {
                color: #a0a5b1;
                position: absolute;
                font-size: 19px;
                top: 8px;
                left: 10px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child {
                width: 130px;
            }
            table.table td a {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
            }
            table.table td a.view {
                color: #03A9F4;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #E34724;
            }
            table.table td i {
                font-size: 19px;
            }    
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 95%;
                width: 30px;
                height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 30px !important;
                text-align: center;
                padding: 0;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 6px;
                font-size: 95%;
            }    
        </style>
        
     </head>
        <body>
             <%@include file="Header.jsp" %>
           
            <div class="container-fluid" style="padding-top:20px">
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
                            <tr>
                                <th scope="col" style="color: gold"class="text-center" >Main Id</th>
                                <th scope="col" style="color: gold"class="text-center">Main Classification</th>
                                <th scope="col" style="color: gold"class="text-center">Edit</th>
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
                                <td class="text-center">
                                    <a href="EditMainClassificationController?main_id=<%=resultSet.getString("main_id")%>" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a href="#" class="delete" title="Delete" data-toggle="tooltip" ><i class="material-icons">&#xE872;</i></a>
                                </td>
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


