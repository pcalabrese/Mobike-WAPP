<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mobike - User Profile</title>

	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link id="theme-style" rel="stylesheet" href="/WAPP/css/stiledev.css">
	<link href="/WAPP/css/material.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css"	rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
	<link href="/WAPP/css/jquery.nouislider.pips.min.css" rel="stylesheet">
  	<link href="/WAPP/css/jquery.nouislider.min.css" rel="stylesheet">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
	<script src="/WAPP/js/jquery.nouislider.all.js"></script>
	<script src="/WAPP/js/userprofile.js"></script>
	<script type="text/javascript">
		user = ${it.get('user')};
		myevents = ${it.get('user').get('eventsOwned')};
		myroutes = ${it.get('user').get('routeList')};
		eventsinv = ${it.get('user').get('eventsInvited')};
		nickname = "${it.get('user').get('nickname')}";
	</script>
</head>
<body>

<navbar>
</navbar>

 <div class="container-fluid" style="padding-top: 60px;">
    <div class="row">
    	<div class="col-xs-3">
     		<div id="well" class="well">
     		<img id="userimg" class="img-responsive" alt=""></img>
     		<b>Name:</b><legend id="uname" class="label-control"></legend>
     		<b>Email:</b><h5 id="uemail" class="text-info"></h5>
     		<b>Nickname:</b><h5 id="unickname"></h5>
     		<b>BikeModel:</b><h5 id="ubikemodel"></h5>
     		
     		
      		</div>
     	</div>
     	<div class="col-xs-9">
     	
     	</div>
    
    
    </div>
 </div>

<div id="floatbuttons" style="position: fixed; bottom:5%; right:5%">
  
  <a  id="displayevents" class="btn btn-success btn-fab shadow-level4 mdi-action-today" style="position: relative;z-index:9999; left: 90%;"></a>
  
  <br/>
  <br/>
  <a  id="displayroutes" class="btn btn-primary btn-fab shadow-level4 mdi-maps-navigation" style="position: relative;z-index:9999; left: 90%;"></a>
  <br/>
  <br/>  
  <a  id="displayinvitations" class="btn btn-danger btn-fab shadow-level4 mdi-notification-event-note" style="position: relative;z-index:9999; left: 90%;"></a>
  </div>

<footer></footer>
</body>
</html>