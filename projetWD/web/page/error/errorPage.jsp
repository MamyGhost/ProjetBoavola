<%-- 
    Document   : index
    Created on : 9 juil. 2021, 10:38:51
    Author     : T76
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>QUELQUE CHOSE NE VA PAS</h1>
        <h2>J'ai vu passer une erreur qui est: </h2>
		<p><%= exception.getMessage() %></p>
    </body>
</html>
