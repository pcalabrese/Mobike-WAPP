<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MoBike - Itinerary Details</title>
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
	<script src="/WAPP/js/jquery.nouislider.all.js"></script>
  	<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
  	<!-- <script src="http://www.mapquestapi.com/sdk/js/v7.0.s/mqa.toolkit.js?key=Kmjtd%7Cluua2qu7n9%2C7a%3Do5-lzbgq"></script>  -->
  	<script src="http://open.mapquestapi.com/sdk/js/v7.0.s/mqa.toolkit.js?key=Fmjtd%7Cluu829ubng%2C80%3Do5-9w1gu4"></script>
  
  <script src="/WAPP/js/logout.js" type="text/javascript"></script>
  
  <script src="/WAPP/js/jquery.geocomplete.js"></script>
  <script src="/WAPP/js/itinerarycreation.js"></script>
  
  <script type="text/javascript">  nickname = "${it.get('user').get('nickname')}";</script>
  
  
  
</head>
<body>
  <navbar></navbar>
  
  <div class="container-fluid" style="padding-top: 50px;">

  	<div class="row">
  		<div class="col-xs-3">
  			<div id="well" class="well">
  				<form class="form-horizontal">
    				<fieldset>
        				<legend>New Itinerary</legend>
        				<div id="inputloc">
	        				<div class="form-group">
	        					<div class="col-lg-12 col-lg-offset-5">
	            				<label for="inputFrom" class="control-label">From</label>
	            				</div>
	            				<div class="col-lg-12">
	                				<input class="form-control dt "  type="text" id="inputFrom">
	            				</div>
	        				</div>
	        				
	        				<br>	
	        				<div class="form-group">
	        					<div class="col-lg-12 col-lg-offset-3">
	            				<label for="inputTo" class="control-label" >Destinations <span class="mdi-content-add-circle-outline" style="font-size:22px" id="adddest"></span><span class="mdi-content-remove-circle-outline" style="font-size:22px" id="destrem"></span></label>
	            				</div>
	            				<div class="col-lg-12" id = "destli">
	                				<input class="form-control dt" id="inputTo"  type="text">
	            				</div>
	            				
	        				</div>
        				</div>
        				<br>
        				<div class="form-group">
            				<label for="inputName" class="col-lg-3 control-label">Name</label>
            				<div class="col-lg-9">
                				<input class="form-control" id="inputName" placeholder="Itinerary Name" type="text">
            				</div>
        				</div>
        				<br>
        				<div class="form-group">
            				<label for="inputDesc" class="col-lg-3 control-label">Descr.</label>
            				<div class="col-lg-9">
                				<input class="form-control" id="inputDesc" placeholder="Itinerary Description" type="text">
            				</div>
        				</div>
        				<br>
        				<div class="form-group">
            				<label for="inputDiff" class="col-lg-3 control-label">Difficulty</label>
            				<div class="col-lg-9">
                				<div class="slider shor" id="inputDiff"></div>
            				</div>
        				</div>
        				
        				<div class="form-group">
            				<label for="inputBends" class="col-lg-3 control-label">Bends</label>
            				<div class="col-lg-9">
                				<div class="slider shor slider-success" id="inputBends"></div>
            				</div>
        				</div>
        				<div class="form-group">
            				<label for="length" class="col-lg-3" style="text-align: -webkit-right;">Length:</label>
            				<div class="col-lg-9">
                				<input class="form-control" id="length" placeholder="0 Km." type="text" disabled="">
            				</div>
        				</div>
        				
        				<div class="form-group">
            				<label for="time" class="col-lg-3" style="text-align: -webkit-right;">Time:</label>
            				<div class="col-lg-9">
                				<input class="form-control" id="time" placeholder="00:00" type="text" disabled="">
            				</div>
        				</div>
        				
        				<div class="form-group">
            				<label for="inputType" class="col-lg-3 control-label">Type</label>
            				<div class="col-lg-9">
                				<select class="form-control" id="inputType">
                					<option>Mountain</option>
                            		<option>Hill</option>
                            		<option>Plain</option>
                            		<option>Coast</option>
                            		<option>Mixed</option>
                            	</select>
            				</div>
        				</div>
        				<br>
        				<div class="form-group">
            				<div class="col-lg-9 col-lg-offset-3">
                				<button class="btn btn-default">Cancel</button>
                				<button type="button" class="btn btn-primary shadow-level4" id="routeSubmit">GET</button>
            				</div>
        				</div>
        			</fieldset>
        		</form>
        	</div>
        </div>
        <div class="col-xs-9" style="top:20px">
        	<div id='map' style='width:1920px; height:1080px;'></div>
        </div>
        
        
        
        
       </div>
       <div class= "row">
       	<div class="col-lg-6">
       	<div class= "well" id="narr" style="display:none">
       	<legend>Route Narrative</legend>
       	<div id="narrative" ></div>
       	</div>
       	</div>
       </div>
      </div>
      
        			
        				
        				
        				
        				
        				
    <div id="floatbuttons" style="position: fixed; bottom:5%; right:5%">
  
  <a  id="displaynarr" class="btn btn-success btn-fab shadow-level4 mdi-action-list" style="position: relative;z-index:9999; left: 90%;"></a>
  
  <br/>
  <br/>
  <a  id="saveroute" class="btn btn-primary btn-fab shadow-level4 mdi-content-save" style="position: relative;z-index:9999; left: 90%;"></a>
  <br/>
  <br/>  
  <a  id="reset" class="btn btn-danger btn-fab shadow-level4 mdi-navigation-close" style="position: relative;z-index:9999; left: 90%;"></a>
  </div>
  
  
  <div id="saveModal" class="modal fade">
 <div class="modal-dialog">
  <div class="modal-content">
   <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">Save a new Itinerary</h4>
   </div>
   
   <div id="mod-body" class="modal-body">
        
   Do you really want to save this itinerary?
    
   </div>
   
   <div id="mod-footer" class="modal-footer">
    <button type="button" class="btn btn-default shadow-level2" data-dismiss="modal" id="sno">No</button>
    <button type="button" class="btn btn-primary shadow-level2" id="syes">Yes</button>
    <button type="button" class="btn btn-primary shadow-level2" id="sclose" style="display:none">Close</button>
    
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
        
   Can not retrieve an itinerary with the selected points. Maybe some destinations are into a restricted area. <br/>  
   <small>Reason: <cite id="reason"></cite></small>
    
   </div>
   
   <div id="mod-footer" class="modal-footer">
    <button type="button" class="btn btn-primary shadow-level2" id="errclose"">Close</button>
    
    </div>
    
   </div>
  </div>
 </div>
 
 <footer></footer>   				
        				

</body>
</html>
