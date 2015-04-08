<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Itinerary Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link id="theme-style" rel="stylesheet" href="/Mobike-WAPP/css/stiledev.css">
  <!-- Include material.css to include the theme and ripples.css to style the ripple effect -->
  <link href="/Mobike-WAPP/css/material.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
  <script src="../js/loadgpx.js" type="text/javascript"></script>
  <script src="../js/logout.js" type="text/javascript"></script>
  
  <script type="text/javascript">
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
  var json = ${it.get('route')};
  $(document).ready(function(){
	  $.material.init();
	  	var mapOptions = {
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      	};
      	var map = new google.maps.Map(document.getElementById("map"),mapOptions);
      	
      	loadGPXFileIntoGoogleMap(map, "http://localhost:8080/Mobike-SRV/routes/retrieve/"+json.id+"/gpx"); });
  
 
     

</script>
</head>

<body>
	
  <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
              </button>
              <a class="navbar-brand" href="/Mobike-WAPP/home"><img src="/Mobike-WAPP/img/logo.png" class="img-responsive" alt="MoBike"></a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="../itineraries">Itineraries</a></li>
              <li><a href="../events">Events</a></li>
              <li><a href="../androidapp">Android App</a></li>
              <li><a href="../contact">Contact</a></li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <span class="glyphicon glyphicon-user"></span> ${it.get('user').get('nickname')}
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Profile</a></li>
                  <li><a href="#">My Itineraries</a></li>
                  <li><a href="#">My Events</a></li>
                  <div class="divider"></div> 
                  <li><a href="javascript:logout()">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
      </div>
  </nav>
  
  <div class="container-fluid" style="padding-top: 50px;">
    <div class="row">
     <div class="col-xs-3">
      
    <script>
    document.write("<div id=\"well\" class=\"well\"><h1 class=\"text-center\" style=\"font-style:italic;\">"+json.name+"</h1><div><p>"+ json.description  +"</p><p style=\"font-size:18px;\"><span style=\"font-size:30px\" class=\"mdi-maps-directions\"></span><span style=\"font-weight:500;\">"+json.length /1000+" Km  </span>  <span style=\"font-size:30px\" class=\"mdi-device-access-alarms\"></span><span style=\"font-weight:500;\">"+ json.duration/60+" Min.  </span></p><p>Type: <span style=\"font-weight:500;\">"+json.type+"<span></p><p>Creator:  <span style=\"font-weight:500;\">"+json.owner.nickname+"<span></p>");
    document.write("<p>");
    for(i=0;i<json.rating;i++){
    	document.write("<span class=\"mdi-action-star-rate mdi-material-yellow\"  style=\"font-size:38px;\"></span>");
    }
    for(j=0;j<(json.rating-i);j++){
    	document.write("<span class=\"mdi-action-star-rate mdi-material-grey\"  style=\"font-size:38px;\"></span>");
    }
    document.write("<span style=\"font-weight:500;\">"+ json.ratingnumber + "</span>");
    document.write("</p>");
    document.write(" <p style=\"font-size:18px;\"> Difficulty:<span style=\"font-weight:500;\">"+json.difficulty+"</span></p><p style=\"font-size:18px;\"> Bends:<span style=\"font-weight:500;\">"+json.bends+"</p>");
    document.write("<div class=\"btn-group\"><a href=\"javascript:void(0)\" class=\"btn btn-success\">gpx file</a><a href=\"javascript:void(0)\" class=\"btn btn-success\">itn file</a></div></div></div></div>");

    $(document).ready( function( e ){
    	
    	console.log( $('#dafuq').width() );
    	var vvv = $('#dafuq').width();
		var hhh = $('#well').height() + 100;
    	$('#map').css({'width' : ( vvv+'px' ), 'height' : ( hhh+'px' )});
    	
    });
    
	$(window).resize( function( e ){
		var vvv = $('#dafuq').width();
		var hhh = $('#well').height() + 100;
    	$('#map').css({'width' : ( vvv+'px' ), 'height' : ( hhh+'px' )});
	});
	    
    </script>

		<div class="col-xs-9" id="dafuq" style="top:20px;">
			<div id="map" style="width: 400px; height: 200px;"></div>
			<br><br>
		</div>
    </div>
    </div>
    <div class="row"></div>
    <div class="row">
    	<div class="well well-sm"><strong>Reviews:</strong></div>
    	<div class="list-group">
    	<script>
    	var reviews = ${it.get('route').get('reviewList')};
    	
    	for(i=0; i<reviews.length; i++){
    		document.write("<div class=\"list-group-item\"><div class=\"row-action-primary\"><i class=\"mdi-action-perm-identity mdi-material-green\"></i></div><div class=\"row-content\"><div class=\"least-content\">"+reviews[i].owner.nickname+"</div>");
    		document.write("<h4 class=\"list-group-item-heading\">");
    		for(j=0;j<reviews[i].rate;j++){
    			document.write("<span class=\"mdi-action-star-rate mdi-material-yellow\"  style=\"font-size:38px;\"></span>");
    		}
    		
    		document.write("</h4><p class=\"list-group-item-text\">"+reviews[i].message+"</p></div></div><div class=\"list-group-separator\"></div>");
    		
    	}
    	
    	var userid = ${it.get('user').get('id')};
    	var routeid = ${it.get('route').get('id')};
    	for(i=0;i<reviews.length; i++){
			  if(reviews[i].owner.id == userid)
				  $("reviewbutton").hide();
		  }
		  $("reviewbutton").hide();
	  
    	 function recensione(){
    		 
    		 
    		 var json = {
    				 "ReviewPK": {
    					 "usersId": userid.val(),
    					 "routesId": routeid.val(),
    				},
    				 "rate": $('#rate').val(),
    				 "message": $('#textreview').val()
			};
    		 
    		 $.ajax({
    			 type: 'POST',
    			 url: 'http://mobike.ddns.net/SRV/review/insertnew',
    			 contentType: "application/json; charset=utf-8",
    			 data: json,
    			 success: function() {alert("Thank you!"); location.reload();},
    			 error: function() {alert("You can Review only one time for itinerary...update and deletion from web are under development"); location.reload;},
    			 failure: function() {alert("You can Review only one time for itinerary...update and deletion from web are under development"); location.reload;}
    		 });
    	 }
    	 
    		 
    		  
    	
    	</script>
      
        </div>
    </div>
    
    
   <div id="reviewbutton" style="position: fixed; bottom:5%; right:5%">
  <br>
  <br>
  <a data-toggle="modal" data-target="#reviewModal" class="btn shadow-level4 btn-danger  btn-fab mdi-navigation-close" style="position: relative;z-index:9999; left: 90%;"></a>
  </div>
</div>

<div id="reviewModal" class="modal fade">
 <div class="modal-dialog">
  <div class="modal-content">
   <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">Write a Review</h4>
   </div>
   </form>
   </fieldset>
   <div id="mod-body" class="modal-body">
        <div class="form-group">
        <br>
        <label for="Itinerary Type" class="col-lg-2 control-label">Rate</label>
        <div class="col-lg-10">
            <select class="form-control" id="rate">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
            <span class="help-block">Give a rate from 1 (bad) to 5 (wonderful).</span>
        </div>
    </div>
   
    <div class="form-group">
        <label for="textArea" class="col-lg-2 control-label">Review</label>
        <div class="col-lg-10">
            <textarea class="form-control" rows="3" id="textreview"></textarea>
            <span class="help-block">What do you think about this Itinerary?</span>
        </div>
    </div
   </div>
   <div class="form-group>
   <div id="mod-footer" class="modal-footer">
    <button type="button" class="btn btn-default shadow-level2" data-dismiss="modal">Close</button>
    <button type="button" class="btn btn-primary shadow-level2" <a href="javascript:recensione()">Submit</button>
    </div>
    </fieldset>
    </form>
   </div>
  </div>
 </div>
</div>
 

  
  
  
  
  
  <script>
    $(document).ready(function() {
    // This command is used to initialize some elements and make them work properly
    $.material.init();
    });
  </script>
</body>
</html>
