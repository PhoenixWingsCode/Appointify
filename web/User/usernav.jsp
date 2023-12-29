<%--
    Document   : navbar
    Created on : Jun 27, 2023, 9:12:24 AM
    Author     : Hiral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.entity.User" %>
<%
    // Retrieve the User object from the session
    com.entity.User user = (com.entity.User) session.getAttribute("userObj");
%>
<%--<%@include file="com.entity.User"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navigation Bar User Page</title>
            <style>
/* NAVIGATION */
nav {
  width: 100%;
  margin: 0 auto;
  background:blue;
  padding: 50px 0;
  box-shadow: 0px 5px 0px #dedede;
}
nav ul {
  list-style: none;
  text-align: center;
}
nav ul li {
  display: inline-block;
}
nav ul li a {
  display: block;
  padding: 15px;
  text-decoration: none;
  color:white;
  font-weight: 800;
  text-transform: uppercase;
  margin: 0 10px;
}
nav ul li a,
nav ul li a:after,
nav ul li a:before {
  transition: all .5s;
}
nav ul li a:hover {
  color: black;
}

/* Circle */
nav.circle ul li a {
  position: relative;
  overflow: hidden;
  z-index: 1;
  color: black;
}
nav.circle ul li a:after {
  display: block;
  position: absolute;
  margin: 0;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  content: '.';
  color:transparent;
  width: 1px;
  height: 1px;
  border-radius: 50%;
  background: transparent;
}
nav.circle ul li a:hover:after {
  -webkit-animation: circle 1.5s ease-in forwards;
}
/* Keyframes */
@-webkit-keyframes circle {
  0% {
    width: 1px;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    margin: auto;
    height: 1px;
    z-index: -1;
    background: black;
    border-radius: 100%;
  }
  100% {
    background: red;
    height: 5000%;
    width: 5000%;
    z-index: -1;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    border-radius: 0;
  }
}
.dropdown-username {
  display: flex;
  align-items: center;
  border: 1px solid #ccc;
  padding: 5px 10px;
  border-radius: 5px;
}

.dropdown-username span:last-child {
  margin-left: 5px;
}
</style>
    </head>
    <body><nav class="navbar navbar-expand-lg bg-body-success circle">
  <div class="container-fluid">
      <a class="navbar-brand" href="User/userindex.jsp" style="color:white">
          <img src="../Images/hospital.png" alt="hospital" width="40" height="40" style="vertical-align: middle; margin-right: 10px;">
            MEDI VERSE
      </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <li class="nav-item">
            <a class="nav-link active animate__animated animate__fadeIn" aria-current="page" href="user_appointment.jsp" style="color: white">
                <img src="../Images/appointment.png" alt="doctor" width="40" height="40" style="vertical-align: middle; margin-right: 10px;font-weight: bold">
                APPOINTMENT
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link active animate__animated animate__fadeIn" aria-current="page" href="view_appointment.jsp" style="color: white">
                <img src="../Images/view appointment.png" alt="doctor" width="40" height="40" style="vertical-align: middle; margin-right: 10px;font-weight: bold">
                VIEW APPOINTMENT
            </a>
        </li>
<li class="nav-item dropdown">   
  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
    <div class="dropdown-username">
    <img src="../Images/user.png" alt="doctor" width="30" height="30" style="vertical-align: middle; margin-right: 10px;font-weight: bold">
    <span><%= user.getfullName() %></span>
      <span><i class="fas fa-chevron-down"></i></span>
    </div>
  </a>
  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
    <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
    <li><a class="dropdown-item" href="../UserLogout">Logout</a></li>
  </ul>
</li>
      </ul>
    </div>
  </div>
</nav>
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
