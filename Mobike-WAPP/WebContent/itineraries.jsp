<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>MoBike, Enjoy all the routes!</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
		    	 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
	
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
			        TableRow += "<td><a href=\"itineraries/"+val+"\">"+val+"</a></td>";
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
        <li><a href="home">Home</a></li>
        <li class="active"><a href="itineraries">Itineraries</a></li>
        <li><a href="events">Events</a></li>
        <li><a href="aboutus">About Us</a></li>
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

<div id="map-canvas"></div>
<div class="container-fluid" id="main">
  <div class="row">
  	<div class="col-xs-8" id="left">
     <hr>
       <h2>Uploaded Itineraries</h2>
     <hr>     
     
      <p>
      
      
      <div class="datagrid" id="tableFromJson" align="center"></div></p>
      
      <hr>
 
      <p>
      <a href="https://sites.google.com/a/dis.uniroma1.it/google-technologies-for-cloud-and-web-development/" target="_ext" class="center-block btn btn-primary">Google Workshop for Cloud and Web Development</a>
      </p>
        
      <hr>      

    </div>
    <div class="col-xs-4"><!--map-canvas will be postioned here--></div>
  
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