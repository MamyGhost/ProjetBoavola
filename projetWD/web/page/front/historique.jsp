<%@ page import="gestion.*" %>
<%

     String[] colonne=(String[])request.getAttribute("colonne");
     Reservation[] liste=(Reservation[])request.getAttribute("reservation");
     Visiteur visiteur=(Visiteur)session.getAttribute("visiteur");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>maliste</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Adamina">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aref+Ruqaa">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Black+Ops+One">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cards.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Carousel-Hero.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header-Blue.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Modal-Login-form.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
</head>

<body>
    <nav class="navbar navbar-dark navbar-expand-md sticky-top navigation-clean-search" style="/*background: background: linear-gradient(135deg, #172a74, #21a9af);*/background: linear-gradient(135deg, #172a74, #21a9af);">
        <div class="container-fluid"><a class="navbar-brand" href="#" style="color: rgb(234,234,234);">BookingHotel</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav">
                    <li class="nav-item"></li>
                    <li class="nav-item"><a class="nav-link" href="#">&nbsp;Reservations</a></li>
                </ul>
                <form class="form-inline mr-auto" action="${pageContext.request.contextPath}/RechercheS">
                    <div class="form-group mb-0"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" id="search-field" name="nom" style="color: rgb(244,240,240);"></div>
                </form><span class="navbar-text" style="margin-right: 20px;"> 
                    <% if(visiteur!=null) { %>
                    <a data-bss-hover-animate="flash" class="login" href="${pageContext.request.contextPath}/Deconnexion" style="color: rgb(249,249,249);">Log Out</a></span><span class="navbar-text">
                    <% } %>
                    <% if(visiteur==null) { %>    
                    <a data-bss-hover-animate="flash" class="login" href="page/front/login.jsp">Log In</a></span>
                    <% } %>
            </div>
        </div>
    </nav>
    <div class="container">
        <h1 style="border-bottom-width: 2px;border-bottom-style: solid;">Historique de Reservation(s)</h1>
        <div class="row">
             <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <% for(String col : colonne) { %>
                                            <% if(col.compareTo("ID_Visiteur")!=0 &&  col.compareTo("ID_reservation")!=0 ){ %>
                                                <th><%= col %></th>
                                            <% } %>
                                            <% } %>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(Reservation reservation : liste) { %>
                                        <tr>
                                                <td><%= reservation.getHotel() %></td>
                                                <td><%= reservation.getVisisteur() %></td>
                                                <td><%= reservation.getDateA() %></td>
                                                <td><%= reservation.getDateD() %></td>
                                                 <td><%= reservation.getNbrPersonne() %></td>
                                                <td><%= reservation.getLit() %></td>
                                                <td><%= reservation.getCout() %></td>
                                                <td><%= reservation.getDateRes() %></td>                    
                                        
                                        </tr>
                                        <% } %>

                                    </tbody>
                                    <tfoot>
                                           <tr>
                                            <% for(String col : colonne) { %>
                                            <% if(col.compareTo("ID_Visiteur")!=0 &&  col.compareTo("ID_reservation")!=0 ) { %>
                                                <th><%= col %></th>
                                            <% } %>
                                            <% } %>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
        </div>
    </div>
    <footer class="footer-dark">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-3 item">
                    <h3>Services</h3>
                    <ul>
                        <li><a href="#">Web design</a></li>
                        <li><a href="#">Development</a></li>
                        <li><a href="#">Hosting</a></li>
                    </ul>
                </div>
                <div class="col-sm-6 col-md-3 item">
                    <h3>About</h3>
                    <ul>
                        <li><a href="#">Company</a></li>
                        <li><a href="#">Team</a></li>
                        <li><a href="#">Careers</a></li>
                    </ul>
                </div>
                <div class="col-md-6 item text">
                    <h3>Company Name</h3>
                    <p>Praesent sed lobortis mi. Suspendisse vel placerat ligula. Vivamus ac sem lacus. Ut vehicula rhoncus elementum. Etiam quis tristique lectus. Aliquam in arcu eget velit pulvinar dictum vel in justo.</p>
                </div>
                <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
            </div>
            <p class="copyright">Company Name © 2017</p>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
</body>

</html>