<%@ page import="gestion.*" %>
<% 
     String table=(String)request.getAttribute("table");
     String[] colonne=(String[])request.getAttribute("colonne");
     int pg = (int)request.getAttribute("page");
     int nbrpage = (int)request.getAttribute("nbrpage");
     Admin admina=(Admin)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - Brand</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome5-overrides.min.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: #004f6d;box-shadow: 0px 0px 3px var(--blue);">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon"><i class="fas fa-hotel justify-content-lg-start align-items-lg-start" style="border-style: none;filter: brightness(126%) invert(1%) saturate(108%);"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>Admin</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/AcceuilAdmin"><i class="fas fa-tachometer-alt"></i><span>Tableau de bord</span></a></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Table?table=Visiteur&page=1"><i class="fas fa-table"></i><span>Table</span></a></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        
                        <ul class="navbar-nav flex-nowrap ml-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1"></li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="shadow dropdown-list dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown"></div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow">
                                 <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small"><%= admina.getPseudo() %></span></a>
                                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in">
                                        <div class="dropdown-divider"></div><a class="dropdown-item" href="${pageContext.request.contextPath}/Deconnexion"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <form method="get" action="${pageContext.request.contextPath}/Table">
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold"><%=table+" Info" %><button class="btn btn-primary float-right" type="submit" style="height: 25px;font-size: 10px;margin-left: 5px;">Aller</button><select class="float-right" name="table">
                                    
                                        <option value="Hotel" selected="">Hotel</option>
                                        <option value="Admin">Admin</option>
                                        <option value="Visiteur">Visiteur</option>
                                         <option value="Reservation">Reservation</option>
                                    
                                </select>
                                
                                <a href="${pageContext.request.contextPath}/Edit?type=ajout&table=<%= table %>" class="btn btn-primary" role="button" style="width: 100px;font-size: 10px;margin-left: 50px;">Ajout Item</a>

                            </p>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                
                                <div class="col-md-6">
                                    <div class="text-md-right dataTables_filter" id="dataTable_filter">
                                        <label></label>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    
                                        <% if(table.compareTo("Visiteur")==0) { %>
                                        <% Visiteur[] liste=(Visiteur[])request.getAttribute("classe"); %>
                                    <thead>
                                        <tr>
                                            <% for(String col : colonne) { %>
                                                <th><%= col %></th>
                                            <% } %>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(Visiteur visiteur : liste) { %>
                                        <tr>
                                                <td><img class="rounded-circle mr-2" width="30" height="30" src="${pageContext.request.contextPath}/assets/img/avatars/avatar2.jpeg"><%= visiteur.getNom() %></td>
                                                <td><%= visiteur.getIdVisiteur() %></td>
                                                <td><%= visiteur.getPrenom() %></td>
                                                <td><%= visiteur.getMail() %></td>
                                                 <td><%= visiteur.getNumero() %></td>
                                                <td><%= visiteur.getMdp() %></td>
                                                <td><%= visiteur.getVola() %></td>                   
                                                <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/Edit?table=<%= table %>&id=<%=visiteur.getIdVisiteur() %>" role="button"><i class="far fa-edit"></i></a></td>
                                                <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/Delete?table=<%= table %>&id=<%=visiteur.getIdVisiteur() %>" role="button"><i class="fas fa-trash"></i></a></td>
                                          
                                        
                                        </tr>
                                        <% } %>

                                    </tbody>
                                    <tfoot>
                                           <tr>
                                            <% for(String col : colonne) { %>
                                                <th><%= col %></th>
                                            <% } %>
                                        </tr>
                                    </tfoot>
                                    <% } %>
                                    
                                    <% if(table.compareTo("Admin")==0) { %>
                                    <% Admin[] liste=(Admin[])request.getAttribute("classe"); %>
                                    <thead>
                                        <tr>
                                            <% for(String col : colonne) { %>
                                                <th><%= col %></th>
                                            <% } %>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(Admin admin : liste) { %>
                                        <tr>
                                                <td><%= admin.getIdAdmin()%></td>
                                                <td><%= admin.getPseudo() %></td>
                                                <td><%= admin.getMdp() %></td>                  
                                                <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/Edit?table=<%= table %>&id=<%=admin.getIdAdmin() %>" role="button"><i class="far fa-edit"></i></a></td>
                                                <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/Delete?table=<%= table %>&id=<%=admin.getIdAdmin() %>" role="button"><i class="fas fa-trash"></i></a></td>
                                        </tr>
                                        <% } %>

                                    </tbody>
                                    <tfoot>
                                           <tr>
                                            <% for(String col : colonne) { %>
                                                <th><%= col %></th>
                                            <% } %>
                                        </tr>
                                    </tfoot>
                                    <% } %>

                                    <% if(table.compareTo("Hotel")==0) { %>
                                    <% Hotel[] liste=(Hotel[])request.getAttribute("classe"); %>
                                    <thead>
                                        <tr>
                                            <% for(String col : colonne) { %>
                                                <th><%= col %></th>
                                            <% } %>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(Hotel hotel : liste) { %>
                                        <tr>
                                                <td><img class="rounded-circle mr-2" width="30" height="30" src="<%= "/"+hotel.getPhoto() %>"><%= hotel.getNom() %></td>
                                                <td><%= hotel.getIdHotel()%></td>
                                                <td><%= hotel.getPays(hotel.getIdHotel())%></td>
                                                <td><%= hotel.getRegion(hotel.getIdHotel())%></td>
                                                <td><%= hotel.getEtoiles(hotel.getIdHotel())%></td>
                                                <td><%= hotel.getTarif()%></td>
                                                <td><p style="overflow-y: auto;height: 75px;"><%= hotel.getDescription()%></p></td>
                                                <td><%= hotel.getValues()%></td>
                                                <td><%= hotel.getHebergement()%></td>
                                                <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/Edit?table=<%= table %>&id=<%=hotel.getIdHotel() %>" role="button"><i class="far fa-edit"></i></a></td>
                                                <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/Delete?table=<%= table %>&id=<%=hotel.getIdHotel() %>" role="button"><i class="fas fa-trash"></i></a></td>
                                        </tr>
                                        <% } %>

                                    </tbody>
                                    <tfoot>
                                           <tr>
                                            <% for(String col : colonne) { %>
                                                <th><%= col %></th>
                                            <% } %>
                                        </tr>
                                    </tfoot>
                                    <% } %>

                                    
                                    <% if(table.compareTo("Reservation")==0) { %>
                                    <% Reservation[] liste=(Reservation[])request.getAttribute("classe"); %>
                                    <thead>
                                        <tr>
                                            <% for(String col : colonne) { %>
                                                <th><%= col %></th>
                                            <% } %>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(Reservation reservation : liste) { %>
                                        <tr>
                                                <td><%= reservation.getIdReservation()%></td>
                                                <td><%= reservation.getHotel()%></td>
                                                <td><%= reservation.getVisisteur()%></td>
                                                <td><%= reservation.getDateA()%></td>
                                                <td><%= reservation.getDateD()%></td>
                                                <td><%= reservation.getNbrPersonne()%></td>
                                                <td><%= reservation.getLit()%></td> 
                                                <td><%= reservation.getCout()%></td>  
                                                <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/Edit?table=<%= table %>&id=<%=reservation.getIdReservation() %>" role="button"><i class="far fa-edit"></i></a></td>
                                                <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/Delete?table=<%= table %>&id=<%=reservation.getIdReservation() %>" role="button"><i class="fas fa-trash"></i></a></td>
                                        </tr>
                                        <% } %>

                                    </tbody>
                                    <tfoot>
                                           <tr>
                                            <% for(String col : colonne) { %>
                                                <th><%= col %></th>
                                            <% } %>
                                        </tr>
                                    </tfoot>
                                    <% } %>

                                    
                                </table>
                            </div>
                            <div class="row">
            <div class="col d-flex justify-content-center">
                <nav>
                    <ul class="pagination">
   
                         <% if(pg!=1) { %>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= pg-1 %>&table=<%= table %>" aria-label="Previous"><span aria-hidden="true"><<</span></a></li>
                        <% } else { %>
                        <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/RechercheAV?page=<%= pg-1 %>&table=<%= table %>" aria-label="Previous"><span aria-hidden="true"><<</span></a></li>

                        <% } %>


                        <% if(pg<=3 && (nbrpage-pg)>=10) { %>
                        <% for(int i=1;i<=pg;i++) { %>

                        <% if(i==pg) { %>
                         <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= i %>&table=<%= table %>"><%= i %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= i %>&table=<%= table %>"><%= i %></a></li>
                        <% } %>
                        <% } %>
                        <li style="font-size: 15px">...</li>
                         <% if(nbrpage%2==0) { %>
                         <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= nbrpage/2 %>&table=<%= table %>"><%= nbrpage/2  %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= (int)nbrpage/2+1 %>&table=<%= table %>"><%= (int)nbrpage/2+1  %></a></li>
                         <% } %>
                         <li style="font-size: 15px">...</li>
                         <% for(int i=nbrpage;i>nbrpage-2;i--) { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= i %>&table=<%= table %>"><%= i %></a></li>
                        <% } %>

                        <% } %>

                         <% if(pg<=nbrpage && pg>nbrpage-2 && pg>10) { %>
                        <% for(int i=1;i<=2;i++) { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= i %>&table=<%= table %>"><%= i %></a></li>
                        
                        <% } %>
                        <li style="font-size: 15px">...</li>
                         <% if(nbrpage%2==0) { %>
                         <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= nbrpage/2 %>&table=<%= table %>"><%= nbrpage/2  %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= (int)nbrpage/2+1 %>&table=<%= table %>"><%= (int)nbrpage/2+1  %></a></li>
                         <% } %>
                         <li style="font-size: 15px">...</li>
                         <% for(int i=pg;i<=nbrpage;i++) { %>
                          <% if(i==pg) { %>
                         <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= i %>&table=<%= table %>"><%= i %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= i %>&table=<%= table %>"><%= i %></a></li>
                        <% } %>
                        
                        <% } %>

                        <% } %>

                        <% if(nbrpage<=10) { %>
                        <% for(int i=1;i<=nbrpage;i++) { %>
                        <% if(i==pg) { %>
                         <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= i %>&table=<%= table %>"><%= i %></a></li>
                         <% } else { %>
                        <li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= i %>&table=<%= table %>"><%= i %></a></li>
                        <% } %>
                        
                        <% } %>
                        <% } %>
                        <% if(pg!=nbrpage) { %>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= pg+1 %>&table=<%= table %>" aria-label="Next"><span aria-hidden="true">>></span></a></li>
                        <% } else { %>
                        <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/Table?page=<%= pg+1 %>&table=<%= table %>" aria-label="Next"><span aria-hidden="true">>></span></a></li>
                        <% } %>

                        
                        
                    </ul>
                </nav>
            </div>
        </div>
                        </div>
                    </div>
                      </form>
                      <div class="row">
                         <div class="col-md-6" style="margin-top: 50px">
                        <form action="${pageContext.request.contextPath}/Importation" method="POST" enctype="multipart/form-data">
                                <input type="file"  style="margin-left: 50px;" name="file" multiple="multiple"/>
                               <div class="form-row form-group " style="display:none">
                                    <div class="col-sm-6 input-column"><input  class="form-control" name="table" type="hidden" value="<%= table %>"></div>
                                </div>
                                <button class="btn btn-primary " type="submit" style="height: 25px;font-size: 10px;margin-left: 50px;">Importer fichier</button>
                        </form>
                    </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © Brand 2021</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/ssets/js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
</body>

</html>