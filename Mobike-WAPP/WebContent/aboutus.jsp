<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>About Us</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
	</head>
	<body>
<!-- begin template -->
<div class="navbar navbar-custom navbar-fixed-top">
 <div class="navbar-header"><a class="navbar-brand" href="#">MoBike</a>
        <span class="icon-bar">
      <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      </a>
     </span>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="home">Home</a></li>
        <li><a href="itineraries">Itineraries</a></li>
        <li><a href="events">Events</a></li>
        <li class="active"><a href="aboutus">About Us</a></li>
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
            <div class="nameCnt">Logged in as: ${user.name}</div>
          </div>
        </div>
      </form>
    </div>
</div>
<div class="container-fluid" id="main">
  <div class="row">
  	<div class="col-xs-8" id="left">
    
      <h2>MoBike Team: About Us</h2>
      
      <hr>
      <div class="panel panel-default">
        <div class="panel-heading"><a href="">Bruno Vispi</a></div>
      </div>
      <p>Student at RomaTre University of Rome. <a href="mailto:bvispi@gmail.com">Email: bvispi@gmail.com</a> </p>
     
      <hr>
      
      <hr>
      <div class="panel panel-default">
        <div class="panel-heading"><a href="">Paolo Calabrese</a></div>
      </div>
      <p>Student at RomaTre University of Rome. <a href="mailto:paolocalabrese@gmail.com">Email: paolocalabrese@gmail.com</a> </p>
      
      <hr>
       
      <hr>
      
      <div class="panel panel-default">
        <div class="panel-heading"><a href="">Marco Esposito</a></div>
      </div>
      <p>Student at La Sapienza University of Rome. <a href="mailto:Esposito.marco19@gmail.com ">Email: esposito.marco19@gmail.com </a> </p>
      
      <hr>
       
      <hr>
        <div class="panel panel-default">
        <div class="panel-heading"><a href="">Andrea Donati</a></div>
      </div>
      <p>Student at La Sapienza University of Rome. <a href="mailto:donati.andrea.00@gmail.com ">Email: donati.andrea.00@gmail.com </a> </p>
      
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