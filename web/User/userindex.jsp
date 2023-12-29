<%-- 
    Document   : index
    Created on : Jun 27, 2023, 9:07:51 AM
    Author     : Hiral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Index Page</title>
        <!-- Bootstrap .C.S.S and J.S-->
        <%@include file="../Component/allCSS.jsp" %>
      
        <style type="text/css">
            .paint-card{
                box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
                text-align: center;
            }
            
            .card-img {
                padding-left: 20px;
                padding-right:20px;
                max-width: 100%;
                height:100%;
                object-fit: contain;  
                display: block;
                margin: 0 auto;
            }
            
            .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
            }
        </style>
    </head>
    <body>
                <!-- Includes Navigation bar -->
        <%@include file="usernav.jsp" %>
        <!-- Carousel -->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../Images/hospital carousel.png" class="d-block w-100" alt="..." height="500px">
                </div>
                <div class="carousel-item">
                    <img src="../Images/doctor carousel.png" class="d-block w-100" alt="..." height="500px">
                </div>
                <div class="carousel-item">
                    <img src="../Images/appointment carousel.png" class="d-block w-100" alt="..." height="500px">
                </div>
                <div class="carousel-item">
                    <img src="../Images/diagnosis carousel.png" class="d-block w-100" alt="..." height="500px">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
        </div>
        
        <!-- 4 informative cards -->
        <div class="container p-3">
            <p class="text-center fs-2" style="font-family: Arial, sans-serif;font-size: 28px;font-weight: bold;text-align: center;color: black;padding: 10px;">
                Key Features of our Hospital
                </p>
            
            <div class="row">
                <div class="col-md-8 p-1">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card paint-card">
                                <div class="card-body">
                                    <p class="fs-5">
                                        100% safety
                                    </p>
                                    <p>
                                        Ensuring the highest level of safety and well-being for our patients and staff is our top priority.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                           <div class="card paint-card">
                                <div class="card-body">
                                    <p class="fs-5">
                                        Clean Environment
                                    </p>
                                    <p>
                                        We maintain a pristine and hygienic environment to ensure the well-being and comfort of our patients
                                    </p>
                                </div>
                            </div> 
                        </div>
                        <div class="col-md-6 mt-2">
                            <div class="card paint-card">
                                <div class="card-body">
                                    <p class="fs-5">
                                        Friendly Doctors
                                    </p>
                                    <p>
                                        Our doctors ensure a positive healthcare experience through personalized care and support.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mt-2">
                            <div class="card paint-card">
                                <div class="card-body">
                                    <p class="fs-5">
                                        Medical Research
                                    </p>
                                    <p>
                                        Our hospital actively engages in cutting-edge medical research to advance healthcare and improve patient outcomes.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <img alt="doctors" src="../Images/doctors.png" width="400px" height="350px">
                </div>
            </div>
            
            <hr>
            
            <!-- Team members -->
            
            <div class="container p-2">
                <p class="text-center fs-2" style="font-family: Arial, sans-serif;font-size: 28px;font-weight: bold;text-align: center;color: black;padding:10px;">            
                  Our Team
                </p>
                
                <div class="row">
                    <div class="col-md-3">
                        <div class="card paint-card">
                            <div class="card-body text-center">
                                <img src="../Images/neha sharma.png" class="img-fluid card-img">
                                <p class="fw-bold fs-5">Neha Sharma</p>
                                <p class="fs-7">General Practitioner</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card paint-card">
                            <div class="card-body text-center">
                                <img src="../Images/sanjay gupta.png" class="img-fluid card-img">
                                <p class="fw-bold fs-5">Rajesh Gupta</p>
                                <p class="fs-7">Neurologist</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card paint-card">
                            <div class="card-body text-center">
                                <img src="../Images/pooja khanna.png" class="img-fluid card-img">
                                <p class="fw-bold fs-5">Pooja Khanna</p>
                                <p class="fs-7">Pediatrician</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card paint-card">
                            <div class="card-body text-center">
                                <img src="../Images/dhruv sharma.png" class="img-fluid card-img">
                                <p class="fw-bold fs-5">Dhruv Sharma</p>
                                <p class="fs-7">Psychiatrist</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- footer -->
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
