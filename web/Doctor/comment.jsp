<%-- 
    Document   : comment
    Created on : Aug 9, 2023, 10:55:43 PM
    Author     : Hiral
--%>

<%@page import="com.entity.Appointment"%>
<%@page import="com.db.Database"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comment Page</title>
        
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
        
        <div class="containter p-3">
            <div class="row">
                
                <div class="col-md-6 offset-md-3">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-4">Patient Comment</p>
                            
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                AppointmentDAO dao = new AppointmentDAO(Database.getConnection());
                                Appointment ap = dao.getAllAppointmentById(id);
                            %>
                            <form class="row" action="../UpdateStatus" method="post">
                                <div class="col-md-6">
                                    <label>Patient Name</label>
                                    <input type="text" readonly value="<%=ap.getfullName()%>" class="form-control">
                                </div>
                                
                                <div class="col-md-6">
                                    <label>Age</label>
                                    <input type="text" readonly value="<%=ap.getage()%>" class="form-control">
                                </div>
                                
                                <div class="col-md-6">
                                    <label>Mob No</label>
                                    <input type="text" readonly value="<%=ap.getphoneNo()%>" class="form-control">
                                </div>
                                
                                <div class="col-md-6">
                                    <label>Diseases</label>
                                    <input type="text" readonly value="<%=ap.getdiseases()%>" class="form-control">
                                </div>
                                
                                <div class="col-md-6">
                                    <label>Comment</label>
                                    <input type="text" value="" class="form-control" name="comment">
                                </div>
                                
                                <input type="hidden" name="id" value="<%=ap.getId()%>">
                                <input type="hidden" name="did" value="<%=ap.getdoctorId()%>">
                                
                                <button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                            </form>
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
