<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.User" %>
<%@page import="model.RegistrationM" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Home</title>
<style>

body{
background-color: rgba(255,0,255,0.8);
}
.navbar-nav li:hover {
	color: white;
}

.user {
	border-radius: 50%;
	position: relative;
	height: 100px;
}

.form-container {
	position: fixed;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: rgba(255, 255, 255, 0.9);
	padding-bottom: 60px;
	padding-left: 30px;
	padding-right:30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	text-align: center;
	max-width: 400px;
	width: 80%;
}

.form-container input {
	width: 100%;
	padding: 5px;
	margin-bottom: 10px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

.form-container button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px; 
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.form-container button:hover {
	background-color: #45a049;
}
.button-container {
    position: absolute;
    padding-bottom:30px;
    left: 50%;
    transform: translateX(-50%);
}

.message {
	color: black;
	margin-left: 50px;
	font-size: 50px;
	position: relative;
	top: 0px;
	left: -40px;
	margin-left: 435px;
	margin-right: 100px;
}

</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="Home.jsp">Home</a></li>
					<li><a href="ContactUs.jsp">Contact Us</a></li>
					<li><a href="">Help</a></li>
					<li><a href="MyAccount.jsp" style="color: white">MyAccount</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
					if (session.getAttribute("id").equals("1")) {
					%>
					<li><a href="DeleteUser.jsp">Delete</a></li>
					<li><a href="Search.jsp">Search</a></li>
					<%
					}
					%>
					<li><a href="LoginForm.jsp">LogOut <span
							class="glyphicon glyphicon-log-out"></span></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<%if(session.getAttribute("uname")!=null) {
		RegistrationM reg = new RegistrationM(session);
		User u = reg.getInfo();
	%>
	
    <div class="form-container">
        <form action="registration" method="post">
            <h2>My Account</h2>
            <div class="form-group" style="position: relative;">
                <img class="user" alt="user" src="images/user.png"><br><br>
                <input type="text" id="username" name="username" value="<%=u.getName()%>">
            </div>
              <div class="form-group">
                <input type="text" id="phone" name="phone" value="<%=u.getphone()%>">
            </div>
            <div class="form-group">
                <input type="text" id="mailId" name="mailId" value="<%=u.getemail() %>" >
            </div>
            <div class="button-container">
                <button type="submit" class="btn btn-primary" name="update">Update</button>
            </div>
        </form>
    </div>

<% } %>

<div class="message">
		<%
		if (request.getAttribute("status") != null) {
		%>
		<%=request.getAttribute("status")%>
		<%
		}
		%>

	</div>
</body>
</html>