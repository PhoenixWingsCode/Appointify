<%-- 
    Document   : patient
    Created on : Aug 11, 2023, 12:05:24 AM
    Author     : Hiral
--%>

<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.Database"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Page</title>
        
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
        <%@include file="navbar.jsp" %>
        
        <div class="col-md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">
                        Patient Details
                    </p>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Full Name</th>
                                <th scope="col">Gender</th>  
                                <th scope="col">Age</th>
                                <th scope="col">Appointment</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mob No</th>
                                <th scope="col">Diseases</th>
                                <th scope="col">Doctor Name</th>
                                <th scope="col">Address</th>
                                <th scope="col">Status</th>                                
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                AppointmentDAO dao = new AppointmentDAO(Database.getConnection());
                                DoctorDAO dao2 = new DoctorDAO(Database.getConnection());
                                List<Appointment> list = dao.getAllAppointment();
                                for(Appointment ap : list){
                                    Doctor d = dao2.getDoctorById(ap.getdoctorId());
                                    %>
                                    <tr>
                                        <th><%=ap.getfullName()%></th>
                                        <td><%=ap.getgender()%></td>
                                        <td><%=ap.getage()%></td>
                                        <td><%=ap.getappointmentDate()%></td>
                                        <td><%=ap.getemail()%></td>
                                        <td><%=ap.getphoneNo()%></td>
                                        <td><%=ap.getdiseases()%></td>
                                        <td><%=d.getfullName()%></td>
                                        <td><%=ap.getaddress()%></td>
                                        <td><%=ap.getstatus()%></td>
                                    </tr>                                
                                <%}
                            %>
                        </tbody>
                    </table>
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
