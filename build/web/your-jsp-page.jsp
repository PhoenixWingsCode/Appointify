<%-- 
    Document   : your-jsp-page
    Created on : Jun 14, 2023, 10:27:46 PM
    Author     : Hiral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Result</title>
        
        <!-- Bootstrap .C.S.S and J.S-->
        <%@include file="Component/allCSS.jsp" %>

    </head>
    <body>
        
        <!-- Includes Navigation bar -->
        <%@include file="Component/Navbar.jsp" %>

        <h1>Registration Result</h1>
        <p>${message}</p>
    </body>
</html>
