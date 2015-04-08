<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Event Details</title>
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
   <script src="../js/Logout.js"></script>
  <script>
    $(document).ready(function() {
    // This command is used to initialize some elements and make them work properly
    $.material.init();
    
    $("participation").hide();
    var users = ${it.get('event').get('usersInvited')};
    
    var id2 = ${it.get('user').get('id')};
    for(i=0; i< users.length; i++){
    	if(users[i].id == id2)
    		$("participation").show();
    	}
    });
    

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
              <a class="navbar-brand" href="../home"><img src="../img/logo.png" class="img-responsive" alt="MoBike"></a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li> <a href="../itineraries">Itineraries</a></li>
              <li class=active><a href="../events">Events</a></li>
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
                  <li><a href="logout()">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
      </div>
  </nav>
  
  <div class="container" style="padding-top: 50px;">

    <div class="row" >
    
    <div class="col-xs-4">
    	<div class="well">
    		<h1 class="text-center" style="font-style:italic">${it.get('event').get('name')}</h1>
    		<div>
    		<p>
    		${it.get('event').get('description')}
    		</p>
    		<span style="font-size:30px" class="mdi-device-access-alarms"></span>
    		<span style="font-weight:500;"> ${it.get('event').get('startdate')}</span>
    		<p>Starts in: <span style="font-weight:500;">${it.get('event').get('startlocation')}</span></p>
    		<p>Created: <span style="font-weight:500;">${it.get('event').get('creationdate')}</span></p>
    		<p>Creator: <span style="font-weight:500;">${it.get('event').get('owner').get('nickname')}</span></p>
    		<p>Users Invited: <span style="font-weight:500;">${it.get('event').get('invitedSize')}</span></p>
    		<p>Users Accepted: <span style="font-weight:500;">${it.get('event').get('acceptedSize')}</span></p>
    		<p>Users Refused: <span style="font-weight:500;">${it.get('event').get('refusedSize')}</span></p>
    		    		
    		
    		</div>

    	</div>

    </div>
    <div class="col-xs-8" style="padding-top:20px;">
    <script>var a = ${it.get('event').get('route')};</script>
    <script>document.write("<a href=\"../itineraries/"+a.id+"\" target=\"_blank\"><img class=\"img-responsive\" src=\""+ a.imgUrl + "&size=800x450\"></a>");
    </script>
			
	</div>
	</div>
	<div class="row">
		<div class="col-xs-4">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>Nickname</th>
				</tr>	 
			</thead>
			<tbody>
				<tr class="success">
					<script>
					var users = ${it.get('event').get('usersAccepted')};
					for (i=0;i<users.length;i++){
						document.write("<td>"+i+"</td><td>"+users[i].nickname+"</td>");
					}
					</script>
				</tr>
			</tbody>
		</table>
		
		</div>
		<div class="col-xs-4">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>Nickname</th>
				</tr>	 
			</thead>
			<tbody>
				
					<script>
						var users = ${it.get('event').get('usersInvited')};
						for (i=0;i<users.length;i++){
							document.write("<tr class=\"info\"><td>"+i+"</td><td>"+users[i].nickname+"</td></tr>");
						}
					</script>
					
				
			</tbody>
		</table>
		</div>
		
		<div class="col-xs-4">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>Nickname</th>
				</tr>	 
			</thead>
			<tbody>
				<tr class="danger">
					<script>
						var users = ${it.get('event').get('usersRefused')};
						for (i=0;i<users.length;i++){
							document.write("<td>"+i+"</td><td>"+users[i].nickname+"</td>");
						}
					</script>
				</tr>
			</tbody>
		</table>
		</div>
		
		
	</div>
  <div id="participation" style="position: fixed; bottom:5%; right:5%">
  <a class="btn shadow-level4 btn-primary  btn-fab mdi-action-done" style="position: relative;z-index:9999; left: 90%;" href="javascript:accept()"></a>
  <br>
  <br>
  <a class="btn shadow-level4 btn-danger  btn-fab mdi-navigation-close" style="position: relative;z-index:9999; left: 90%;" href="javascript:decline()"></a>
  </div>
  </div>
  
  
  
  <script>
  function accept(){
	  var id= ${it.get('event').get('id')};
	  var json = "{\"id\":"+id+"}";
	  $.ajax({
		  type: 'POST',
		  url: 'http://mobike.ddns.net/WAPP/events/participation/accept',
		  data: json,
		  contentType: 'application/json',
		  success: function(){
			  alert ("You're in!");
			  location.reload();
		  },
		  error: function(){alert("error");},
		  failure: function(){alert("failure");}
		 
		});
  }
  
  function decline(){
	  var id= ${it.get('event').get('id')};
	  var json = "{\"id\":"+id+"}";
	  $.ajax({
		  type: 'POST',
		  url: 'http://mobike.ddns.net/WAPP/events/participation/decline',
		  data: json,
		  contentType: 'application/json',
		  success: function(){
			  alert ("You're out !");
			  location.reload();
		  },
		  error: function(){alert("error");},
		  failure: function(){alert("failure");}
		 
		});
  }
  
  
  
  
  </script>
 
</body>
</html>

