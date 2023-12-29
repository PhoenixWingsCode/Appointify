<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Login Page</title>

    <!-- Bootstrap .C.S.S and J.S-->
    <%@include file="Component/allCSS.jsp" %>

    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function () {
            // Submit form using AJAX
            $('form').submit(function (event) {
                event.preventDefault(); // Prevent form submission
                
                var username = $('input[name="username"]').val();
                var password = $('input[name="password"]').val();

                $.ajax({
                    url: 'AdminLogin',
                    type: 'POST',
                    data: {
                        username: username,
                        password: password
                    },
                    success: function (response) {
                        // Handle the response from the servlet
                        if (response === 'success') {
                            window.location.href = 'Admin/index.jsp';
                        } else {
                            alert('Login failed');
                        }
                    },
                    error: function () {
                        alert('An error occurred during login');
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

</head>
<body>
    <!-- Includes Navigation bar -->
    <%@include file="Component/Navbar.jsp" %>

    <!-- Admin Login Card-->
    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center">
                            Admin Login
                        </p>

                        <% 
                            String message = (String) session.getAttribute("message");
                            session.removeAttribute("message"); // Remove the message from the session

                            if (message != null) {
                        %>
                            <script>
                                alert("<%= message %>");
                            </script>
                        <% } %>

                        <form>
                            <div class="mb-3">
                                <label class="form-label">Username</label>
                                <input required name="username" type="username" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input required name="password" type="password" class="form-control" autocomplete="new-password">
                            </div>

                            <button type="submit" class="btn bg-custom text-white col-md-12" style="background-color: blue">
                                Login
                            </button>
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
