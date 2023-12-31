<%-- 
    Document   : change_password
    Created on : Aug 12, 2023, 12:03:16 AM
    Author     : Hiral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password Page</title>
        
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

        <!-- Includes Navigation bar -->
        <%@include file="usernav.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <p class="text-center fs-3">Change Password</p>
                        <div class="card-body">
                            <form action="../ChangePassword" method="post">
                                <div class="mb-3">
                                    <label>Enter New Password</label>
                                    <input type="text" name="newPassword" class="form-control" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label>Enter Old Password</label>
                                    <input type="text" name="oldPassword" class="form-control" required>
                                </div>
                                
                                <input type="hidden" value="${userObj.getId()}" name="uid">
                                
                                <button class="btn btn-success col-md-12">Change Password</button>
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
