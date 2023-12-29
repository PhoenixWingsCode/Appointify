<%-- 
    Document   : doctor
    Created on : Jul 9, 2023, 10:17:35 PM
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
        <title>Doctor Page</title>
                
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
                <div class="col-md-5 offset-md-4">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">
                                Add Doctor
                            </p>
                            <form action="../AddDoctor" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" required name="fullname" class="form-control">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        DOB
                                    </label>
                                    <input type="date" required name="dob" class="form-control">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Qualification
                                    </label>
                                    <input type="text" required name="qualification" class="form-control">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label text-start">
                                        Specialist
                                    </label>
                                    <select name="specialist" required class="form-control">
                                        <option>--select--</option>
                                        <%
                                            SpecialistDAO dao = new SpecialistDAO(Database.getConnection());
                                            List<Specialist> list=dao.getAllSpecialist();
                                            for(Specialist s : list){%>
                                            <option><%=s.getSpecialistName()%></option>
                                            <%}
                                        %>
                                        <option>demo</option>                                        
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Email
                                    </label>
                                    <input type="text" required name="email" class="form-control">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Mobile No.
                                    </label>
                                    <input type="text" required name="mobno" class="form-control">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Password
                                    </label>
                                    <input type="password" required name="password" class="form-control">
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
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
