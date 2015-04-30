<!DOCTYPE html>
<html lang="en">
<head>
<title>MoBike - Events</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link id="theme-style" rel="stylesheet" href="/WAPP/css/stiledev.css">
	<link href="/WAPP/css/material.min.css" rel="stylesheet">
	<link href="/WAPP/css/jquery-ui.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css"	rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
	<link href="/WAPP/css/jquery.nouislider.pips.min.css" rel="stylesheet">
  	<link href="/WAPP/css/jquery.nouislider.min.css" rel="stylesheet">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
	<script src="/WAPP/js/jquery.nouislider.all.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	

<script> events = ${it.get('events')}; </script>
<script> nickname = "${it.get('user').get('nickname')}"; </script>

<script src="/WAPP/js/events.js"></script>
<script src="/WAPP/js/logout.js"></script>
</head>

<body>
	<navbar></navbar>

	<div class="container" style="padding-top: 60px;">
		<div class="row" style="padding-top: 20px">
			<div class="col-xs-4">
				<div class="well">
					<form class="form-horizontal">
						<fieldset>
							<legend>Events</legend>

							<div class="form-group">
								<label for="name" class="col-lg-2 control-label">Name</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="name"
										placeholder="Event name" data-hint="Specify a name">
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="startloc" class="col-lg-2 control-label">Start
									Location</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="startloc"
										placeholder="Event starting from.."
										data-hint="Specify a location">
								</div>
								
							</div>
							<br>
							<div class="form-group">
								<label for="fromdate" class="col-lg-2 control-label">From Date</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="fromdate"
										placeholder="Date from.."
										data-hint="Specify a starting date">
								</div>
								
							</div>
							<div class="form-group">
								<label for="todate" class="col-lg-2 control-label">To Date</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="todate"
										placeholder="Date to.."
										data-hint="Specify an end date">
								</div>
								
							</div>

							<div class="form-group">
								<div class="col-lg-12 col-lg-offset-4">
									<button class="btn btn-primary btn-lg">Reset</button>
								</div>
							</div>
				</div>
				</fieldset>
				</form>
			</div>

			<div class="col-xs-8" style="padding-top: 20px;">
				<div class="list-group"></div>
			</div>
		</div>

		<a id="newbtn" class="btn shadow-level4 btn-primary  btn-fab mdi-content-add"
		style="position: fixed; z-index: 9999; bottom: 5%; right: 2%;"></a>

		<footer></footer>
</body>
</html>
