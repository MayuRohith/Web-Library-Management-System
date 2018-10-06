<%-- 
    Document   : mainClassification
    Created on : Jul 30, 2018, 7:08:34 PM
    Author     : MayuKogi
--%>

<%@page import="com.mayu.model.MainClassification"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Content/bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <script src="Content/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        <style>
            td{
                padding-top:15px;
            }
        </style>  
        
    </head>
    <body>
        <%@include file="Header.jsp" %>
         <div class="container-fluid" style="padding-top:20px">
        
    <center>
        
        <form action="MainUpdateController" method="post">
            <table>
                <% if (request.getAttribute("mainClass")!= null){
                    MainClassification main = (MainClassification)request.getAttribute("mainClass");
                %>
                <tr>
                    <td>Main Classification ID<td>:</td>
                    <td><input type="text" class="form-control" name="mainId" value="<%= main.getMainId() %>" readonly /></td>
                </tr>
                <tr>
                    <td>Main Classification <td>:</td>
                    <td><input type="text" class="form-control" name="mainclass" value="<%= main.getMainClassification()%>" /></td>
                </tr>
                <%}%>
            </table>
           
                <input class="btn btn-primary" type="submit" value="Update">
                <a href="EditMain.jsp" class="btn btn-danger"> Back  </a>
              
              
        </form>
        </div>
        </center>
    </body>
</html>
