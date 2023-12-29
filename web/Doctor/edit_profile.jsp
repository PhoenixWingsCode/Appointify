<%-- 
    Document   : edit_profile
    Created on : Aug 17, 2023, 11:33:22 PM
    Author     : Hiral
--%>

<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecialistDAO"%>
<%@page import="com.db.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Doctor Page</title>
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
        
        <div class="container p-4">
            <div class="row">
                <div class="col-md-4">
                    <div class="card paint-card">
                        <p class="text-center fs-3">Change password</p>
                        <div class="card-body">
                            <form action="../DoctorChangePassword" method="post">
                                <div class="mb-3">
                                    <label>Enter New Password</label>
                                    <input type="text" name="newPassword" class="form-control" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label>Enter Old Password</label>
                                    <input type="text" name="oldPassword" class="form-control" required>
                                </div>
                                
                                <input type="hidden" value="${DoctorObj.getId()}" name="uid">
                                
                                <button class="btn btn-success col-md-12">Change Password</button>
                            </form>
                        </div>                        
                    </div>
                </div>
                
                <div class="col-md-5 offset-md-2">
                    <div class="card paint-card">
                        <p class="text-center fs-3">Edit Profile</p>
                        <div class="card-body">
                            <form action="../DoctorUpdateProfile" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" required name="fullname" class="form-control" value="${DoctorObj.fullName}">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        DOB
                                    </label>
                                    <input type="date" required name="dob" class="form-control" value="${DoctorObj.dob}">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Qualification
                                    </label>
                                    <input type="text" required name="qualification" class="form-control" value="${DoctorObj.qualification}">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label text-start">
                                        Specialist
                                    </label>
                                    <select name="specialist" required class="form-control">
                                        <option>${DoctorObj.specialist}</option>
                                        <%
                                            SpecialistDAO dao = new SpecialistDAO(Database.getConnection());
                                            List<Specialist> list=dao.getAllSpecialist();
                                            for(Specialist s : list){%>
                                            <option><%=s.getSpecialistName()%></option>
                                            <%}
                                        %>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Email
                                    </label>
                                    <input type="text" readonly name="email" class="form-control" value="${DoctorObj.email}">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Mobile No.
                                    </label>
                                    <input type="text" required name="mobno" class="form-control" value="${DoctorObj.mobNo}">
                                </div>
                                
                                <input type="hidden" name="id" value="${DoctorObj.id}">
                                <button type="submit" class="btn btn-primary">Update</button>
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
