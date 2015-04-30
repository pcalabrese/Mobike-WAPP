<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Event Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link id="theme-style" rel="stylesheet" href="/WAPP/css/stiledev.css">
  <!-- Include material.css to include the theme and ripples.css to style the ripple effect -->
  <link href="/WAPP/css/material.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
  
  
  <script type="text/javascript">
  	event = ${it.get('event')};
  	route = ${it.get('event').get('route')};
  	rid = parseInt("${it.get('event').get('route').get('id')}");
  	usersA = ${it.get('event').get('usersAccepted')};
  	usersI = ${it.get('event').get('usersInvited')};
  	usersR = ${it.get('event').get('usersRefused')};
  	id= ${it.get('event').get('id')};
  	nickname = "${it.get('user').get('nickname')}";
  	ustate = ${it.get('event').get('userState')};
  </script>
   <script src="/WAPP/js/logout.js"></script>
   <script src="/WAPP/js/eventdetail.js"></script>
  <script>
    $(document).ready(function() {
    // This command is used to initialize some elements and make them work properly
    
    
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
  <navbar></navbar>
  
  <div class="container" style="padding-top: 50px;">

    <div class="row" >
    
    <div class="col-lg-4">
    	<div class="well">
    		<h1 class="text-center" style="font-style:italic">${it.get('event').get('name')}</h1>
    		<div>
    		<p class="text-center">
    		${it.get('event').get('description')}
    		</p>
    		<span style="font-size:30px" class="mdi-action-today"></span><span id="edate" style="font-weight:500;"> ${it.get('event').get('startdate')}</span>
    		<p><span style="font-size:30px" class="mdi-maps-place"></span><span style="font-weight:500;">${it.get('event').get('startlocation')}</span></p>
    		<p><span style="font-size:30px" class="mdi-image-edit"></span><span style="font-weight:500;">${it.get('event').get('creationdate')}</span></p>
    		<p><span style="font-size:30px" class="mdi-social-person text-info"></span><span style="font-weight:500;">${it.get('event').get('owner').get('nickname')}</span></p>
    		<p><span style="font-size:30px" class="mdi-social-group text-success"></span><span style="font-weight:500;">${it.get('event').get('acceptedSize')}</span>
    		<span style="font-size:30px" class="mdi-social-group text-warning"></span><span style="font-weight:500;">${it.get('event').get('invitedSize')}</span>
    		<span style="font-size:30px" class="mdi-social-group text-danger"></span><span style="font-weight:500;">${it.get('event').get('refusedSize')}</span></p>
    		    		
    		
    		</div>

    	</div>

    </div>
    <div class="col-lg-8" style="padding-top:20px;text-align: -webkit-center;">
    <a id="rimageurl" target="_blank">
    	
    	
    </a>
    
			
	</div>
	</div>
	<div class="row">
	<hr>	
		<div class="col-xs-4">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th><span class="mdi-notification-event-available text-success" style="font-size:22px;"></span></th>
					<th>Nickname</th>
				</tr>	 
			</thead>
			<tbody id="accepted">
				
			</tbody>
		</table>
		
		</div>
		<div class="col-xs-4">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th><span class="mdi-notification-event-note text-warning" style="font-size:22px;"></span></th>
					<th>Nickname</th>
				</tr>	 
			</thead>
			<tbody id="invited">
				
				
			</tbody>
		</table>
		</div>
		
		<div class="col-xs-4">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th><span class="mdi-notification-event-busy text-danger" style="font-size:22px;"></span></th>
					<th>Nickname</th>
				</tr>	 
			</thead>
			<tbody id="refused">
				
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
  
  <footer></footer>
  
  
  <div id="partModal" class="modal fade">
 <div class="modal-dialog">
  <div class="modal-content">
   <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">Write a Review</h4>
   </div>
   <form>
   <fieldset>
   <div id="mod-body" class="modal-body">
        
   </div>
   <div class="form-group">
   <div id="mod-footer" class="modal-footer">
    
    <button type="button" class="btn btn-primary shadow-level2" id="pclose">OK</button>
    
    
    </div>
    </div>
    </fieldset>
    </form>
   </div>
  </div>
 </div>
  

 
</body>
</html>

