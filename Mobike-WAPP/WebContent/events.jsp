<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Events</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link id="theme-style" rel="stylesheet" href="./css/stiledev.css">
  <!-- Include material.css to include the theme and ripples.css to style the ripple effect -->
  <link href="./css/material.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
   <script src="./js/Logout.js" type="text/javascript"></script>
   
  <script>
    $(document).ready(function() {
    // This command is used to initialize some elements and make them work properly
    $.material.init();
    });
  </script>
  
</head>

<body>
<script> var json = ${it}</script>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="./home"><img src="./img/logo.png" class="img-responsive" alt="MoBike"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./itineraries">Itineraries</a></li>
        <li class="active"><a href="#">Events</a></li>
        <li><a href="./androidapp.html">Android App</a></li>
        <li><a href="./contact.html">Contact</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
          <span class="glyphicon glyphicon-user"></span> ${it.get('user').get('nickname')}
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Profile</a></li>
            <li><a href="#">My Itineraries</a></li>
            <li><a href="#">My Events</a></li>
            <div class="divider"></div> 
            <li><a href="#">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
  <!--***END NAVBAR****-->
  
 <a class="btn shadow-level4 btn-primary  btn-fab mdi-content-add"
          style="position: fixed;z-index:9999;
    bottom: 5%;
    right: 2%;" href="events/new"></a>
    
    
    
  <div class="container" style="padding-top:50px;">
    <div class="row">
    <div class = "col-xs-4">
    <div class="well">
        <form class="form-horizontal">
          <fieldset>
            <legend>Events</legend>
            
        <div class="form-group">
            <label for="name" class="col-lg-2 control-label">Name</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="startLoc" placeholder="Event name" 
                 data-hint="Specify a name">
			</div>
        </div>
              <br>
            <div class="form-group">
            <label for="startloc" class="col-lg-2 control-label">Start Location</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="startloc" placeholder="Event starting from.." 
                 data-hint="Specify a location">
			</div>
        </div>
            <br>
					
				<div class="form-group">
           			 <div class="col-lg-10 col-lg-offset-2">
                		<button class="btn btn-default">Cancel</button>
                		<button type="submit" class="btn btn-primary">Submit</button>
            		</div>
        		</div>
			</div>
			</fieldset>
			</form>
			</div>
      
    
    
      <div class="col-xs-8" style="padding-top:20px;">
              <div class="list-group">
              
              
              <script>
              for(i=0;i<json.events.length; i++){
            	  document.write("<div class=\"list-group-item\"><div class=\"row-action-primary\"><i class=\"mdi-social-group done\"></div></i><div class=\"row-content\"><div class=\"least-content\"></div><h4 class=\"list-group-item-heading\"><a href=\"./events/"+json.events[i].id+"\">" +json.events[i].name+"</a></h4><p class=\"list-group-item-text\"> Start in: <b>"+json.events[i].startlocation+"</b> at: <b>"+json.events[i].startdate+"</b></p><span class=\"label label-success\"><span class=\"mdi-action-done\"> "+json.events[i].acceptedSize+"</span></span><span class=\"label label-warning\"><span class=\"mdi-action-help\"> "+json.events[i].invitedSize+"</span></span><span class=\"label label-danger\"><span class=\"mdi-content-clear\"> "+json.events[i].refusedSize+"</span></span></p></div></div>");
            	  document.write("<div class=\"list-group-separator\"></div>");
              }
              
              
              </script>

      </div><!--list group-->
      </div>   
    </div>
  
  
  
  

  <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="container text-center">
            <small class="copyright">Developed for the<a href="https://sites.google.com/a/dis.uniroma1.it/google-technologies-for-cloud-and-web-development/" target="_blank"> Google Technologies for Cloud and Web Developement </a> Workshop</small>
        </div><!--//container-->
    </footer><!--//footer-->
    
</body>
</html>
