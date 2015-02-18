<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Itinerary details...</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="../css/styles.css" rel="stylesheet">
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
        <script src="../js/loadgpx.js" type="text/javascript"></script>
        <script type="text/javascript">
            //<![CDATA[
                       
        var a = window.location.href;
		var b = a.substring(40);

            function loadGPXFileIntoGoogleMap(map, filename) {
                $.ajax({url: filename,
                    dataType: "xml",
                    success: function(data) {
                      var parser = new GPXParser(data, map);
                      parser.setTrackColour("#ff0000");     // Set the track line colour
                      parser.setTrackWidth(5);          // Set the track line width
                      parser.setMinTrackPointDelta(0.001);      // Set the minimum distance between track points
                      parser.centerAndZoom(data);
                      parser.addTrackpointsToMap();         // Add the trackpoints
                      parser.addWaypointsToMap();           // Add the waypoints
                    }
                });
            }

            $(document).ready(function() {
                var mapOptions = {
                  zoom: 8,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("map"),
                    mapOptions);
                loadGPXFileIntoGoogleMap(map, "http://mobike.ddns.net/SRV/routes/retrieve/"+b+"/gpx"); });
               
            $(document).ready(function(){
                						var jsonuri = "http://mobike.ddns.net/SRV/routes/retrieve/"+b;
                						$.getJSON(jsonuri,function(result){
                							$.each(result, function(i, field){
                						        $("#jsonpanel").append("<b><color=#168ccc>"+i+": </b></color>" + field + "    ");
                														   });
            							});
            });
               

        //]]>
</script>
	</head>
	<body>
	<div id="ciao"></div>
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
        <li><a href="/WAPP/home">Home</a></li>
        <li class="active"><a href="/WAPP/itineraries">Itineraries</a></li>
        <li><a href="/WAPP/events">Events</a></li>
        <li><a href="/WAPP/aboutus">About Us</a></li>
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
    
      <h2>Map and Route Info</h2>
       
      <hr>
      
   	<div class="panel panel-default">
        <div class="panel-heading" id="jsonpanel"><b>ITINERARY DETAILS <br><br></b></div>
      </div>
      <p></p>
      <div id="map" style="width: 100%; height: 100%;"></div>
      <p>&nbsp;</p>
      
      <hr>
      
      <p>
     
      </p>

        
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