<!DOCTYPE html>
<html lang="en">
<head>
<title>MoBike - Create Event</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link id="theme-style" rel="stylesheet" href="/WAPP/css/stiledev.css">
<link href="/WAPP/css/material.min.css" rel="stylesheet">
<link href="/WAPP/css/jquery-ui.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css"	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:500,400'rel='stylesheet' type='text/css'>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script src="/WAPP/js/logout.js"></script>
<script src="/WAPP/js/eventcreation.js"></script>

<script> nickname = "${it.get('user').get('nickname')}";</script>

</head>

<body>
	<navbar></navbar>

	<div class="container" style="padding-top: 60px;">
		<div class="row" style="padding-top: 20px">
			<form id="myForm" class="form-horizontal">
				<fieldset>
					<div class="col-xs-5">
						<div class="well">

							<legend>New Event</legend>
							<div class="form-group">
								<label for="name" class="col-lg-2 control-label">Name</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="name" placeholder="Event name..." 
									 data-hint="Specify the event name">
								</div>
							</div>
							<div class="form-group">
								<label for="description" class="col-lg-2 control-label">Desc</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="desc" placeholder="Event description..."
									data-hint="Insert an event description">
								</div>
							</div>
							<div class="form-group">
								<label for="date" class="col-lg-2 control-label">Date</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="eventdate"
										placeholder="Date..."
										data-hint="Specify the event date">
								</div>
							</div>
							<div class="form-group">
								<label for="time" class="col-lg-2 control-label">Time</label>
								<div class="col-lg-10">
									<input type="time" class="form-control" id="time"
										placeholder="Time..."
										data-hint="Specify the event time">
								</div>
							</div>
							<div class="form-group">
								<label for="startlocation" class="col-lg-2 control-label">Where</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="startlocation"
										placeholder="Start location..."
										data-hint="Specify the event start location">
								</div>
							</div>
							<div class="form-group">
								<label for="invites" class="col-lg-2 control-label">Who</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="invites"
										 placeholder="nickname separated by comma">
								</div>
							</div>
							<br>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-4">
									<button id="resetbtn" class="btn btn-primary btn-lg shadow-level4">Reset</button>
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
								<tbody></tbody>
							</div>
						</table>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<!--coloumn-->
	</div>
	
	<a id="uploadbtn" class="btn shadow-level4 btn-primary  btn-fab mdi-content-save"
		style="position: fixed; z-index: 9999; bottom: 5%; right: 2%;"> </a>
		
		<div id="saveModal" class="modal fade">
 <div class="modal-dialog">
  <div class="modal-content">
   <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">Save a new Event</h4>
   </div>
   
   <div id="mod-body" class="modal-body">
        
   Do you really want to save this event?
    
   </div>
   
   <div id="mod-footer" class="modal-footer">
    <button type="button" class="btn btn-default shadow-level2" data-dismiss="modal" id="sno">No</button>
    <button type="button" class="btn btn-primary shadow-level2" id="syes">Yes</button>
    <button type="button" class="btn btn-primary shadow-level2" id="sclose" style="display:none">Close</button>
    
    </div>
    
   </div>
  </div>
 </div> 
	<footer></footer>
</body>


</html>

