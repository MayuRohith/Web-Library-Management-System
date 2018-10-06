<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
   <!-- Bootstrap core CSS -->
    <link href="Temp/startbootstrap-simple-sidebar-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="Temp/startbootstrap-simple-sidebar-gh-pages/css/simple-sidebar.css" rel="stylesheet">
    
</head>

<body>
    <div id="wrapper">
      
<div id="sidebar-wrapper">
     
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                        Manage Your Details
                    </a>
                </li>
              
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Book</a>
                <div class="dropdown-menu">
                
                    
                  <a class="dropdown-item" href="ListController" style="color: black">Add Book</a>
                  <a class="dropdown-item" href="View.jsp"style="color: black" >Book Details</a>
                  <a class="dropdown-item" href="Edit.jsp"style="color: black" >Edit Book</a>
                  <a class="dropdown-item" href="SearchData.jsp" style="color: black">Search Book</a>
                  
                </div>
              
              </li>
                
               <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Classification</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="mainClassification.jsp"style="color: black" >Main Classification</a>
                  <a class="dropdown-item" href="subClassification.jsp" style="color: black">Sub Classification</a>
                  
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Edit</a>
                <div class="dropdown-menu">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="color: black">Classification</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="EditSub.jsp"style="color: black">Edit Sub Classification</a>
                  <a class="dropdown-item" href="EditMain.jsp"style="color: black">Edit Main Classification</a>
                </div>
                </div>
                </div>
              </li>
              
              <li class="nav-item dropdown">
                
              </li>
              
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">View</a>
                <div class="dropdown-menu">
                   
                  <a class="dropdown-item" href="viewMainClassification.jsp" style="color: black">Main Classification</a>
                  <a class="dropdown-item" href="viewSubClassification.jsp" style="color: black">Sub Classification</a>
                </div>
              </li>
            </ul>
        </div>
        <center>
           <%@include file="Header1.jsp" %>
        <div id="page-content-wrapper" >
            <div class="container-fluid">
                <div class="container-fluid" style="padding-top:100px">
                
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle"><img src="test.gif" alt="Go to Main Menu!" width="180" height="180" border="0" align="center" title="Click Here To Move Main Menu"></br>  
                </a>
                
            </div>
        </div>
            </div>
        <!-- /#page-content-wrapper -->
        </center>

</div>




    <!-- Bootstrap core JavaScript -->
    <script src="Temp/startbootstrap-simple-sidebar-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="Temp/startbootstrap-simple-sidebar-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
