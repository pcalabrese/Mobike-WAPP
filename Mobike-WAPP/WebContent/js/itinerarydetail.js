$('document').ready(function(){
	$("navbar").load('../template/navbar.jsp', function(){
		$('user').append(nickname);
	});
	
	$('footer').load('/WAPP/template/footer.jsp');
	$.material.init();
	
	$('#dgpx').attr("href", rurl);
	
  	var mapOptions = {
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  	};
  	var map = new google.maps.Map(document.getElementById("map"),mapOptions);
  	
  	loaditinerarydetail();
  	
  	loadGPXFileIntoGoogleMap(map, "/SRV/routes/retrieve/"+route.id+"/gpx");
  	
  	var vvv = $('#col').width();
	var hhh = $('#well').height() + 100;
	$('#map').css({'width' : ( vvv+'px' ), 'height' : ( hhh+'px' )});
	
	var revlist = $('#rlist');
	for(i=0;i<reviews.length;i++){
		
		var revit = '<div class="list-group-item">' +
						'<div class="row-action-primary">'+
							'<i class="mdi-action-perm-identity mdi-material-green"></i>'+
						'</div>'+
						'<div class="row-content">'+
							'<div class="least-content">'
								+reviews[i].owner.nickname+
							'</div>'+
							'<h4 class="list-group-item-heading" id="ritemheading">';
		
		for(j=0;j<reviews[i].rate;j++){
			revit += '<span class="mdi-action-star-rate mdi-material-yellow"  style="font-size:38px"></span>';
		}
		
		revit += '</h4><p class="list-group-item-text">'+reviews[i].message+'</p></div></div><div class="list-group-separator"></div>';
		
		revlist.append(revit);
		
	}
	
	for(i=0;i<reviews.length;i++){
		if(reviews[i].owner.id == uid){
			$('#newreview').attr('disabled','""');
		}
	}
	
	$('#newreview').on('click', function(){
		$('#reviewModal').modal('show');
	});
	
	
	$('#rsubmit').on('click', function(){
		var rate = $('#rate').val();
		var message = $('#textreview').val();
		
		var json = {
				 "reviewPK": {
					 "usersId": uid,
					 "routesId": route.id,
				},
				 "rate": $('#rate').val(),
				 "message": $('#textreview').val()
		};
		
		$.ajax({
			type: 'POST',
			contentType: "application/json; charset=UTF-8",
			url: '/WAPP/ops/review/new',
			data: JSON.stringify(json),
			statusCode: {
				// da cambiareeeeee ma workaaaaaaaaaaa!!!
				200: function(){$('#mod-body').text("Review Succesfully inserted. Thank You!"); ajaxCallback();},
				401: function(){$('#mod-body').text("We're Sorry..you're not authorized, please login and try again. Thank You!"); ajaxCallback();},
				500: function(){$('#mod-body').text("We're Sorry..there was an error and a group of monkeys are working on it..please try again!"); ajaxCallback();},
				406: function(){$('#mod-body').text("Itinerary already reviewed...only one review for user is allowed! Thank you!"); ajaxCallback();},
			}
			
		});
		
	});
	
	


	
});

function ajaxCallback(){
	$('#rclose').hide();
	$('#rsubmit').hide();
	$('#rok').show();
	$('#rok').on('click', function(){
		$('#reviewModal').modal('hide');
	});
	
	window.location.reload();
};

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