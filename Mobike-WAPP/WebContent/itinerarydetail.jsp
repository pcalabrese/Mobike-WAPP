<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Itinerary Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
  
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <script src="/WAPP/js/loadgpx.js" type="text/javascript"></script>
  <script src="/WAPP/js/logout.js" type="text/javascript"></script>
  <script src="/WAPP/js/itinerarydetail.js"></script>
  <script type="text/javascript">route = ${it.get('route')};</script>
  <script type="text/javascript">reviews = ${it.get('route').get('reviewList')};</script>
  <script type="text/javascript">nickname = "${it.get('user').get('nickname')}";</script>
  <script type="text/javascript">uid = ${it.get('user').get('id')}</script>
  <script type="text/javascript">var url = "${it.get('route').get('url')}"; rurl = "/downloads/gpxs/" + url.substring(15) </script>
  
  
  
</head>

<body>
	
  <navbar></navbar>
  
  <div class="container-fluid" style="padding-top: 50px;">
    <div class="row">
     <div class="col-xs-3">
     	<div id="well" class="well">
     		<h1 class="text-center" style="font-style:italic;" id="ititle"></h1>
     			<div>
     				<p id="idescription"></p>
     				<p style="font-size:18px;">
     					<span style="font-size:30px" class="mdi-maps-directions"></span>
     					<span style="font-weight:500" id="ilength"></span>
     					<span style="font-size:30px" class="mdi-device-access-alarms"></span>
     					<span style="font-weight:500" id="iduration"></span>
     				</p>
     				<p>Type: 
     					<span style="font-weight:500;" id="itype">
     						<span></span>
     					</span>
     				</p>
     				<p>Creator:  
     					<span style="font-weight:500;" id="icreator">
     						<span></span>
     					</span>
     				</p>
     				<p>
     					<p id="irating"></p>
     					<span style="font-weight:500;" id="iratingnumber"></span>
     				
     				<p style="font-size:18px;"> Difficulty:
     					<span style="font-weight:500;" id="idifficulty"></span>
     				</p>
     				<p style="font-size:18px;"> Bends:
     					<span style="font-weight:500;" id="ibends"></span>
     				</p>
     				<div class="btn-group">
     					<a id="dgpx" class="btn btn-success">.GPX</a>
     					<a href="javascript:void(0)" class="btn btn-default" disabled="">.ITN</a>
     				</div>
     			</div>
     	</div>
     </div>
		<div class="col-xs-9" id="col" style="top:20px;">
			<div id="map" style="width: 400px; height: 200px;"></div>
			<br><br>
		</div>
    </div>
    
    <div class="row">
    </div>
    <div class="row">
    	<div class="well well-sm">
    		<strong>
    			Reviews:
    		</strong>
    	</div>
    	<div class="list-group" id="rlist">
	 	</div>
    </div>
    
    </div>
    
    
   <div id="reviewbutton" style="position: fixed; bottom:5%; right:5%">
  		<br/>
  		<br/>
  		<a  id="newreview" class="btn btn-primary btn-fab btn-raised mdi-content-create" style="position: relative;z-index:9999; left: 90%;"></a>
  </div>


<div id="reviewModal" class="modal fade">
 <div class="modal-dialog">
  <div class="modal-content">
   <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">Write a Review</h4>
   </div>
   <form>
   <fieldset>
   <div id="mod-body" class="modal-body">
        <div class="form-group">
        <br>
        <label for="Itinerary Type" class="col-lg-2 control-label">Rate</label>
        <div class="col-lg-10">
            <select class="form-control" id="rate">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
            <span class="help-block">Give a rate from 1 (bad) to 5 (wonderful).</span>
        </div>
    </div>
   
    <div class="form-group">
        <label for="textArea" class="col-lg-2 control-label">Review</label>
        <div class="col-lg-10">
            <textarea class="form-control" rows="3" id="textreview"></textarea>
            <span class="help-block">What do you think about this Itinerary?</span>
        </div>
    </div>
   </div>
   <div class="form-group">
   <div id="mod-footer" class="modal-footer">
    <button type="button" class="btn btn-default shadow-level2" data-dismiss="modal" id="rclose">Close</button>
    <button type="button" class="btn btn-primary shadow-level2" id="rsubmit">Submit</button>
    <button type="button" class="btn btn-primary shadow-level2" id="rok" style="display:none">OK</button>
    
    </div>
    </div>
    </fieldset>
    </form>
   </div>
  </div>
 </div>

 
 <footer></footer>
</body>
</html>
