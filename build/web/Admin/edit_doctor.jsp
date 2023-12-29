<%-- 
    Document   : edit_doctor
    Created on : Jul 22, 2023, 2:15:55 PM
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
        <title>Edit Doctor Page</title>
                
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
                <div class="col-md-4 offset-md-4">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">
                                Edit Doctor Details
                            </p>

                            <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            DoctorDAO dao2 = new DoctorDAO(Database.getConnection());
                            Doctor d = dao2.getDoctorById(id);
                            %>
                            <form action="../UpdateDoctor" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" required name="fullname" class="form-control"
                                           value="<%=d.getfullName()%>">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        DOB
                                    </label>
                                    <input type="date" required name="dob" class="form-control" 
                                           value="<%=d.getdob()%>">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Qualification
                                    </label>
                                    <input type="text" required name="qualification" class="form-control" 
                                           value="<%=d.getqualification()%>">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label text-start">
                                        Specialist
                                    </label>
                                    <select name="specialist" required class="form-control">
                                        <option><%=d.getspecialist()%></option>
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
                                    <input type="text" required name="email" class="form-control" value="<%=d.getemail()%>">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Mobile No.
                                    </label>
                                    <input type="text" required name="mobno" class="form-control" value="<%=d.getmobNo()%>">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">
                                        Password
                                    </label>
                                    <input type="text" required name="password" class="form-control" value="<%=d.getpassword()%>">
                                </div>
                                
                                <input type="hidden" name="id" value="<%=d.getId()%>">
                                <button type="submit" class="btn btn-primary col-md-12">Update</button>
                            </form>
                        </div>
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
