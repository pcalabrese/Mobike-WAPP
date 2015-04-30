<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Itineraries</title>
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
	
	
	<script> routes = ${it.get('routes')};</script>
	<script> nickname = "${it.get('user').get('nickname')}";</script>
	
	<script src="/WAPP/js/itineraries.js"></script>
  	<script src="/WAPP/js/logout.js"></script>
  	
</head>

<body>
	
  <navbar></navbar>
    
<div class="container" style="padding-top:60px;">
  <div class="row" style="padding-top: 20px">
    <div class="col-xs-4">
      <div class="well">
        <form class="form-horizontal">
          <fieldset>
            <legend>Search Itineraries</legend>
        <div class="form-group">
            <label for="name" class="col-lg-2 control-label">Name</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="name" placeholder="Route name..." 
                 data-hint="Specify the route or journey name">
			</div>
        </div>    
            <br>
        <div class="form-group">
            <label for="from" class="col-lg-2 control-label">From</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="from" placeholder="Start Location..." 
                 data-hint="Specify a location, an address or geographic coordinates">
			</div>
        </div>
        <br>
              
            <div class="form-group">
            <label for="to" class="col-lg-2 control-label">To</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="to" placeholder="Destination..." 
                 data-hint="Specify a location, an address or geographic coordinates">
			</div>
        </div>
            <br>
            <div class="form-group">
            <label for="minl" class="col-lg-2 control-label">Min Length</label>
            	<div class="col-lg-4">
            	<select class="form-control" id="minl">
                    <option>0</option>
                    <option>50</option>
                    <option>100</option>
                    <option>200</option>
                    <option>300</option>
                    <option>400</option>
                    <option>500</option>
                    <option>600</option>
                    <option>700</option>
                    <option>800</option>
                    <option>900</option>
                    <option>1000</option>
                </select>
                </div>
             <label for="maxL" class="col-lg-2 control-label">Max Length</label>
            	<div class="col-lg-4">
            	<select class="form-control" id="maxl">
                    <option>50</option>
                    <option>100</option>
                    <option>200</option>
                    <option>300</option>
                    <option>400</option>
                    <option>500</option>
                    <option>600</option>
                    <option>700</option>
                    <option>800</option>
                    <option>900</option>
                    <option>1000</option>
                    <option selected="selected" value="10000">>1000</option>
                </select>
				</div>
			</div>
			<div class="form-group">
			<label for="minD" class="col-lg-2 control-label">Min Diff.</label>
            	<div class="col-lg-4">
            	<select class="form-control" id="minD">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    
                </select>
                </div>
             <label for="maxD" class="col-lg-2 control-label">Max Diff.</label>
            	<div class="col-lg-4">
            	<select class="form-control" id="maxD">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option selected="selected">10</option>
                </select>
				</div>
				</div>
				
				<div class="form-group">
				<label for="minB" class="col-lg-2 control-label">Bends Min</label>
            	<div class="col-lg-4">
            	<select class="form-control" id="minB">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    
                </select>
                </div>
             <label for="maxB" class="col-lg-2 control-label">Bends Max.</label>
            	<div class="col-lg-4">
            	<select class="form-control" id="maxB">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option selected="selected">10</option>
                </select>
				</div>
				</div>
				<br>
					
				<div class="form-group">
           			 <div class="col-lg-12 col-lg-offset-4">
                		<!--  <button class="btn btn-default">Reset</button>-->
                		<button class="btn btn-primary btn-lg">Reset</button>
            		</div>
        		</div>
			</div>
            
              
              
          </fieldset>
        </form>
      </div>
 
    <div class="col-xs-8" style="padding-top:25px">
      <div class="list-group">

      </div>
    </div>
  </div> 
  
  <a id="newbtn" class="btn shadow-level4 btn-primary  btn-fab mdi-content-add"
          style="position: fixed;z-index:9999;
    bottom: 5%;
    right: 2%;"></a>
    
  <footer></footer>
    
 </div>   
    
  
  
</body>
</html>
