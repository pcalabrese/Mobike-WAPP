<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Create Event</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link id="theme-style" rel="stylesheet" href="../css/stiledev.css">
  <!-- Include material.css to include the theme and ripples.css to style the ripple effect -->
  <link href="../css/material.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
  <script src="../js/logout.js"></script>
  <script>
  function apri(url) {
			newin = window.open(url,'Route Preview', 'scrollbars=yes,resizable=yes,width=600,height=600,toolbar=no');
		}
  
    $(document).ready(function() {
    // This command is used to initialize some elements and make them work properly
    $.material.init();
    
    $.getJSON("http://localhost:8080/Mobike-WAPP/getitineraries", function(data){
		var result = data;
		makeTable(data);
		});
    
    function makeTable(data){
    	for(i=0;i<data.length;i++){
    		$("tbody").append("<tr><td><input type=\"radio\" id=\"routeId\" name=\"routeId\" value=\""+data[i].id+"\"> <a href=\"javascript:apri(\'http://mobike.ddns.net/WAPP/itineraries/"+data[i].id+"\');\">"+data[i].id+"</a></td><td>"+data[i].name+"</td><td>"+data[i].length/1000+"</td><td>"+data[i].duration/60+"</td><td>"+data[i].bends+"</td><td>"+data[i].difficulty+"</td></tr>");
    	}
    }
    
    });
    
    
  </script>
  

</head>

<body >
  <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
              </button>
              <a class="navbar-brand" href="../home"><img src="../img/logo.png" class="img-responsive" alt="MoBike"></a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="../itineraries">Itineraries</a></li>
              <li><a href="../events">Events</a></li>
              <li><a href="../androidapp">Android App</a></li>
              <li><a href="../contact">Contact</a></li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <span class="glyphicon glyphicon-user"></span> Marco 
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Profile</a></li>
                  <li><a href="#">My Itineraries</a></li>
                  <li><a href="#">My Events</a></li>
                  <div class="divider"></div> 
                  <li><a href="Logout()">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
      </div>
  </nav>
  
 <a class="btn shadow-level4 btn-primary  btn-fab mdi-content-save"
          style="position: fixed;z-index:9999;
    bottom: 5%;
    right: 5%;" href="javascript:void(0)"> </a>



<div class="container" style="padding-top:60px;" >
  <div class="row" style="padding-top:20px">
  <form class="form-horizontal" action="insertnew" method="POST">
  	<fieldset>
    <div class="col-xs-5">
	    <div class="well">
	  	
	    
	        <legend>New Event</legend>
	        <div class="form-group">
	            <label for="name" class="col-lg-2 control-label">Name</label>
	            <div class="col-lg-10">
	                <input type="text" class="form-control" id="name" name="name" placeholder="name">
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="description" class="col-lg-2 control-label">Desc</label>
	            <div class="col-lg-10">
	                <input type="text" class="form-control" id="description" name="description" placeholder="event description">
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="date" class="col-lg-2 control-label">Date</label>
	            <div class="col-lg-10">
	                <input type="date" class="form-control" id="date" name="date" placeholder="">
	            </div>
	        </div>
	        <div class="form-group">
	        	<label for="time" class="col-lg-2 control-label">Time</label>
	        	<div class="col-lg-10">
	        		<input type="time" class="form-control" id="time" name="time" placeholder="">
	        	</div>
	        </div>
	        <div class="form-group">
	        	<label for="startlocation" class="col-lg-2 control-label">Where</label>
	        	<div class="col-lg-10">
	        		<input type="text" class="form-control" id="startLocation" name="startlocation" placeholder="">
	        	</div>
	        </div>  
	        <div class="form-group">
	        	<label for="invites" class="col-lg-2 control-label">Where</label>
	        	<div class="col-lg-10">
	        		<input type="text" class="form-control" id="invites" name="invites" placeholder="nickname separated by comma">
	        	</div>
	        </div>      
	        <br>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
	               	<button class="btn btn-default">Cancel</button>
	              		<button type="submit" class="btn btn-primary btn-raised">Submit</button>
	       		</div>
	       	</div>
	       	
	        </div>
	        </div>
	        <div class="col-xs-6">
        	
        	<table class="table table-striped table-hover">
        		<thead>
        			<tr>
        				<th>#</th>
        				<th>Name</th>
        				<th>Length</th>
        				<th>Time</th>
        				<th>Bends</th>
        				<th>Diff.</th>
        			</tr>
        		</thead>
        		<div class="form-group">
        		<tbody></tbody></div>
        	</table>
        	
        
        </div>
	        </fieldset>
	       	</form>
        
        
        
        
        </div>
        
        
        
        
        
        
    

    </div><!--coloumn-->
    </div>


 


  
</body>
</html>

