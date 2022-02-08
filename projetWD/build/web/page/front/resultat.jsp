<%@ page import="gestion.*" %>
<% 
     Hotel[] hotel=(Hotel[])request.getAttribute("hotel");
     String[] cat=(String[])request.getAttribute("cat");
     int nbrpage = (int)request.getAttribute("nbrpage");
     int pg = (int)request.getAttribute("page");
     String pays = (String)request.getAttribute("pays");
     String region = (String)request.getAttribute("region");
     String categorie = (String)request.getAttribute("categorie");
     String tarif = (String)request.getAttribute("tarif");
     String tarif1 = (String)request.getAttribute("tarif1");
     String nom=(String)request.getAttribute("nom");
     String type=(String)request.getAttribute("type");
     Visiteur visiteur=(Visiteur)session.getAttribute("visiteur");
     
     
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>lista</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aref+Ruqaa">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cards.css">
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
        <h1 style="border-bottom-width: 2px;border-bottom-style: solid;font-family: Acme, sans-serif;">Resultat(s) recherche:</h1>
        <div class="row">
            <div class="col">
                <div>
                    <div class="container">
                        <div class="cust_bloglistintro">
                            <p style="margin-left:34px;color:rgba(255,255,255,0.5);font-size:14px;"></p>
                        </div>
                        <div class="row" style="border-bottom-color: var(--red);">
                            <% for(int i=0;i<hotel.length;i++) { %> 
                            <div class="col-md-4 cust_blogteaser" style="padding-bottom:20px;margin-bottom:32px;"><a href="${pageContext.request.contextPath}/Description?idhotel=<%= hotel[i].getIdHotel() %>"><img class="img-fluid" style="height:auto;" src="<%= "/"+hotel[i].getPhoto() %>"></a>
                                <h3 style="text-align:left;margin-top:20px;font-family:'Open Sans', sans-serif;font-size:18px;margin-right:0;margin-left:24px;line-height:34px;letter-spacing:0px;font-style:normal;font-weight:bold;"><%= hotel[i].getNom() %><br></h3>
                                <p class="text-secondary" style="text-align: left;font-size: 14px;font-family: Aclonica, sans-serif;line-height: 22px;color: rgb(9,9,10);margin-left: 24px;"><%= hotel[i].getPays()+", "+hotel[i].getRegion() %></p>
                                 <p class="text-secondary" style="text-align:left;font-size:14px;font-family:'Open Sans', sans-serif;line-height:22px;color:rgb(9,9,10);margin-left:24px;">
                                    <% for(int j=0;j<hotel[i].getEtoiles();j++) { %>
                                    <i class="fa fa-star" style="font-size: 20px;color: var(--warning);"></i>
                                    <% } %>
                                </p>
                                <p class="text-secondary" style="text-align: left;font-size: 20px;font-family: 'Open Sans', sans-serif;line-height: 22px;color: rgb(9,9,10);margin-left: 24px;"><%= hotel[i].getTarif()+" $" %></p><a class="h4" href="${pageContext.request.contextPath}/Description?idhotel=<%= hotel[i].getIdHotel() %>"><i class="fa fa-arrow-circle-right" style="margin-left:23px;"></i></a>
                            </div>
                           <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col d-flex justify-content-center">
                <nav>
                    <ul class="pagination">
                        <% if(type.compareTo("avance")==0) { %>
                         <% if(pg!=1) { %>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= pg-1 %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>" aria-label="Previous"><span aria-hidden="true"><<</span></a></li>
                        <% } else { %>
                        <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= pg-1 %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>" aria-label="Previous"><span aria-hidden="true"><<</span></a></li>

                        <% } %>


                        <% if(pg<=3 && (nbrpage-pg)>=10) { %>
                        <% for(int i=1;i<=pg;i++) { %>

                        <% if(i==pg) { %>
                         <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= i %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= i %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= i %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= i %></a></li>
                        <% } %>
                        <% } %>
                        <li style="font-size: 15px">...</li>
                         <% if(nbrpage%2==0) { %>
                         <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= nbrpage/2 %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= nbrpage/2  %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= (int)nbrpage/2+1 %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= (int)nbrpage/2+1  %></a></li>
                         <% } %>
                         <li style="font-size: 15px">...</li>
                         <% for(int i=nbrpage;i>nbrpage-2;i--) { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= i %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= i %></a></li>
                        <% } %>

                        <% } %>

                         <% if(pg<=nbrpage && pg>nbrpage-2 && pg>10) { %>
                        <% for(int i=1;i<=2;i++) { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= i %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= i %></a></li>
                        
                        <% } %>
                        <li style="font-size: 15px">...</li>
                         <% if(nbrpage%2==0) { %>
                         <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= nbrpage/2 %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= nbrpage/2  %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= (int)nbrpage/2+1 %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= (int)nbrpage/2+1  %></a></li>
                         <% } %>
                         <li style="font-size: 15px">...</li>
                         <% for(int i=pg;i<=nbrpage;i++) { %>
                          <% if(i==pg) { %>
                         <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= i %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= i %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= i %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= i %></a></li>
                        <% } %>
                        
                        <% } %>

                        <% } %>

                        <% if(nbrpage<=10) { %>
                        <% for(int i=1;i<=nbrpage;i++) { %>
                        <% if(i==pg) { %>
                         <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= i %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= i %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= i %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>"><%= i %></a></li>
                        <% } %>
                        
                        <% } %>
                        <% } %>
                        <% if(pg!=nbrpage) { %>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= pg+1 %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>" aria-label="Next"><span aria-hidden="true">>></span></a></li>
                        <% } else { %>
                        <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= pg+1 %>&pays=<%= pays %>&region=<%= region %>&categorie=<%= categorie %>&tarif=<%= tarif %>&tarif1=<%= tarif1 %>" aria-label="Next"><span aria-hidden="true">>></span></a></li>
                        <% } %>

                        <% } else { %>
                        <% if(pg!=1) { %>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= pg-1 %>&nom=<%= nom %>" aria-label="Previous"><span aria-hidden="true"><<</span></a></li>
                        <% } else { %>
                        <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= pg-1 %>&nom=<%= nom %>" aria-label="Previous"><span aria-hidden="true"><<</span></a></li>

                        <% } %>


                        <% if(pg<=3 && (nbrpage-pg)>=10) { %>
                        <% for(int i=1;i<=pg;i++) { %>

                        <% if(i==pg) { %>
                         <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= i %>&nom=<%= nom %>"><%= i %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= i %>&nom=<%= nom %>"><%= i %></a></li>
                        <% } %>
                        <% } %>
                        <li style="font-size: 15px">...</li>
                         <% if(nbrpage%2==0) { %>
                         <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= nbrpage/2 %>&nom=<%= nom %>"><%= nbrpage/2  %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= (int)nbrpage/2+1 %>&nom=<%= nom %>"><%= (int)nbrpage/2+1  %></a></li>
                         <% } %>
                         <li style="font-size: 15px">...</li>
                         <% for(int i=nbrpage;i>nbrpage-2;i--) { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= i %>&nom=<%= nom %>"><%= i %></a></li>
                        <% } %>

                        <% } %>

                         <% if(pg<=nbrpage && pg>nbrpage-2 && pg>10) { %>
                        <% for(int i=1;i<=2;i++) { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= i %>&nom=<%= nom %>"><%= i %></a></li>
                        
                        <% } %>
                        <li style="font-size: 15px">...</li>
                         <% if(nbrpage%2==0) { %>
                         <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= nbrpage/2 %>&nom=<%= nom %>"><%= nbrpage/2  %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= (int)nbrpage/2+1 %>&nom=<%= nom %>"><%= (int)nbrpage/2+1  %></a></li>
                         <% } %>
                         <li style="font-size: 15px">...</li>
                         <% for(int i=pg;i<=nbrpage;i++) { %>
                          <% if(i==pg) { %>
                         <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= i %>&nom=<%= nom %>"><%= i %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= i %>&nom=<%= nom %>"><%= i %></a></li>
                        <% } %>
                        
                        <% } %>

                        <% } %>

                        <% if(nbrpage<=10) { %>
                        <% for(int i=1;i<=nbrpage;i++) { %>
                        <% if(i==pg) { %>
                         <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= i %>&nom=<%= nom %>"><%= i %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= i %>&nom=<%= nom %>"><%= i %></a></li>
                        <% } %>
                        
                        <% } %>
                        <% } %>
                        <% if(pg!=nbrpage) { %>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= pg+1 %>&nom=<%= nom %>" aria-label="Next"><span aria-hidden="true">>></span></a></li>
                        <% } else { %>
                        <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/RechercheS?page=<%= pg+1 %>&nom=<%= nom %>" aria-label="Next"><span aria-hidden="true">>></span></a></li>
                        <% } %>

                        <% } %>
                    </ul>
                </nav>
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
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
</body>

</html>