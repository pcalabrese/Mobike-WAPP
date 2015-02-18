<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Create Event...</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="../css/styles.css" rel="stylesheet">
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
        <script src="../js/loadgpx.js" type="text/javascript"></script>
       	<script>
       		function apri(url) {
       			newin = window.open(url,'Route Preview', 'scrollbars=yes,resizable=yes,width=600,height=600,toolbar=no');
       		}
       	
       	</script>
       	<script>
       	var id = document.getElementById("id");
	
		$.makeTable = function (mydata) {
		    var table = $('<table>');
	    	var tblHeader = "<tr>";
	    	for (var k in mydata[0]) if(k!="url"){ tblHeader += "<th>" + k + "</th>";}
	    	tblHeader += "</tr>";
	    	$(tblHeader).appendTo(table);
	    	$.each(mydata, function (index, value) {
		        var TableRow = "<tr>";
	        	$.each(value, function (key, val) {
		        	if(key=="id"){
			        	TableRow += "<td><input type=\"radio\" name=\"routeId\" value=\""+val+"\"><a href=\"javascript:apri(\'http://mobike.ddns.net/WAPP/itineraries/"+val+"\');\">  "+val+"</a></td>";
			    	}
		        	else {
			        	if(key!="url"){
	        			TableRow += "<td>" + val + "</td>";}
	        		}
		        	
	        	});
	        	TableRow += "</tr>";
	        	$(table).append(TableRow);
	    	});
	    	return ($(table));
		};
		
		
		
		$(document).ready(function(){
			  	var urir = "http://mobike.ddns.net/WAPP/getitineraries";
		    	$.getJSON(urir,function(result){
		   		var mydata = result;
				var table = $.makeTable(mydata);
		$(table).appendTo("#tableFromJson");
		    	});
			  
		});
		    
	</script>
       
	</head>
	<body>
	<div id="ciao"></div>
<!-- begin template -->
<div class="navbar navbar-custom navbar-fixed-top">
 <div class="navbar-header"><a class="navbar-brand" href="#">MoBike</a>
        <span class="icon-bar">
      <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      </a>
     </span>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="/WAPP/home">Home</a></li>
        <li><a href="/WAPP/itineraries">Itineraries</a></li>
        <li class="active"><a href="/WAPP/events">Events</a></li>
        <li><a href="/WAPP/aboutus">About Us</a></li>
        <li>&nbsp;</li>
      </ul>
      <form class="navbar-form">
        <div class="form-group" style="display:inline;">
          <div class="input-group">
            <div class="input-group-btn">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Category 1</a></li>
                <li><a href="#">Category 2</a></li>
                <li><a href="#">Category 3</a></li>
                <li><a href="#">Category 4</a></li>
                <li><a href="#">Category 5</a></li> 
              </ul>
            </div>
            
            <input type="text" class="form-control" placeholder="Search for routes (under development)">
            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span> </span>
            <input type="button" class="myButton" value="Logout" onclick="logout()" style="vertical-align: middle; text-align:right; float:right;"/>
            <div class="nameCnt">Logged in as: ${user.name}</div>
          </div>
        </div>
      </form>
    </div>
</div>
<div class="container-fluid" id="main">
  <div class="row">
  	<div class="col-xs-8" id="left">
    
      <h2>New Event:</h2>
       
      <hr>
      
   	<div class="panel panel-default">
        <div class="panel-heading"><b>Insert Event Details:</b></div>
        <hr>
        <hr>
        
        <form action="insertnew" method="POST">
        	<div class="cnt">
        	<b>Name:</b><input type="text" name="name"><br>
        	<b>Description:</b><input type="text" name="description"><br>
        	<b>Start Date:</b><input type="date" name="date"><br> 
        	<b>Start Time:</b><input type="time" name="time"><br>
        	<b>Start Location:</b><input type="text" name="startLocation"><br>   
        	<br>  
        	<br>
        	<b>Choose an Itinerary:</b>
        	</div>
        	
        	<div class="datagrid" id="tableFromJson" align="center"></div>
        	
        	
        	<input class="myButton" type="submit" value="Submit!">
        </form>
        
        
      </div>
      <p></p>
      <p>&nbsp;</p>
      
      <hr>
      
      <p>
     
      </p>

        
      <p>
      <a href="https://sites.google.com/a/dis.uniroma1.it/google-technologies-for-cloud-and-web-development/" target="_ext" class="center-block btn btn-primary">Google Workshop for Cloud and Web Development</a>
      </p>
        
      <hr>      

    </div>
    
  </div>
</div>
	<script type="text/javascript">
		function logout(){
			
			$.ajax({
		        	type: "GET",
		        	url: "/WAPP/logout",
		        	data: "",
		        	contentType: "text/plain",
		        	dataType: "text",
		        	success: function(data){window.location=data},
		        	failure: function(errMsg) {alert(errMsg);},
		        	error: function(asd, text, wetr){alert(text);}
		  	});
    	}
	</script>
	</body>
</html>