<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MoBike - New Itinerary</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link id="theme-style" rel="stylesheet" href="/WAPP/css/stiledev.css">
<link href="/WAPP/css/material.min.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:500,400'
	rel='stylesheet' type='text/css'>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
<script src="/WAPP/js/jquery.nouislider.all.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&sensor=false&amp;libraries=places"></script>
<!--  <script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script> -->

<script src="/WAPP/js/logout.js" type="text/javascript"></script>
<script src="/WAPP/js/jquery.geocomplete.js"></script>
<script src="/WAPP/js/gitinerarycreation.js"></script>

<!-- <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>  -->
<!-- <script src="http://www.mapquestapi.com/sdk/js/v7.0.s/mqa.toolkit.js?key=Kmjtd%7Cluua2qu7n9%2C7a%3Do5-lzbgq"></script>  
  	<script src="http://open.mapquestapi.com/sdk/js/v7.0.s/mqa.toolkit.js?key=Fmjtd%7Cluu829ubng%2C80%3Do5-9w1gu4"></script> -->





<script type="text/javascript">  nickname = "${it.get('user').get('nickname')}";</script>
</head>

<body>
	<navbar></navbar>

	<div class="container-fluid" style="padding-top: 50px;">
		<div class="row"> 
			<div class="col-xs-12">
			
				<div id="map-canvas"></div>
			</div>
		</div>

	</div>

	<div id="floatbuttons" style="position: fixed; bottom: 5%; right: 5%">
	
		

		<a id="displaynarr"
			class="btn btn-success btn-fab shadow-level4 mdi-action-list"
			style="position: relative; z-index: 9999; left: 90%;"></a> <br /> <br />
		<a id="saveroute"
			class="btn btn-primary btn-fab shadow-level4 mdi-content-save"
			style="position: relative; z-index: 9999; left: 90%;"></a> <br /> <br />
		<a id="reset"
			class="btn btn-danger btn-fab shadow-level4 mdi-navigation-close"
			style="position: relative; z-index: 9999; left: 90%;"></a>
	</div>




	<footer></footer>


	<div class="modal fade" id="startModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">Nuovo Itinerario</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<fieldset>
							<legend>Inserisci partenza e destinazione</legend>
							<div id="inputloc">
								<div class="form-group">
									<label for="inputFrom" class="col-lg-2 control-label">Da:</label>
									<div class="col-lg-10">
										<input type="text" class="form-control dt" id="inputFrom"
											placeholder="partenza..">
									</div>
								</div>
								<div class="form-group">
									<label for="inputTo" class="col-lg-2 control-label">A:</label>
									<div class="col-lg-10">
										<input type="text" class="form-control dt" id="inputTo"
											placeholder="destinazione...">
									</div>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="routeSubmit" class="btn btn-primary">Go!</button>
				</div>
			</div>
		</div>
	</div>

	<div id="saveModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Save a new Itinerary</h4>
				</div>

				<div id="mod-body" class="modal-body">Do you really want to
					save this itinerary?</div>

				<div id="mod-footer" class="modal-footer">
					<button type="button" class="btn btn-default shadow-level2"
						data-dismiss="modal" id="sno">No</button>
					<button type="button" class="btn btn-primary shadow-level2"
						id="syes">Yes</button>
					<button type="button" class="btn btn-primary shadow-level2"
						id="sclose" style="display: none">Close</button>

				</div>

			</div>
		</div>
	</div>

	<div id="errModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Error!</h4>
				</div>

				<div id="mod-body" class="modal-body">

					Can not retrieve an itinerary with the selected points. Maybe some
					destinations are into a restricted area. <br /> <small>Reason:
						<cite id="reason"></cite>
					</small>

				</div>

				<div id="mod-footer" class="modal-footer">
					<button type="button" class="btn btn-primary shadow-level2"
						id="errclose"">Close</button>

				</div>

			</div>
		</div>
	</div>


</body>

</html>