<%@ page import="gestion.*" %>
<% 
     Hotel hotel=(Hotel)request.getAttribute("hotel");
     String[] cat=(String[])request.getAttribute("cat");
     Visiteur visiteur=(Visiteur)session.getAttribute("visiteur");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>description</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Adamina">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aref+Ruqaa">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Black+Ops+One">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/cards.css">
    <link rel="stylesheet" href="assets/css/Carousel-Hero.css">
    <link rel="stylesheet" href="assets/css/Carousel.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="assets/css/galeria-descripcion.css">
    <link rel="stylesheet" href="assets/css/Header-Blue.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="assets/css/Modal-Login-form.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <nav class="navbar navbar-dark navbar-expand-md sticky-top navigation-clean-search" style="/*background: background: linear-gradient(135deg, #172a74, #21a9af);*/background: linear-gradient(135deg, #172a74, #21a9af);">
        <div class="container-fluid"><a class="navbar-brand" href="${pageContext.request.contextPath}/Acceuil" style="color: rgb(234,234,234);">BookingHotel</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav">
                    <li class="nav-item"></li>
                     <% if(visiteur!=null) { %>
                    <li class="nav-item"><a class="nav-link" href="#">&nbsp;Reservations</a></li>
                    <% } %>
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
        
        <form method="GET" action="${pageContext.request.contextPath}/RechercheAV">
        <div class="row" style="margin-top: 15px;border-radius: 4px;height: 150px;border: 1px solid #dddddd;background: #f0f0f0;">
            
            <div class="col d-flex justify-content-center align-items-center">

                <div>
                    <p class="d-flex" style="height: 10px;font-family: Aclonica, sans-serif;color: var(--indigo);">Pays</p><input type="search" style="border-color: var(--blue);border-top-width: 0px;border-left-width: 0px;border-radius: 3px;font-family: 'Aref Ruqaa', serif;text-shadow: 0px 0px;box-shadow: 0px 0px 3px;" name="pays" placeholder="Ex: Madagascar">
                </div>
            </div>
            <div class="col d-flex justify-content-center align-items-center">
                <div>
                    <p class="d-flex" style="height: 10px;font-family: Aclonica, sans-serif;color: var(--indigo);">Region</p><input type="search" style="border-color: var(--blue);border-top-width: 0px;border-left-width: 0px;border-radius: 3px;font-family: 'Aref Ruqaa', serif;box-shadow: 0px 0px 2px;" name="region" placeholder="Ex: Antananarivo">
                </div>
            </div>
            <div class="col d-flex justify-content-center align-items-center">
                <div>
                    <p class="d-flex" style="height: 10px;font-family: Aclonica, sans-serif;color: var(--indigo);">Etoiles</p><select style="height: 30px;border-radius: 3px;font-family: Acme, sans-serif;border-color: var(--blue);border-top-width: 0px;border-left-width: 0px;box-shadow: 0px 0px 2px;width: 135px;" name="categorie">
                        <option value="all" selected="">Tous</option>
                        <% for(int i=0;i<cat.length;i++) {%>
                            <option value="<%= cat[i]%>"><%= cat[i]+" Etoiles" %></option>
                        <% } %>
                    </select>
                </div>
            </div>
            <div class="col d-flex justify-content-center align-items-center">
                <div>
                    <p class="d-flex" style="height: 10px;font-family: Aclonica, sans-serif;color: var(--indigo);">Tarif (<span id="demo"></span>-<span id="demo1"></span>)</p>
                    <input type="range" class="custom-range slider" value="0" min="0" max="500" id="myRange" name="tarif" style="width: 200px">
                  <input type="range" class="custom-range slider1" value="500" min="0" max="500" id="myRange1" name="tarif1" style="width: 200px" >
                </div>
                <script>
                  var slider = document.getElementById("myRange");
                  var slider1 = document.getElementById("myRange1");
                  var output = document.getElementById("demo");
                  var output1 = document.getElementById("demo1");
                  output.innerHTML = slider.value;
                  output1.innerHTML = slider1.value;
                  slider.oninput = function() {output.innerHTML = this.value;}
                  slider1.oninput = function() {output1.innerHTML = this.value;}              
                </script>
                </div>
          
            <div class="col d-flex justify-content-center align-items-center"><button class="btn btn-primary" type="submit" style="background: #21a9af;width: 100px;height: 50px;">Recherche</button></div>

        </div>
        </form>
        <h1 style="border-bottom-width: 2px;border-bottom-style: solid;">Fiche</h1>
        <form method="post" action="${pageContext.request.contextPath}/Reserver">
        <div class="row">
            <div class="col-md-7">
                <div class="row">
                    <div class="col-md-12"><img class="img-thumbnail img-fluid center-block" src="<%= "/"+hotel.getPhoto() %>"></div>
                </div>
                <h1 style="text-align: left;border-bottom-style: solid;">Reservation</h1>
                <div class="row row-cols-2 d-flex justify-content-center align-items-center align-content-center" style="margin-bottom: 10px;">
                    <div class="col">
                        <p style="font-family: 'Black Ops One', cursive;">Date d' Arrivee</p><input type="date" style="text-align: center;" name="arrive">
                    </div>
                    <div class="col">
                        <p style="font-family: 'Black Ops One', cursive;">Date de Depart</p><input type="date" style="text-align: center;" name="depart">
                    </div>
                    <div class="col">
                        <p style="margin-top: 5px;font-family: 'Black Ops One', cursive;">Nombres de Personnes</p><select name="nbrpersonne">
                            <% for(int i=1;i<5;i++) { %>
                            <option value="<%= i %>" selected=""><%= i %> personne(s)</option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col">
                        <p style="margin-top: 5px;font-family: 'Black Ops One', cursive;">Nombres de Lits</p>
                        <div class="row">
                            <div class="col-3 offset-0">
                                <div class="form-check"><input class="form-check-input" type="radio" value="1" name="lits" id="formCheck-1"><label class="form-check-label" for="formCheck-1"><i class="fa fa-bed"></i></label></div>
                            </div>
                            <div class="col">
                                <div class="form-check"><input class="form-check-input" type="radio" value="2" name="lits" id="formCheck-2"><label class="form-check-label" for="formCheck-2"><i class="fa fa-bed"></i><i class="fa fa-bed" style="margin-left: 5px;"></i></label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <h1 style="font-family: Aclonica, sans-serif;color: rgb(32,135,238);"><%= hotel.getNom() %></h1>
                <p style="font-size: 20px;color: var(--red);"><%= hotel.getPays()+", "+hotel.getRegion() %></p>
                <p style="font-size: 25px;">
                    <% for(int i=0;i<hotel.getEtoiles();i++) { %>
                    <i class="fa fa-star" style="color: var(--orange);"></i>
                    <% } %>
                </p><p style="height: 500px;overflow-y: auto;"><br>
                    <%= hotel.getDescription() %></p>
                <div class="row row-cols-1">
                    <div class="col">
                        <p style="text-align: center;font-size: 25px;"><%= hotel.getTarif() %> $</p>
                    </div>
                    <div class="col d-flex justify-content-center"><button class="btn btn-primary" type="submit" style="background: var(--cyan);width: 120px;height: 50px;">Reserver</button></div>
                </div>
            </div>
        </div>
     </form>
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