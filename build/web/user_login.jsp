<%-- 
    Document   : user_login
    Created on : Jun 5, 2023, 4:53:58 PM
    Author     : Hiral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login Page</title>
        
        <!-- Bootstrap .C.S.S and J.S-->
        <%@include file="Component/allCSS.jsp" %>
        
        <style type="text/css">
            .paint-card{
                box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
            }
        </style>
        
    </head>
    <body>
        <!-- Includes Navigation bar -->
        <%@include file="Component/Navbar.jsp" %>
        
        <!-- User Login Card-->
        <div class="container p-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-4 text-center">
                                User Login
                            </p>
                            
                    <p id="message" class="text-center text-custom fs-3" style="color:blue">${message}</p>
                    <p id="error_message" class="text-center text-custom fs-3" style="color:blue">${error_message}</p> 

                            
                            <form action="UserLogin" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Email address</label>
                                    <input required name="email" type="email" class="form-control">
                                </div>                                    
                                
                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <input required name="password" type="password" class="form-control" autocomplete="new-password">
                                </div>
                                
                                <button type="submit" class="btn bg-custom text-white col-md-12" style="background-color: blue">
                                    Login
                                </button>
                            </form>
                            
                            <br>Don't have an account?<a href="signup.jsp" style="text-decoration: none">
                                create one
                            </a>
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
        }
    </script>
    
    </body>
</html>
