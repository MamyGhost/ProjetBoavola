<%@ page import="gestion.*" %>
<% 
     Hotel[] trois=(Hotel[])request.getAttribute("trois");
     Hotel[] top=(Hotel[])request.getAttribute("top");
     String[] cat=(String[])request.getAttribute("cat");
     Visiteur visiteur=(Visiteur)session.getAttribute("visiteur");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>front</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aref+Ruqaa">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/best-carousel-slide.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cards.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Carousel-Hero.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Header-Blue.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
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
    <div class="row">
        <div class="col">
            <div class="carousel slide" data-ride="carousel" id="carousel-1">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="jumbotron hero-nature carousel-hero" style="border-radius: 0px;background-image: url(<%="'/"+trois[0].getPhoto()+"'"%>)">
                            <h1 class="hero-title"><%= trois[0].getNom() %></h1>
                            <p class="hero-subtitle"><%= trois[0].getPays()+", "+trois[0].getRegion()%> </p>
                             <p class="hero-subtitle"><%= trois[0].getTarif()+" $" %></p>
                            <p><a class="btn btn-primary btn-lg hero-button" role="button" href="${pageContext.request.contextPath}/Description?idhotel=<%= trois[0].getIdHotel() %> ">Voir</a></p>
                        </div>
                    </div>
                    <% for(int i=1;i<trois.length;i++) {%>
                    <div class="carousel-item">
                        <div class="jumbotron hero-photography carousel-hero" style="background-image:url(<%="'/"+trois[i].getPhoto()+"'"%>) ">
                            <h1 class="hero-title"><%= trois[i].getNom() %></h1>
                            <p class="hero-subtitle"><%= trois[i].getPays()+", "+trois[i].getRegion()%></p>
                             <p class="hero-subtitle"><%= trois[i].getTarif()+" $" %></p>
                            <p><a class="btn btn-primary btn-lg hero-button" role="button" href="${pageContext.request.contextPath}/Description?idhotel=<%= trois[i].getIdHotel() %>">Voir</a></p>
                        </div>
                    </div>
                    <% } %>
                </div>
                <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"><i class="fa fa-chevron-left"></i><span class="sr-only">Previous</span></a><a class="carousel-control-next" href="#carousel-1" role="button" data-slide="next"><i class="fa fa-chevron-right"></i><span class="sr-only">Next</span></a></div>
                <ol class="carousel-indicators">
                    <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-1" data-slide-to="1"></li>
                    <li data-target="#carousel-1" data-slide-to="2"></li>
                </ol>
            </div>
        </div>
    </div>
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
         <h1 style="border-bottom-width: 2px;border-bottom-style: solid;">Hotels les plus reserves</h1>
        <div class="row">
            <div class="col">
                <div>
                    <div class="container">
                        <div class="cust_bloglistintro">
                            <p style="margin-left:34px;color:rgba(255,255,255,0.5);font-size:14px;"></p>
                        </div>
                        <div class="row" style="border-bottom-color: var(--red);">
                            <% for(int i=0;i<top.length;i++) { %> 
                            <div class="col-md-4 cust_blogteaser" style="padding-bottom:20px;margin-bottom:32px;"><a href="${pageContext.request.contextPath}/Description?idhotel=<%= top[i].getIdHotel() %>"><img class="img-fluid" style="height:auto;" src="<%= "/"+top[i].getPhoto() %>"></a>
                                <h3 style="text-align:left;margin-top:20px;font-family:'Open Sans', sans-serif;font-size:18px;margin-right:0;margin-left:24px;line-height:34px;letter-spacing:0px;font-style:normal;font-weight:bold;"><%= top[i].getNom() %><br></h3>
                                <p class="text-secondary" style="text-align: left;font-size: 14px;font-family: Aclonica, sans-serif;line-height: 22px;color: rgb(9,9,10);margin-left: 24px;"><%= top[i].getPays()+", "+top[i].getRegion() %></p>
                                 <p class="text-secondary" style="text-align:left;font-size:14px;font-family:'Open Sans', sans-serif;line-height:22px;color:rgb(9,9,10);margin-left:24px;">
                                    <% for(int j=0;j<top[i].getEtoiles();j++) { %>
                                    <i class="fa fa-star" style="font-size: 20px;color: var(--warning);"></i>
                                    <% } %>
                                </p>
                                <p class="text-secondary" style="text-align: left;font-size: 20px;font-family: 'Open Sans', sans-serif;line-height: 22px;color: rgb(9,9,10);margin-left: 24px;"><%= top[i].getTarif()+" $" %></p><a class="h4" href="${pageContext.request.contextPath}/Description?idhotel=<%= top[i].getIdHotel() %>"><i class="fa fa-arrow-circle-right" style="margin-left:23px;"></i></a>
                            </div>
                           <% } %>
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
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
</body>

</html>