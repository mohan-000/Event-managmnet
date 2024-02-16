<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignIn</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>

<style>
body {
	position: relative;
	background-color:rgba(255, 0, 155, 0.7);
	background-size: cover;
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
}

.overlay {
	position: relative;
	top: 0;
	left: 0;
	height: 100%;
	opacity: 0.1;
}

.logo {
	position: absolute;
	top: 5px;
	left: 50px;
	width: 120px;
	height: 100px;
}

.header {
	float: right;
	margin-top: 40px;
}

.header a {
	color: white;
	text-decoration: none;
	margin-right: 10px;
	padding: 12px;
	font-size: 22px;
	display: inline-block;
	transition: transform 0.3s;
}

.header a:hover {
	color: black;
	background-color: aqua;
	border-radius: 12px;
}

.footer {
	color: black;
	font-size: 30px;
	font-family: cursive;
	position: fixed;
	bottom: 0;
	text-align: center;
	width: 100%;
}

.form-container {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: rgba(255, 255, 255, 0.7);
	padding: 40px;
	border-radius: 10px;
	text-align: center;
}

.form-container h2 {
	text-align: center;
	margin-bottom: 0px;
}

.form-group {
	margin-bottom: 0px;
	text-align: left;
}

.form-group label {
	font-weight: bold;
	margin-bottom: 0px;
}

.form-group input {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 10px;
}

.form-group button {
	width: 100%;
	padding: 10px;
	background-color: green;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	margin-top: 10px;
}

.error {
	color: red;
	text-align: center;
}

.message {
  color: white;
  font-size: 30px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: 80px;
  transform: translate(-50%, -50%);
  text-align: center;
}
</style>
</head>
<body>

	<img src="images/Events_logo.jpg" alt="Logo" class="logo">

	<div class="header">

		<a href="">Login</a> <a href="RegistrationForm.jsp">Register</a> <a href="">Help</a>
	</div>

	<script>
		jQuery.validator
				.addMethod(
						"Email",
						function(value, element) {
							return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
									.test(value)
									|| /^[0-9]{10}$/.test(value);
						});
		jQuery(document)
				.ready(
						function($) {
							$("#signin")
									.validate(
											{
												rules : {
													mailId : {
														required : true,
														Email : true
													},
													password : {
														required : true,
														minlength : 6
													}
												},

												messages : {
													mailId : {
														required : "Please enter the email",
														email : "Please enter valid email id"
													},
													password : {
														required : "Please enter the password.",
														minlength : "Please enter the password greater than or equal to  6",
													}
												}
											});
						});
	</script>

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
		<h2>Login</h2>
		<br>
		<form method="post" id="signin" action="registration">
			<div class="form-group">
				<input type="text" id="mailId" name="mailId" placeholder="Enter Email">
			</div>
			<div class="form-group">
				<input type="password" id="pwd" name="password" placeholder="Enter Password">
			</div>
			<div class="form-group">
				<button type="submit" name="login" value="Login">Login</button>
				<div class="form-group" style="text-align: center">
					<br> <a href="ForgotPassword.jsp" style="color: blue; font-weight: bolder;">Forgot Password?</a>
				</div>
			</div>
		</form>
	</div>


</body>
</html>