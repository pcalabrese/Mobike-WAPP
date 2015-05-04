<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="icon" type="image/png" href="/WAPP/img/favicon.png"/>
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link id="theme-style" rel="stylesheet" href="/WAPP/css/stiledev.css">
	<link href="/WAPP/css/material.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css"	rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
	
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
	<script type="text/javascript">var json = ${it};</script>
	<script type="text/javascript">nickname = "${it.get('user').get('nickname')}";</script>
	<script type="text/javascript">routes = ${it.get('routes')};</script>
  <script src="/WAPP/js/logout.js"></script>
  <script src="/WAPP/js/index.js"></script>
</head>

<body>
	
	<navbar></navbar>
    
    <div class="corpo">
    <div class="container">           
        <div class="row" style="padding-top:20px">
            <h2 align="center">Expand your horizons!</br>
              <small>Get inspired by our users' Itineraries.</small>
            </h2>
         <br>
        </div>
          
          <div class="well well-lg">
          <div class="row" id="routesRow">
			
			</div>
			<div class="text-center">
            <a href="itineraries" class="btn btn-primary shadow-level3" role="button">Go To Itineraries</a>
        	</div>
			</div>
        <br>
        
        <div class="row">
                <h2 align="center">Organize your passion</br>
                <small>Discover the last Events created by the MoBike community.</small></h2>      
        </div>
        
        <br>
        <div class="well">
          <div class="row" id="eventsRow">
             
        </div>
        <div class="text-center">
            <a href="events" class="btn btn-primary shadow-level3" role="button">Go to Events</a>
            
          
        </div>
        </div>
        </br>
        
    <footer></footer>
    </div>
    </div>
    
    
    
  
</body>
</html>
