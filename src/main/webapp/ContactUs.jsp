<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Contact Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .navbar-nav li:hover {
            color: white;
        }

        .Que {
            font-size: 50px;
            font-style: bold;
            color: black;
        }

        .con {
            font-size: 40px;
            background-color: #87CEEB; /* Sky Blue */
            padding: 10px; /* Add padding for better visibility */
        }

        .ph {
            font-size: 30px;
            color: red;
        }

        .team-section {
            background-color: #FFD700; /* Gold */
            padding: 10px; 
        }

        .team-section h2 {
            font-size: 40px;
            margin-bottom: 30px;
            color: black;
        }

        .team-member-img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<!-- Navbar Section -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="ContactUs.jsp" style="color: white">Contact Us</a></li>
                <li><a href="Help.jsp">Help</a></li>
                <li><a href="MyAccount.jsp">MyAccount</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="LoginForm.jsp">LogOut <span class="glyphicon glyphicon-log-out"></span></a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Contact Information Section -->
<div class="container text-center" style="font-family: san-serif">
    <div class="Que"><p>For any Queries</p></div>
    <div class="con"><p>Please contact us</p></div>
    <div class="ph"><p>9014036085</p></div>
</div>

<!-- Team Members Section -->
<div class="container team-section mt-5">
    <h2 class="text-center">Our Team</h2>
    <div class="row">
        <div class="col-md-3 col-sm-6 text-center">
            <img src="images/My_Pic1.jpg" alt="Team Member 1" class="team-member-img">
            <h3>Basetti Shanmugam</h3>
            <p>Position: Developer</p>
            <p>Email: shanmugam2001b@gmail.com</p>
        </div>
        <div class="col-md-3 col-sm-6 text-center">
            <img src="images/Vikki_Pic.jpg" alt="Team Member 2" class="team-member-img">
            <h3>Bata Vikki</h3>
            <p>Position: Designer</p>
            <p>Email: batavikki@gmail.com</p>
        </div>
        <div class="col-md-3 col-sm-6 text-center">
            <img src="images/Hemanth_Pic.jpg" alt="Team Member 3" class="team-member-img">
            <h3>A Hemanth</h3>
            <p>Position: Tester</p>
            <p>Email: Hemanth162@gmail.com</p>
        </div>
        <div class="col-md-3 col-sm-6 text-center">
            <img src="images/mohan.jpeg" alt="Team Member 4" class="team-member-img">
            <h3>Aavula mohan</h3>
            <p>Position: Analyst</p>
            <p>Email: mohanyadav30175@gmail.com.com</p>
        </div>
    </div>
</div>

</body>
</html>
