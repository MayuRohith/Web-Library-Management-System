<%-- 
    Document   : subClassification
    Created on : Aug 2, 2018, 12:25:14 AM
    Author     : MayuKogi
--%>

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
        <form action="SubClassificationController" method="get">
            <table>
                
                <tr>
                    <td>Main Classification ID<td>:</td>
                    <td><input type="text" class="form-control" name="mainId" /></td>
                </tr>
                
                <tr>
                    <td>Sub Classification ID<td>:</td>
                    <td><input type="text" class="form-control" name="subId" /></td>
                </tr>
                <tr>
                    <td>Sub Classification <td>:</td>
                    <td><input type="text" class="form-control" name="subclass" /></td>
                </tr>
                
                <tr>
                    <td colspan="10" rowspan="20" align="right"><input class="btn btn-primary" type="submit" value="Save"></td>
                </tr>
                
            </table>
           
        </form>
        </div>
        </center>
    </body>
</html>
