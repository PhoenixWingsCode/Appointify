<%-- 
    Document   : index
    Created on : Jul 29, 2023, 7:14:32 PM
    Author     : Hiral
--%>

<%@page import="com.db.Database"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Index Page</title>
        
        <!-- Bootstrap .C.S.S and J.S-->
        <%@include file="../Component/allCSS.jsp" %>
        
        <style type="text/css">
            .paint-card{
                box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
                text-align: center;
            }
        </style>

    </head>
    <body>
        <%@include file="navbar.jsp"%>
        
        <p class="text-center fs-3" style="padding-top:100px">Doctor Dashboard</p>
        
        <%
            Doctor d = (Doctor)session.getAttribute("DoctorObj");
            DoctorDAO dao = new DoctorDAO(Database.getConnection());
        %>
        
        <div class="container p-5">
            <div class="row">
                <div class="col-md-4 offset-md-2">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fas fa-user-md fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Doctor<br><%=dao.countDoctor()%>
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fas fa-calendar-check fa-3x"></i>
                            <p class="fs-4 text-center">
                                Total Appointment<br><%=dao.countAppointmentByDoctorId(d.getId())%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script>
        window.onload = function() {
          history.pushState(null, null, document.URL);
          window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
          });
        };
    </script>
                            
    </body>
</html>
