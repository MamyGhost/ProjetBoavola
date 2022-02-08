<%@ page import="gestion.*" %>
<% 
     String table=(String)request.getAttribute("table");
     String[] colonne=(String[])request.getAttribute("colonne");
     String[] classe=(String[])request.getAttribute("classeS");
     String type=(String)request.getAttribute("type");
     Admin admina=(Admin)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile - Brand</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/CDRFormularioIngresoSocio.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Pretty-Registration-Form.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Simple-Form-1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Simple-Form.css">
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
                <div class="container-fluid register-form">
                    <div class="row register-form">
                        <div class="col-md-8 offset-md-2">
                            <form class="custom-form" method="Get" action="${pageContext.request.contextPath}/EditValidation" >
                                <h1>Edit Form</h1>
                                 <% if(type!=null) { %>
                                <div class="form-row form-group " style="display:none">
                                    <div class="col-sm-6 input-column"><input  class="form-control" name="type" type="hidden" value="<%= type %>"></div>
                                </div>
                                 <% } else { %>

                                 <div class="form-row form-group" style="display:none">
                                    <div class="col-sm-6 input-column"><input  class="form-control" name="id" type="hidden" value="<%= classe[0] %>"></div>
                                </div>
                                 <% } %>
                                 <div class="form-row form-group " style="display:none">
                                    <div class="col-sm-6 input-column"><input  class="form-control" name="table" type="hidden" value="<%= table %>"></div>
                                </div>

                               
            
                                 <% for(int i =1;i<colonne.length;i++) { %>
                                 <% if(colonne[i].compareTo("Mdp")==0) { %>
                                    <% if(table.compareTo("Admin")==0) { %>
                                  <div class="form-row form-group">
                                    <div class="col-sm-4 label-column"><label class="col-form-label" for="pawssword-input-field"><%= colonne[i]%></label></div>
                                    <% if(type==null) { %>
                                    <div class="col-sm-6 input-column"><input class="form-control" name="<%= colonne[i]%>" type="password" value="<%= classe[i] %>"></div>
                                    <% } else { %>
                                    <div class="col-sm-6 input-column"><input class="form-control" name="<%= colonne[i]%>" type="password"></div>
                                    <% } %>
                                </div>
                                 <% } else { %>
                                  <div class="form-row form-group">
                                    <div class="col-sm-4 label-column"><label class="col-form-label" for="pawssword-input-field"><%= colonne[i]%></label></div>
                                    <% if(type==null) { %>
                                    <div class="col-sm-6 input-column"><input class="form-control"  name="<%= colonne[i]%>" type="password" value="<%= classe[i] %>" readonly="readonly"></div>
                                     <% } else { %>
                                     <div class="col-sm-6 input-column"><input class="form-control"  name="<%= colonne[i]%>" type="password" ></div>
                                      <% } %>
                                </div>
                                 <% } %>
                                <% } else if(colonne[i].compareTo("description")==0) { %>
                                     <div class="form-row form-group">
                                    <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field"><%= colonne[i]%> </label></div>
                                    <% if(type==null) { %>
                                    <div class="col-sm-6 input-column"><textarea class="form-control"  name="<%= colonne[i]%>" ><%= classe[i] %></textarea></div>
                                     <% } else { %>
                                     <div class="col-sm-6 input-column"><textarea class="form-control"  name="<%= colonne[i]%>" ></textarea></div>
                                     <% } %>
                                </div>
                              
                                <% } else { %>

                                  <div class="form-row form-group">
                                    <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field"><%= colonne[i]%> </label></div>
                                    <% if(type==null) { %>
                                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="<%= colonne[i]%>" value="<%= classe[i] %>"></div>
                                    <% } else { %>
                                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="<%= colonne[i]%>"></div>

                                    <% } %>
                                </div>
                                <% } %>
                                <% } %>
                               
                                <button class="btn btn-light submit-button" type="submit">Validate</button>
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
    <script src="${pageContext.request.contextPath}/assets/js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
</body>

</html>