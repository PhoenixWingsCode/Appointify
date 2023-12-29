<%-- 
    Document   : index
    Created on : Jun 15, 2023, 4:37:05 PM
    Author     : Hiral
--%>
<%@page import="com.db.Database"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.admin.filter.AuthenticationFilter"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Index Page</title>
        
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
        <div class="container p-5">
            <p class="text-center fs-3">Admin Dashboard</p>
            
            <p id="message" class="text-center text-custom fs-3" style="color:blue">${message}</p>
            <p id="error_message" class="text-center text-custom fs-3" style="color:blue">${error_message}</p> 

                <%
                    DoctorDAO dao = new DoctorDAO(Database.getConnection()); 
                %>            

            <div class="row">
                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body text-center text-custom">
                            <i class="fas fa-user-md fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Doctor<br><%=dao.countDoctor()%>
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body text-center text-custom">
                            <i class="fas fa-user-circle fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                User<br><%=dao.countUser()%>
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 mt-2">
                    <div class="card paint-card">
                        <div class="card-body text-center text-custom">
                            <i class="fas fa-calendar-check fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Total Appointment<br><%=dao.countAppointment()%>
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 mt-2">
                    <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <div class="card-body text-center text-custom">
                            <i class="fas fa-calendar-check fa-3x"></i><br>
                            <p class="fs-4 text-center">
                                Specialist<br><%=dao.countSpecialist()%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <form id="addSpecialistForm" action="../AddSpecialist" method="post" onsubmit="return false">
                          <div class="form-group">
                              <label>Enter Specialist Name</label>
                              <input type="text"  id="specNameInput" name="specName" class="form-control">
                          </div>
                          <button type="submit"  id="addSpecialistButton" class="btn-btn-primary">Add</button>
                      </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>    
    <script>
        $(document).ready(function() {
    // Add click event listener to the addSpecialistButton
    $("#addSpecialistButton").click(function() {
        // Retrieve the input value
        var specName = $("#specNameInput").val();

        // Make the AJAX request
        $.ajax({
            type: "POST",
            url: "../AddSpecialist",
            data: "specName="+specName,
            success: function(response) {
                console.log(response);
                if (response.msg === "already present") {
                    // Handle the success response here
                    window.alert("Specialist Already exists");
                } 
                else if (response.msg === "success") {
                    // Handle the success response here
                    window.alert("Specialist Added");
                } 
                else {
                    // Handle the error response here
                    window.alert("Something went wrong");
                }
            }
        });
    });
});

        window.onload = function() {
          history.pushState(null, null, document.URL);
          window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
          });
        };
    </script>

    </body>
</html>
