<%-- 
    Document   : AddBook
    Created on : Jul 29, 2018, 10:51:56 AM
    Author     : MayuKogi
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <center>
        <%@include file="Header.jsp" %>
        <div class="container-fluid" style="padding-top:20px">
           
            <form action="UpdateController" method="post">
                <table>
                    <c:forEach items="${bookListAttribute}" var="bookList">
                        <tr>
                            <td><h3><span class="badge badge-outline-secondary">Book Id</span></h3><td><h3><span class="badge badge-outline-info">:</span></h3></td>

                            <td><input type="text" class="form-control" value="${bookList.getBookId()}" name="bookId" readonly/></td>
                        </tr>

                        <tr>
                            <td><h3><span class="badge badge-outline-secondary" >Title</span></h3><td><h3><span class="badge badge-outline-info">:</span></h3></td>

                            <td><input type="text" class="form-control" name="bookTitle" value="${bookList.getBookTitle()}"/></td>
                        </tr>
                        <tr>
                            <td><h3><span class="badge badge-outline-secondary">Author</span></h3><td><h3><span class="badge badge-outline-info">:</span></h3></td>

                            <td><input type="text" class="form-control" name="author" value="${bookList.getAuthor()}"/></td>
                        </tr>

                        <tr>
                            <td><h3><span class="badge badge-outline-secondary">Main Classification</span></h3><td><h3><span class="badge badge-outline-info">:</span></h3></td>

                            <td> 

                                <select class="form-control" name="main_classification" id="main_classification"  >
                                   <option value="0" >Select Main Classification</option>
                                        <c:forEach items="${mainClassificationList}" var="mainstatus" >
                                            <option value="${mainstatus}" value="${bookList.getMainClassification()}"<c:if test="${mainstatus eq main_classification}">Selected="True"</c:if>>${mainstatus}</option>
                                        </c:forEach>
                                    
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><h3><span class="badge badge-outline-secondary">Sub Classification</span></h3><td><h3><span class="badge badge-outline-info">:</span></h3></td>
                            <td>
                                <select name="sub_classification"  class="form-control" value="${bookList.getSubClassification()}">
                                       <option value="0" >Select Sub Classification</option>
                                        <c:forEach items="${subClassificationList}" var="substatus" >
                                            <option value="${substatus}" >${substatus}</option>
                                        </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td><h3><span class="badge badge-outline-secondary">Year of Publishing</span></h3><td><h3><span class="badge badge-outline-info">:</span></h3></td>

                            <td><input type="text" class="form-control" name="yop" value="${bookList.getYearOfPublishing()}"/></td>
                        </tr>

                        <tr>
                            <td><h3><span class="badge badge-outline-secondary">Last Printed Year</span></h3><td><h3><span class="badge badge-outline-info">:</span></h3></td>
                            <td><input type="text" class="form-control" name="lpy" value="${bookList.getLastPrintedYear()}"/></td>
                        </tr>

                        <tr>
                            <td><h3><span class="badge badge-outline-secondary">ISBN No</span></h3><td><h3><span class="badge badge-outline-info">:</span></h3></td>

                            <td><input type="text" class="form-control" name="isbn" value="${bookList.getISBNNo()}"/></td>
                        </tr>

                        <tr>
                            <td><h3><span class="badge badge-outline-secondary">No of Pages</span></h3><td><h3><span class="badge badge-outline-info">:</span></h3></td>

                            <td><input type="text" class="form-control" name="nop" value="${bookList.getNoOfPages()}"/></td>
                        </tr>

                    </c:forEach>
                </table>

                <input class="btn btn-primary" type="submit" value="Update" colspan="3" rowspan="10"  /></i>

                <a href="Edit.jsp" class="btn btn-primary" colspan="3" rowspan="10" align="Center">Back</a>

                
            </form>
        </div>
    </center>
</body>
</html>
