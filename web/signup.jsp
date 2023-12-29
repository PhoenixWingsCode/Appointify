<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Signup Page</title>

    <!-- Bootstrap CSS and JS -->
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
                
                var fullname = $('input[name="fullname"]').val();
                var phonenumber = $('input[name="phonenumber"]').val();
                var email = $('input[name="email"]').val();
                var password = $('input[name="password"]').val();

                $.ajax({
                    url: 'UserRegister',
                    type: 'POST',
                    data: {
                        fullname: fullname,
                        phonenumber: phonenumber,
                        email: email,
                        password: password
                    },
                    success: function (response) {
                        // Handle the response from the servlet
                        if (response === 'failed') {
                            alert('Registration failed'); 
                        } else if (response === 'user_exists') {
                            alert('User already registered');
                        } else {
                            alert('Registration successful');
                            window.location.href = 'user_login.jsp';
                        }
                    },
                    error: function () {
                        alert('An error occurred during registration');
                    }
                });
            });
        });
    </script>

</head>
<body>

<!-- Includes Navigation bar -->
<%@include file="Component/Navbar.jsp" %>

<!-- User Signup Card-->
<div class="container p-5">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-4 text-center">
                        User Register
                    </p>

                    <p id="message" class="text-center text-custom fs-3" style="color:blue">${message}</p>
                    <p id="error_message" class="text-center text-custom fs-3" style="color:blue">${error_message}</p>

                    <form>
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input required name="fullname" type="text" class="form-control" pattern="^[A-Za-z]+ [A-Za-z]+$">
                        </div>

                        <div class="mb-1">
                            <label class="form-label">Phone Number</label>
                            <div class="input-group">
                                <span class="input-group-text">&#x1F1EE;&#x1F1F3;</span>
                                <span class="input-group-text">+91</span>
                                <input required name="phonenumber" type="tel" class="form-control" pattern="[0-9]{10}">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email address</label>
                            <input required name="email" type="email" class="form-control" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input required name="password" type="password" class="form-control" autocomplete="new-password">
                        </div>

                        <button type="submit" class="btn bg-custom text-white col-md-12" style="background-color: blue">
                            Register
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
