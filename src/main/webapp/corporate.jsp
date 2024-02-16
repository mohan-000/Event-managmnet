<%@page import="model.RegistrationM"%>
<%@page import="model.Themes"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha256-..."
    crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<style>

body{
background-color: rgba(10, 105, 100, 0.6);
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
}

.product-details {
	float: left;
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-6"
				style="left: 600px; font-size: 50px; color: white; font-family: san-serif; font-style: italic">
				<p>Corporate Events...!</p>
			</div>
		</div>
	</div>
	
	<%
		RegistrationM r = new RegistrationM(session);
		ArrayList<Themes> al = r.getThemeInfo(request.getParameter("theme"));
		Iterator<Themes> itr = al.iterator();
		while(itr.hasNext()) {
			Themes t = itr.next();
		
	%>
	
	<form action="Book.jsp" method="post">

		<div class="product-container">
			<div class="product-image" style=" margin-right: 200px">
				<img src="images/<%=t.getT_img()%>"
					style="height: 300px; border-radius: 15%; width: 400px;">
			</div>
			<br>
			<div class="product-details">
				<h1><%=t.getT_name()%></h1>
				<input type="hidden" name="tid" value="<%=t.getT_id()%>">
				<h3>&#8377 <%=t.getT_cost()%></h3>
				<p><%=t.getT_info()%></p>
				<input type="hidden" name="themeName" value="<%=t.getT_name()%>">
    				<input type="hidden" name="themeCost" value="<%=t.getT_cost()%>">
    				<button type="submit" name="book" class="button">Book</button>
			</div>
		</div>
	<hr style="clear:both; color:#404040; ">
	</form>
	<% } %>

</body>
</html>
