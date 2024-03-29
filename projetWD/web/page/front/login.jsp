<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>frontlogin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aref+Ruqaa">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ssets/css/cards.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Carousel-Hero.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/galeria-descripcion.css">
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
                <form class="form-inline mr-auto" target="_self">
                    <div class="form-group mb-0"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" id="search-field" name="search" style="color: rgb(244,240,240);"></div>
                </form><span class="navbar-text" style="margin-right: 20px;"> 
                    <a data-bss-hover-animate="flash" class="login" href="#" style="color: rgb(249,249,249);">Log Out</a></span><span class="navbar-text"> 
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col">
                <div id="myModal">
                    <div class="modal-dialog modal-login">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="h4 modal-title">&nbsp;Login</h4>
                            </div>
                            <div class="modal-body">
                                <form action="${pageContext.request.contextPath}/SconnexionVisiteur" method="post">
                                    <div class="form-group"><i class="fa fa-star fa-user"></i><input class="form-control" type="mail" name="mail" placeholder="Mail" required="required"></div>
                                    <div class="form-group"><i class="fa fa-star fa-lock"></i><input class="form-control" type="password" name="mdp" placeholder="Password" required="required"></div>
                                    <div class="form-group"><button class="btn btn-primary btn-block btn-lg" type="submit" value="Login" style="background: var(--indigo);">Login</button></div>
                                </form>
                            </div>
                            <div class="modal-footer"><a href="${pageContext.request.contextPath}/page/admin/login.jsp">Se connecter en tant qu' Admin</a></div>
                        </div>
                    </div>
                </div>
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
    <script src="${pageContext.request.contextPath}/sassets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
</body>

</html>