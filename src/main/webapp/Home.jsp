<!DOCTYPE html>
<html lang="en">
<head>
<title>Home Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		new WOW().init();
	});
</script>

<style>

#myCarousel {
	margin-top: -30px;
}

.container1 {
	position: absolute;
	text-align: center;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: black;
	font-size: 80px;
}

.desc {
	position: absolute;
	text-align: center;
	top: 60%;
	left: 52%;
	transform: translate(-50%, -50%);
	color: black;
	font-size: 50px;
}

.container2 {
	position: absolute;
	text-align: center;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #fff;
	font-size: 100px;
}

.desc2 {
	position: absolute;
	text-align: center;
	top: 70%;
	left: 52%;
	transform: translate(-50%, -50%);
	color: #fff;
	font-size: 30px;
}

.navbar-nav li:hover {
	color: white;
}

.container3 {
	width: 300px;
	height: 300px;
	perspective: 800px;
	display: inline-block;
	margin: 0 75px;
}

.card {
	height: 100%;
	width: 300px;
	position: relative;
	transition: transform 1000ms;
	transform-style: preserve-3d;
	left: 60px;
}

.front, .back {
	height: 100%;
	width: 100%;
	border-radius: 2rem;
	box-shadow: 0 0 5px 2px rgba(50, 50, 50, 0.25);
	position: absolute;
	backface-visibility: hidden;
}

.front {
	height: 300px;
	width: 300px;
	background-size: 100% 100%;
}

.container3:hover>.card {
	cursor: pointer;
	transform: rotateY(180deg);
}

.back {
	background-color: #3a3a3a;
	color: white;
	transform: rotateY(180deg);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 2rem;
}

.learn-more-button {
	padding: 10px 20px;
	background-color: #3a3a3a;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	border: 2px solid white;
	font-size: 16px;
	cursor: pointer;
}

.navbar-nav .open .dropdown-menu>li>a {
	font-family: 'Times New Roman';
	font-size: 16px;
	background-color: #333;
	color: #fff;
}

.container4 { 
 	width: 50px; 
 	height: 50px; 
 	padding-left: 135px; 
 	border-radius: 20%; 
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
			<div class="collapse navbar-collapse" id="myNavbar"
				style="font-family: times new roman; font-size: 18px">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><span
							class="glyphicon glyphicon-list"></span></a>
						<ul class="dropdown-menu">
							<li><a href="ContactUs.jsp">Contact Us</a></li>
							<li><a href="Help.jsp">Help</a></li>
							<li><a href="MyAccount.jsp">MyAccount</a></li>
							<%
							if (session.getAttribute("id").equals("1")) {
							%>
							<li><a href="DeleteUser.jsp">Delete</a></li>
							<li><a href="Search.jsp">Search</a></li>
							<%
							}
							%>
						</ul></li>
					<li><a href="#" style="color: white">Home</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="LoginForm.jsp">LogOut <span
							class="glyphicon glyphicon-log-out"></span></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="myCarousel" class="carousel" data-ride="carousel"
		data-interval="3000">
		<ol class="indicators" style="display: none">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active" style="height: 50rem; opacity: 0.8">
				<img src="images/baday1.jpg" alt="Img1"
					style="width: 100%; height: 100%" class="overlay">
				<div class="container"
					style="font-color: white; font-family: times new roman;">
					<p class="container1">
						<b>Welcome</b>
					</p>
					<p class="desc">Make any occasion unforgettable...</p>
				</div>
			</div>
			<div class="item" style="height: 50rem; opacity: 0.9">
				<img src="images/c2.jpg" alt="Image 2"
					style="width: 100%; height: 100%" class="overlay">
				<div class="container"
					style="font-color: white; font-family: times new roman">
					<!-- <p class="container2">
						<b>About Us</b>
					</p> -->
					<!-- <p class="desc2">Event Decorations are a full-service wedding
						and event planners, design and coordination company based in India
						who are passionate about our work and are committed to assist our
						clients with all aspects of the planning process from start to
						finish.</p> -->
				</div>
			</div>
			<div class="item" style="height: 50rem; opacity: 0.8">
				<img src="images/holi3.jpg" alt="Image 3"
					style="width: 100%; height: 100%" class="overlay">
			</div>
			<div class="item" style="height: 50rem; opacity: 0.8">
				<img src="images/wedding.jpg" alt="Image 4"
					style="width: 100%; height: 100%" class="overlay">
			</div>
			<div class="item" style="height: 50rem; opacity: 0.8">
				<img src="images/colll.jpeg" alt="Image 5"
					style="width: 100%; height: 100%" class="overlay">
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<br>

	<div class="events"
		style="text-align: center; font-family: Lucida Handwriting; font-size: 50px;">
		<p>Events with elegance...!</p>
	</div>

	<br>

	<div class="container3 wow fadeInLeft" data-mdb-wow-duration="1s"
		data-mdb-wow-delay="0.5s">
		<div class="card">
			<div class="front" style="background-image: url(images/Birthday.jpg)">
			</div>
			<div class="back">
				<div class="info" style="text-align: center">
					<h2>Birthday</h2>
					<p>Turning another year older? Let us make it bolder!</p>
					<br> <a href="bday.jsp?theme=bday" class="learn-more-button">View More</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container3 wow fadeIn" data-mdb-wow-duration="1s"
		data-mdb-wow-delay="0.5s">
		<div class="card">
			<div class="front" style="background-image: url(images/wedding1.jpg)">
			</div>
			<div class="back">
				<div class="info" style="text-align: center">
					<h2>Wedding</h2>
					<p>A stylish wedding begins with us</p>
					<br> <a href="wed.jsp?theme=wed" class="learn-more-button"
						name="Wedding">View More</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container3 wow fadeInRight" data-mdb-wow-duration="1s"
		data-mdb-wow-delay="0.5s">
		<div class="card">
			<div class="front" style="background-image: url(images/conc1.jpeg)">
			</div>
			<div class="back">
				<div class="info" style="text-align: center">
					<h2>Concert</h2>
					<p>Exclusive events, priceless memories</p>
					<br> <a href="concert.jsp?theme=con" class="learn-more-button" name="Concert">View More</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="container3 wow fadeInLeft" data-mdb-wow-duration="1s"
		data-mdb-wow-delay="0.5s">
		<div class="card">
			<div class="front" style="background-image: url(images/holi.jpg)">
			</div>
			<div class="back">
				<div class="info" style="text-align: center">
					<h2>Holi</h2>
					<p>Share love, joy, and colorful moments during Holi to make it
						memorable</p>
					<br> <a href="holi.jsp?theme=holi" class="learn-more-button" name="Holi">View
						More</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container3 wow fadeIn" data-mdb-wow-duration="1s"
		data-mdb-wow-delay="0.5s">
		<div class="card">
			<div class="front"
				style="background-image: url(images/corporate1.jpg"></div>
			<div class="back">
				<div class="info" style="text-align: center">
					<h2>Corporate</h2>
					<p>Designing your perfect day</p>
					<br> <a href="corporate.jsp?theme=corporate" class="learn-more-button" name="Corporate">View
						More</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container3 wow fadeInRight" data-mdb-wow-duration="1s"
		data-mdb-wow-delay="0.5s">
		<div class="card">
			<div class="front" style="background-image: url(images/collegeEvent.jpg)">
			</div>
			<div class="back">
				<div class="info" style="text-align: center">
					<h2>College Events</h2>
					<p>Congratulations on your new arrival!</p>
					<br> <a href="college.jsp?theme=coll" class="learn-more-button" name="College">View More</a>
				</div>
			</div>
		</div>
	</div>
	<br> <br> <br>
	<div class="container4" data-mbd-wow-duration="1s" data-mdb-wow-delay="0.5s" >
		<div class="AboutUs" style="text-align: center">
			<a href="ContactUs.jsp"><img src="images/AU.jpg" alt="AU" width="250" height="250"></a>  
		</div>
	</div>
</body>
</html>
