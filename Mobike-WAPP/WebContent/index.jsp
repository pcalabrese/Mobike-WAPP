<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>MoBike, Share your routes!</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/styles.css" rel="stylesheet">
		<style type="text/css">
		.hide { display: none;}
		.show { display: block;}
		</style>
	</head>
	
<body>
<div class="navbar navbar-custom navbar-fixed-top">
 <div class="navbar-header"><a class="navbar-brand" href="#">MoBike</a>
        <span class="icon-bar">
      <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      </a>
     </span>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="home">Home</a></li>
        <li><a href="itineraries">Itineraries</a></li>
        <li><a href="aboutus">About Us</a></li>
        <li><a href="events">Events</a></li>
        <li>&nbsp;</li>
      </ul>
      <form class="navbar-form">
        <div class="form-group" style="display:inline;">
          <div class="input-group">
            <div class="input-group-btn">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Category 1</a></li>
                <li><a href="#">Category 2</a></li>
                <li><a href="#">Category 3</a></li>
                <li><a href="#">Category 4</a></li>
                <li><a href="#">Category 5</a></li> 
              </ul>
            </div>
            
            <input type="text" class="form-control" placeholder="Search for routes (under development)">
            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span> </span>
            <input type="button" class="myButton" value="Logout" onclick="logout()" style="vertical-align: middle; text-align:right; float:right;"/>
            
          </div>
        </div>
      </form>
    </div>
</div>
<div id="map-canvas"></div>
<div class="container-fluid" id="main">
  <div class="row">
  	<div class="col-xs-8" id="left">
    	<div id="imgcontainer" margin-left:"300"></div>
        <hr>
      <h2><img src="images/logo.png" width="600" height="220"></h2> 
      <hr>
   	<div class="panel panel-default">
        <div class="panel-heading" id="maintitle"><a href="">What is Mobike?</a></div>
    </div>
       <hr>
       <hr>
      <p id="maintext">Mobike is an app to create, share and discover routes for motorcycle enthusiasts!    <br> Record your trip with our mobile app and share it with your friends, browse uploaded itineraries available on the website </p>
   	<br>
   		<div id="profile">Nome: ${user.name} Cognome: ${user.surname} Email: ${user.email} Id: ${user.id}</div>
   	
   	</br>
   	<br></br>
   	<hr>
   	<hr>
      <p>
      	<a href="https://sites.google.com/a/dis.uniroma1.it/google-technologies-for-cloud-and-web-development/" target="_ext" class="center-block btn btn-primary">Google Workshop for Cloud and Web Development</a>
      </p>     
    <hr>      
    </div>
  	</div>
	</div>
	
 
	<script type="text/javascript">
		function logout(){
			alert("bottone premuto");
			$.ajax({
		        	type: "GET",
		        	url: "/WAPP/logout",
		        	data: "",
		        	contentType: "text/plain",
		        	dataType: "text",
		        	success: function(data){window.location=data},
		        	failure: function(errMsg) {alert(errMsg);},
		        	error: function(asd, text, wetr){alert(text);}
		  	});
    	}
	</script>
	</body>
</html>