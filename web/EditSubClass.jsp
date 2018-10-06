<%-- 
    Document   : subClassification
    Created on : Aug 2, 2018, 12:25:14 AM
    Author     : MayuKogi
--%>

<%@page import="com.mayu.model.SubClassification"%>
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
        <div class="container" style="padding-top:100px">
        <form action="SubEditController" method="post">
            <table>
                <% if (request.getAttribute("subClass")!= null){
                    SubClassification sub = (SubClassification)request.getAttribute("subClass");
                %>
                <tr>
                    <td>Main Classification ID<td>:</td>
                    <td><input type="text" class="form-control" name="mainId" value="<%= sub.getMainId() %>"/></td>
                </tr>
                
                <tr>
                    <td>Sub Classification ID<td>:</td>
                    <td><input type="text" class="form-control" name="subId" value="<%= sub.getSubId() %>"/></td>
                </tr>
                <tr>
                    <td>Sub Classification <td>:</td>
                    <td><input type="text" class="form-control" name="subclass" value="<%= sub.getSubClassification() %>"/></td>
                </tr>               
            </table>
                <input class="btn btn-primary" type="submit" value="Update">
                <a href="EditSub.jsp" class="btn btn-danger"> Back  </a>
        </form>
        </div>
        </center>
    </body>
</html>
