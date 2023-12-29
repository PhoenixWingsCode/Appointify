<%-- 
    Document   : view_doctor
    Created on : Jul 27, 2023, 8:00:29 PM
    Author     : Hiral
--%>

<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.db.Database"%>
<%@page import="com.dao.SpecialistDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Doctor Page</title>
                
        <!-- Bootstrap .C.S.S and J.S-->
        <%@include file="../Component/allCSS.jsp" %>
        
        <style type="text/css">
            .paint-card{
                box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
            }
        </style>

    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container-fluid p-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">
                                Doctor Details
                            </p>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">DOB</th> 
                                        <th scope="col">Qualification</th> 
                                        <th scope="col">Specialist</th> 
                                        <th scope="col">Email</th> 
                                        <th scope="col">Mob No.</th> 
                                        <th scope="col">Action</th>                                 
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    DoctorDAO dao2=new DoctorDAO(Database.getConnection());
                                    List<Doctor> list2 = dao2.getAllDoctor();
                                    for(Doctor d : list2)
                                    {%>
                                    <tr>
                                        <td><%=d.getfullName()%></td>
                                        <td><%=d.getdob()%></td>
                                        <td><%=d.getqualification()%></td>
                                        <td><%=d.getspecialist()%></td>
                                        <td><%=d.getemail()%></td>
                                        <td><%=d.getmobNo()%></td>
                                        <!--<td><%=d.getpassword()%></td>-->
                                        <td>
                                            <a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                                            <a href="../DeleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
                                        </td>
                                    </tr>  
                                    <%}
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

<!--<script>
  $(document).ready(function() {
    $("form").submit(function(event) {
      event.preventDefault(); // Prevent the default form submission

      // Serialize the form data into a URL-encoded string
      var formData = $(this).serialize();

      // Make the AJAX request
      $.ajax({
        type: "POST",
        url: "../AddDoctor", // URL of the servlet
        data: formData,
        console.log(response);
                if (response.msg === "already present") {
                    // Handle the success response here
                    window.alert("Doctor Already exists");
                } 
                else if (response.msg === "success") {
                    // Handle the success response here
                    window.alert("Doctor Added");
                } 
                else {
                    // Handle the error response here
                    window.alert("Something went wrong");
                }
      });
    });
  });
</script>-->

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
