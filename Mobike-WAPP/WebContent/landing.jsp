<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<head>
	<title>MoBike - Landing</title>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link id="theme-style" rel="stylesheet" href="/WAPP/css/stiledev.css">
	<link href="/WAPP/css/material.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css"	rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>

	<script src="/WAPP/js/landing.js"></script>
</head>

<body data-spy="scroll" >
	<div class="container-fluid">
		<navbar></navbar>
	</div>
	<!-- Carousel -->
	<!-- Wrapper for slides -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">


		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img style="opacity: 0.90; padding-top: 50px;" src="img/slide1.jpg"
					alt="Background Picture">
			</div>

			<div class="item">
				<img style="opacity: 0.90; padding-top: 50px;" src="img/slide2.jpg"
					alt="Background2 Picture" />
			</div>

			<div class="item">
				<img style="opacity: 0.90; padding-top: 50px;" src="img/slide3.jpg"
					alt="Background2 Picture" />
			</div>

			<div class="item">
				<img style="opacity: 0.90; padding-top: 50px;" src="img/slide4.jpg"
					alt="Background2 Picture" />
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>

		<div class="carousel-caption">

			<button type="button" id="login" class="btn btn-primary shadow-level3" onclick="login()" style="margin-top:">Start Here!</button>



		</div>
	</div>
	</div>

	
	<!-- myCarousel--->

	<!-- ******FEATURESNEW****** -->
	<section id="features" class="features section">
  <div class="container">
    <div class="row">
      <div class="col-md-4 text-center">
        <img  src="./img/map.png">
        <h2>Expand your ways</h2>
        <p>Give more space to your rides, create and share events with our community.</p>
      </div><!-- coloumn-->
                    
      <div class="col-md-4 text-center">
        <img class="img-circle" src="./img/event.png">
        <h2>Organize the Passion</h2>
        <p>With an intuitive way to create and join events, every weekend will be memorable.</p>
      </div><!-- coloumn-->
                
      <div class="col-md-4 text-center">
        <img src="./img/Android.png">
        <h2>Always with you</h2>
        <p>A user-friendly app, so you will never brake your enthusiasm.</p>
      </div><!-- coloumn-->
    </div><!-- row-->
  </div><!--//container-->
</section>
	<!--//features-->

	<hr style="margin: 1px 0;">

	<!-- ******Android App****** -->
	<section id="android-app" class="androidapp section">
		<div class="container">
			<div class="text-center">
				<h2 class="text-center">Bring your passion in your pocket</h2>
				<p style="font-size: 19px; padding-top: 15px;">
					Record new Itineraries live, share them with your friends, manage
					your Events</br> and start a new ride, all with your smartphone!
				</p>

				<div class="row">
					<div class="col-xs-4"></div>
					<div class="col-xs-4">
						<div class="text-center">
							<a href="../downloads/app/app-debug.apk"><img class="img-rounded"
								style="width: 175px; height: 80px; padding-top: 20px;"
								src="./img/androidown.png"></a>
						</div>
						<!-- div text-center-->
					</div>
					<!-- coloumn-->
					<div class="col-xs-4"></div>

				</div>
				<!--row-->
			</div>
			<!-- div text-center-->
		</div>
		<!--//container-->
	</section>
	<!--//androidapp-->


	<!-- ******FOOTER****** -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-xs-3"></div>
				<div class="col-xs-4">
					<p>Features</p>
					<p>Android App</p>
				</div>

				<div class="col-xs-4">
					<p>Team</p>
					<p>Follow Us</p>
				</div>
			</div>
			<small class="copyright">Developed for the<a
				href="https://sites.google.com/a/dis.uniroma1.it/google-technologies-for-cloud-and-web-development/"
				target="_blank"> Google Technologies for Cloud and Web
					Developement </a> Workshop
			</small>
		</div>
		<!--//container-->
	</footer>
	
	
	<!--//footer-->

	<div id="regModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">Welcome to Mobike!</h4>
				</div>
				<div class="modal-body">
					<p>Please choose a nickname and insert your Bike Model to
						create an account</p>

					<label for="inputNickname" class="col-lg-2 control-label">Nickname</label>
					<div class="col-lg-10">
						<input class="form-control" id="inputNickname"
							placeholder="Nickname" type="text">
					</div>

					<label for="inputBikeModel" class="col-lg-2 control-label">Bike:</label>
					<div class="col-lg-10">
						<input class="form-control" id="inputBikeModel"
							placeholder="Your Bike Model" type="text">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="regSubmit" class="btn btn-primary">Save
						changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<div id="errModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">Sorry!</h4>
				</div>
				<div class="modal-body">
					<p>Authentication Failed, please reload the page and try again!</p>	
				</div>
				<div class="modal-footer">
					<button type="button" id="errSubmit" class="btn btn-primary">OK</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>
</html>
