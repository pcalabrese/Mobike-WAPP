<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Android App</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link id="theme-style" rel="stylesheet" href="/WAPP/css/stiledev.css">
	<link href="/WAPP/css/material.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css"	rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
	
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
  <script src="/WAPP/js/logout.js"></script>
  <script src="/WAPP/js/androidapp.js"></script>
   
   <script>  nickname = "${it.get('user').get('nickname')}";</script>
</head>

<body onLoad="window.scroll(0, 70)">
  <navbar></navbar>
    
  <div class="corpo">
    <!-- ******Android App****** --> 
    <div class="well">
    <section id="android-app" class="docs section">
      <div class="container">
          <h2 class="title text-center">Android App <span class="mdi-action-android" style="color:green"></span></h2>            
          <div class="block text-center">
              <p style="font-size:19px;"><strong class="text-info">Bring your passion in your pocket!</strong></p>
              <p style="font-size:19px;">Record new Itineraries live, share them with your friends,
              manage your Events and start a new ride, all with your smartphone!</p>
            
          </div><!--//block-->
            
            <div class="block">
                <h3 class="sub-title text-center">Features</h3>
                <div class="container" style="font-size:19px;">
                  <div class="row">
                    <div class="col-xs-2"></div>
                    <div class="col-xs-8">
                      <ul class="list-unstyled">
                        <li>
                          <span class="glyphicon glyphicon-record" style="color:red"></span>
                          <strong class="text-info">Live Itinerary <span class="high-feat">Recording</span></strong>: never forget a route anymore!
                        </li>
                        <li>
                          <span class="mdi-social-share" style="color:green"></span>
                          <strong class="text-info"> Social Network <span class="high-feat">Sharing</span></strong>: let your friends be inspired by your rides!
                        </li>
                        <li>
                          <span class="mdi-action-today" style="color:black"></span>
                          <strong class="text-info"><span class="high-feat">Event Management</span></strong>: keep all your planned ride's info in your pocket!
                        </li>
                        <li>
                          <span class="mdi-maps-directions" style="color:blue"></span>
                          <strong class="text-info">Get <span class="high-feat">Directions</span></strong>: choose a route you like and begin your ride!
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
            </div><!--//block-->
            
            <div class="block">
                
                <div class="text-center">
                    <a class="btn btn-primary btn-lg shadow-level4" href="./img/app-debug.apk">
                      <span class="mdi-file-file-download"></span> Download</a>
                </div>
            </div><!--//block-->   
            
            
        </div><!--//container-->
    </section><!--//features-->
  </div>
  
 <footer></footer>
    
    

</body>
</html>
