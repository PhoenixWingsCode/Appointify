<%-- 
    Document   : view_appointment
    Created on : Aug 5, 2023, 9:56:30 AM
    Author     : Hiral
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.Database"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Appointment Page</title>
        <%@include file="../Component/allCSS.jsp"%>
        <style type="text/css">
            .paint-card{
                box-shadow: 0 0 8px 0 rgba(0,0,0,0.3);
            }
            
            .backImg{
                /*background-image: linear-gradient(rgba(0,0,0,.4),rgba(0,0,0,.4)), url("Images/hospital carousel.png"));*/
                height:20vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }
            
            button{
                color:blue;
            }
        </style>
    </head>
    <body>
        <%@include file="usernav.jsp" %>
<!--        
        <div class="container-fluid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>-->
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-3">
                                User Appointment
                            </p>

<%
    // Retrieve the User object from the session
    user = (com.entity.User) session.getAttribute("userObj");
%>
                            
                            <form class="row g-3" action="..\AppointmentServlet" method="post">
                                <input type="hidden" name="userId" value="<%=user.getId()%>">
                                
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label"> 
                                        Full Name
                                    </label>
                                    <input required type="text" class="form-control" name="fullname">
                                </div>
                                
                                <div class="col-md-6">
                                    <label class="form-label">Gender</label>
                                    <select class="form-control" name="gender" required>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">
                                        Age
                                    </label>
                                    <input required type="number" class="form-control" name="age">
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">
                                        Appointment Date
                                    </label>
                                    <input required type="date" class="form-control" name="appoint_date">
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">
                                        Email
                                    </label>
                                    <input required type="email" class="form-control" name="email">
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">
                                        Phone No.
                                    </label>
                                    <input maxlength="10" required type="number" class="form-control" name="phoneNo">
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">
                                        Diseases
                                    </label>
                                    <input required type="text" class="form-control" name="diseases">
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">
                                        Doctor
                                    </label>
                                    <select required class="form-control" name="doctor">
                                        <option value="">--select--</option>
                                        
                                        <%
                                            DoctorDAO dao = new DoctorDAO(Database.getConnection());
                                            List<Doctor> list = dao.getAllDoctor();
                                            for(Doctor d : list){
                                            %>
                                            <option value="<%=d.getId()%>"><%=d.getfullName()%> (<%=d.getspecialist()%>)</option>;
                                            <%
                                            }
                                        %>
                                    </select>
                                </div>
                                
                                <div class="col-md-12">
                                    <label>Full Address</label>
                                    <textarea required name="address" class="form-control"
                                              rows="3" cols=""></textarea>
                                </div>
                                
                                <button class="col-md-12 btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../Component/footer.jsp" %>   
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
