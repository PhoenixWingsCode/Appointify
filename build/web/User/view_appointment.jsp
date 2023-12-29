<%-- 
    Document   : view_appointment
    Created on : Aug 7, 2023, 9:14:29 AM
    Author     : Hiral
--%>

<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.db.Database"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Appointment Page</title>
        
        <!-- Bootstrap .C.S.S and J.S-->
        <%@include file="../Component/allCSS.jsp" %>

        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>

    </head>
    <body>
        
            <!-- Includes Navigation bar -->
            <%@include file="usernav.jsp" %>

            <div class="container p-3">
                <div class="row"> 
                    <div class="col-md-9">
                        <div class="card paint-card">
                            <div class="card-body">
                                <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Age</th>
                                            <th scope="col">Appointment Date</th>
                                            <th scope="col">Diseases</th>
                                            <th scope="col">Doctor Name</th>
                                            <th scope="col">Status</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            user = (User)session.getAttribute("userObj");
                                            AppointmentDAO dao = new AppointmentDAO(Database.getConnection());
                                            DoctorDAO dao2 = new DoctorDAO(Database.getConnection());
                                            List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
                                            for(Appointment ap : list){
                                                Doctor d = dao2.getDoctorById(ap.getdoctorId());
                                        %>
                                            <tr>
                                                <th><%=ap.getfullName()%></th>
                                                <td><%=ap.getgender()%></td>
                                                <td><%=ap.getage()%></td>
                                                <td><%=ap.getappointmentDate()%></td>
                                                <td><%=ap.getdiseases()%></td>
                                                <td><%=d.getfullName()%></td>
                                                <td>
                                                    <%
                                                        if("pending".equals(ap.getstatus())){%>
                                                            <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                                       <%}else{%>
                                                            <%=ap.getstatus()%>;
                                                        <%}
                                                    %>
                                                </td>
                                            </tr>
                                        <%}
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 p-1">
                        <img alt="" src="../Images/sanjay gupta.png" height="500px" width="300px">
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
