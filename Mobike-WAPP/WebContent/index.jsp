<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link id="theme-style" rel="stylesheet" href="css/stiledev.css">
  <!-- Include material.css to include the theme and ripples.css to style the ripple effect -->
  <link href="./css/material.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
  <script src="./js/logout.js"></script>
</head>

<body>
	<script>
	var json = ${it};
	</script>
  <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
              </button>
              <a class="navbar-brand" href="#"><img src="./img/logo.png" class="img-responsive" alt="MoBike"></a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="itineraries">Itineraries</a></li>
              <li><a href="events">Events</a></li>
              <li><a href="androidapp">Android App</a></li>
              <li><a href="contact">Contact</a></li>
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
    
    <div class="corpo">
    <div class="container">           
        <div class="row" style="padding-top:20px">
            <h2 align="center">Expand your horizons!</br>
              <small>Get inspired by our users' Itineraries.</small>
            </h2>
         <br>
        </div>
          
          
          <div class="row">
			<script>
            for(i=0; i<json.routes.length; i++){
            document.write("<div class=\"col-xs-4\"> <div class=\"panel panel-"+json.routes[i].type+"\"> <div class=\"panel-heading\"> <h3 class=\"panel-title\">" + json.routes[i].name + "</h3> "+ json.routes[i].length/1000 + " " + json.routes[i].duration + "</br> " + json.routes[i].owner.nickname + " </div> <div class=\"panel-body\" style=\"background-color:#f5f5f5\"> <img class=\"img-responsive\" src=\""+json.routes[i].imgUrl+"&size=300x300\"></div></div></div>");
            }
            </script>
			</div>
        <br>
        <div class="text-center">
            <a href="#" class="btn btn-primary shadow-level3" role="button">Scopri tutti gli Itinerari</a>
        </div>
        <div class="row">
                <h2 align="center">Organize your passion</br>
                <small>Discover the last Events created by te MoBike community.</small></h2>      
        </div>
        
        <br>
        
          <div class="row">
           <script>
           for(i=0;i<json.events.length;i++){
        	   document.write( "<div class=\"col-xs-4\"> <div class=\"panel panel-event\"> <div class=\"panel-heading\"> <h3 class=\"panel-title\">" + json.events[i].name +  "</h3> </div> <div class=\"panel-body\" style=\"background-color:#f5f5f5;\"> <p> "+ json.events[i].startdate + "<p>"+ json.events[i].startlocation + "</p><span class=\"label label-success\"><span class=\"mdi-action-done\"> 23</span></span><span class=\"label label-warning\"><span class=\"mdi-action-help\"> 4</span></span><span class=\"label label-danger\"><span class=\"mdi-content-clear\"> 12</span></span></div>   </div></div>");}
           </script>  
        </div>
        </br>
        <div class="text-center">
            <a href="#" class="btn btn-primary shadow-level3" role="button">Scopri tutti gli Eventi</a>
            <hr>
          
        </div>
    
    <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="container text-center">
            <small class="copyright">Developed for the<a href="https://sites.google.com/a/dis.uniroma1.it/google-technologies-for-cloud-and-web-development/" target="_blank"> Google Technologies for Cloud and Web Developement </a> Workshop</small>
        </div><!--//container-->
    </footer><!--//footer-->
    </div>
    </div>
    
    
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
  <script>
    $(document).ready(function() {
    // This command is used to initialize some elements and make them work properly
    $.material.init();
    });
  </script>
</body>
</html>
