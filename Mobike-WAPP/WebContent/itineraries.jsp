<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Itineraries</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link id="theme-style" rel="stylesheet" href="./css/stiledev.css">
	<link href="./css/material.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css"	rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
	<link href="./css/jquery.nouislider.pips.min.css" rel="stylesheet">
  	<link href="./css/jquery.nouislider.min.css" rel="stylesheet">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
	<script src="./js/jquery.nouislider.all.js"></script>
	
	<script>var json = ${it};</script>
	<script> nickname = "${it.get('user').get('nickname')}";</script>
	
	<script src="./js/itineraries.js"></script>
  	<script src="./js/logout.js"></script>
  	
  	
   
  
</head>

<body>
	
	
	
	
  <navbar></navbar>
  
  <a class="btn shadow-level4 btn-primary  btn-fab mdi-content-add"
          style="position: fixed;z-index:9999;
    bottom: 5%;
    right: 2%;" href="/itineraries/new"></a>
          
    
    
<div class="container" style="padding-top:60px;">
  <div class="row">
    <div class="col-xs-4">
      <div class="well">
        <form class="form-horizontal">
          <fieldset>
            <legend>Search Itineraries</legend>
            
        <div class="form-group">
            <label for="from" class="col-lg-2 control-label">From</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="to" placeholder="Start Location..." 
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
                    <option>10</option>
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
                    <option>10</option>
                </select>
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
    
    
    <div class="col-xs-8" style="padding-top:25px">
      <div class="list-group">
        
		<script>
		for(i=0; i<json.routes.length; i++){
		document.write("<div class=\"list-group-item\"><div class=\"row-picture\"><img class=\"img-responsive img-"+json.routes[i].type+"\" src=\"" + json.routes[i].imgUrl+"&size=150x150"+   "\" alt=\"icon\"></div><div class=\"row-content\"><div class=\"least-content\">"+json.routes[i].owner.nickname+"</div><h4 class=\"list-group-item-heading\"><a href=\"itineraries/" + json.routes[i].id + "\">" + json.routes[i].name + "</a>"+"</h4><p class=\"list-group-item-text\"><span class=\"mdi-maps-directions-car\" style=\"font-size:18px;\"></span>"+json.routes[i].length/1000+"Km.<span class=\"mdi-action-alarm\" style=\"font-size:18px;\"></span>"+json.routes[i].duration/60 + "min.</p></div></div><div class=\"list-group-separator\"></div>");}
		
		</script>
        
      </div>
    </div>
  </div>
  
  
  
  
  
  
  
  <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="container text-center">
            <small class="copyright">Developed for the<a href="https://sites.google.com/a/dis.uniroma1.it/google-technologies-for-cloud-and-web-development/" target="_blank"> Google Technologies for Cloud and Web Developement </a> Workshop</small>
        </div><!--//container-->
    </footer><!--//footer-->
    
 </div>   
    
  
  
</body>
</html>
