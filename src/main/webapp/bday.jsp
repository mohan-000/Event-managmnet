<%@page import="model.RegistrationM"%>
<%@page import="model.Themes"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="your-actual-integrity-value" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<style>
body{
background-color: rgba(255, 0, 255, 0.5);
}

body .container-fluid {
	background-color: black;
}

.container {
	width: 100%;
	margin: 0 auto;
	background-color: lightpink;
	padding: 20px;
	box-sizing: border-box;
	text-align: center;
}

.button {
	padding: 10px;
	border-radius: 10%;
	font-weight: bold;
}

.product-container {
	overflow: hidden;
	padding: 20px;
}

.product-image {
	float: left;
	margin-right: 20px;
	cursor: pointer;
}

.product-details {
	float: left;
}

.modal-dialog {
	width: 80%;
}

.modal-body img {
	max-width: 100%;
	height: auto;
	display: block;
	margin: 0 auto;
}
</style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-6"
				style="left: 550px; font-size: 50px; color: white; font-family: san-serif; font-style: italic">
				<p>Birthday Event...!</p>
			</div>
		</div>
	</div>

	<%
	RegistrationM r = new RegistrationM(session);
	ArrayList<Themes> al = r.getThemeInfo(request.getParameter("theme"));
	Iterator<Themes> itr = al.iterator();
	while (itr.hasNext()) {
		Themes t = itr.next();
	%>

	<form action="Book.jsp" method="post">
		
		<div class="product-container">
			<div class="product-image" style="margin-right: 200px"
				data-toggle="modal" data-target="#imageModal<%=t.getT_id()%>">
				<img src="images/<%=t.getT_img()%>"
					style="height: 300px; border-radius: 15%; width: 400px;">
			</div>
			<br>
			<div class="product-details">
				<h1><%=t.getT_name()%></h1>
				<input type="hidden" name="tid" value="<%=t.getT_id()%>">
				<h3>
					&#8377
					<%=t.getT_cost()%></h3>
				<p><%=t.getT_info()%></p>
					<input type="hidden" name="themeName" value="<%=t.getT_name()%>">
    				<input type="hidden" name="themeCost" value="<%=t.getT_cost()%>">
    				<button type="submit" name="book" class="button">Book</button>
			</div>
		</div>
		<hr style="clear: both; color: black;">
	</form>

	<%
	}
	%>

	<%
	Iterator<Themes> itrModal = al.iterator();
	while (itrModal.hasNext()) {
		Themes t = itrModal.next();
	%>
	<div class="modal fade" id="imageModal<%=t.getT_id()%>" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<img src="images/<%=t.getT_img()%>" class="img-fluid"
						alt="Product Image">
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>

</body>
</html>
