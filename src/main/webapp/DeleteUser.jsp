<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="model.RegistrationM"%>

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
<title>Delete</title>
<style>

body{
background-color: rgba(255, 0, 255, 0.8);
}
.navbar-nav li:hover {
	color: white;
}

.user {
	border-radius: 50%;
	position: relative;
	height: 50px;
}

.form-container {
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: rgba(255, 255, 255, 0.9);
	padding-bottom: 20px;
	padding-left: 30px;
	padding-right: 30px;
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

.message {
	color: black;
	font-size: 50px;
	position: relative;
	padding-top: 0px;
	margin-left: 33%;	
}



</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="Home.jsp">Home</a></li>
					<li><a href="ContactUs.jsp">Contact Us</a></li>
					<li><a href="">Help</a></li>
					<li><a href="MyAccount.jsp">MyAccount</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="" style="color: white">Delete</a></li>
					<li><a href="Search.jsp">Search</a></li>
					<li><a href="LoginForm.jsp">LogOut <span
							class="glyphicon glyphicon-log-out"></span></a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="message">
		<%
		if (request.getAttribute("status") != null) {
		%>
		<%=request.getAttribute("status")%>
		<%
		}
		%>
	</div>

	<div class="form-container">
		<form action="delete" method="post">
			<h2>Delete User</h2>
			<div class="form-group">
				<img class="user" alt="user" src="images/user.png"><br> <br>
				<input type="text" id="UrId" name="UrId"
					placeholder="Enter the UserId...">
			</div>
		</form>
	</div>

	
	<div class="container" style="padding-top: 23%;">
		<table class="table" style="margin-left: -0.5%">
			<thead>
				<tr style="background-color:rgba(255, 255, 255, 0.9); color: black;">
					<th><center>UserId</center></th>
					<th><center>Username</center></th>
					<th><center>Phone</center></th>
					<th><center>Email</center></th>
					<th><center>Date</center></th>
					<th><center>Action</center></th>
				</tr>
			</thead>
			<tbody id="info">

				<%
				if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")) {
					RegistrationM reg = new RegistrationM(session);
					ArrayList<User> mydata = reg.getUserDetails();

					Iterator<User> itr = mydata.iterator();
					while (itr.hasNext()) {
						User s = itr.next();
				%>
				<tr>
					<td><center><%=s.getId()%></center></td>
					<td><center><%=s.getName()%></center></td>
					<td><center><%=s.getphone()%></center></td>
					<td><center><%=s.getemail()%></center></td>
					<td><center><%=s.getdate()%></center></td>
					<td>
						<form action="delete" method="POST" style="padding-left: 30%">
							<input type="hidden" name="userid" value="<%=s.getId()%>" /> <input
								type="submit" class="btn btn-danger" value="Delete" />
						</form>
					</td>
				</tr>

				<%
				}
				}
				%>


			</tbody>
		</table>
	</div>

	<script>
		$(document)
		.ready(function() {
			$("#UrId").on("keyup",function() {
				var value = $(this).val().toLowerCase();
				$("#info tr").filter(function() {
					$(this).toggle($("td:first", this).text().toLowerCase().indexOf(value) > -1)
					});
				});
			});
	</script>

</body>
</html>