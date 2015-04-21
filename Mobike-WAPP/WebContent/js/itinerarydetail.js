$('document').ready(function(){
	$("navbar").load('../template/navbar.jsp', function(){
		$('user').append(nickname);
	});
	$.material.init();
	
  	var mapOptions = {
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  	};
  	var map = new google.maps.Map(document.getElementById("map"),mapOptions);
  	
  	loaditinerarydetail();
  	
  	loadGPXFileIntoGoogleMap(map, "/SRV/routes/retrieve/"+route.id+"/gpx");
  	
  	var vvv = $('#dafuq').width();
	var hhh = $('#well').height() + 100;
	$('#map').css({'width' : ( vvv+'px' ), 'height' : ( hhh+'px' )});
	
	$('#newreview').on('click', function(){
		$('#reviewModal').modal('show');
	});
	
	$('#rsubmit').on('click', function(){
		var rate = $('#rate').val();
		var message = $('#textreview').val();
		
		var json = {
			"ReviewPK": {
				"usersId": uid,
				"routesId": route.id,
			},
			"rate": rate,
			"message": message
		};
		
		$.ajax
		$('#reviewModal').modal('hide');
		
		
	});
  	
  	
});

function loadGPXFileIntoGoogleMap(map, filename) {
    $.ajax({url: filename,
        dataType: "xml",
        success: function(data) {
          var parser = new GPXParser(data, map);
          parser.setTrackColour("#ff0000");     // Set the track line colour
          parser.setTrackWidth(5);          // Set the track line width
          parser.setMinTrackPointDelta(0.001);      // Set the minimum distance between track points
          parser.centerAndZoom(data);
          parser.addTrackpointsToMap();         // Add the trackpoints
          parser.addWaypointsToMap();           // Add the waypoints
        }
    });
};

function loaditinerarydetail(){
	$('#ititle').text(route.name);
	$('#idescription').text(route.description);
	$('#ilength').text (route.length/1000 + " Km.");
	$('#iduration').text(secondsTimeSpanToHMS(route.duration));
	$('#itype').text(route.type);
	$('#icreator').text(route.owner.nickname);

	if(route.rating != 0){
		console.log(route.rating);
		for(i=0;i<route.rating;i++){
			$('#irating').append('<span class="mdi-action-star-rate mdi-material-yellow" style="font-size:38px"></span>');
		}
	}
	else {
		$('#irating').append('This itinerary wasn\'t rated by anyone');
	}
	
	$('#iratingnumber').text(route.ratingnumber);
	$('#idifficulty').text(route.difficulty);
	$('#ibends').text(route.bends);
	
}

function secondsTimeSpanToHMS(s) {
    var h = Math.floor(s/3600); //Get whole hours
    s -= h*3600;
    var m = Math.floor(s/60); //Get remaining minutes
    s -= m*60;
    return h+":"+(m < 10 ? '0'+m : m)+":"+(s < 10 ? '0'+s : s); //zero padding on minutes and seconds
}

$(window).resize( function( e ){
	var vvv = $('#dafuq').width();
	var hhh = $('#well').height() + 100;
	$('#map').css({'width' : ( vvv+'px' ), 'height' : ( hhh+'px' )});
});