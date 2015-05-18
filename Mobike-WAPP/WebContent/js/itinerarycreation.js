$(document).ready(function(){
	
	bindAutoComplete();
	
	deferredObj = $.Deferred();
	destinations = [];
	
	
	$("navbar").load('../template/navbar.jsp', function(){
		$('user').append(nickname);
	});
	
	$('footer').load('/WAPP/template/footer.jsp');
	$.material.init();
	
	$('.slider').noUiSlider({
		start: [3],
		decimal: 0,
		step: 1,
		range: {
			'min': 0,
			'max': 10
		}
	});
	
	$('#inputName').on('keyup change', function(){
		$('legend').text($(this).val());
	});
	
	$('#adddest').on('click', function(){
		$('#inputTo').clone().appendTo($('#destli'));
		bindAutoComplete();
	});
	
	$('#destrem').on('click', function(){
		if($('#destli').children().length != 1){
		$('#destli').children().last().remove();}
		
	});
	
	$('#saveroute').on('click', function(){
		uploadRoute();
	});
	
	$('#reset').on('click', function(){
		window.location.reload();
	});
	
	$('#displaynarr').on('click', function(){
		
		if($('#narr').is(":visible")){
			$('#narr').hide();
		}
		else
			$('#narr').show();
		
	});
	
	$('#errclose').on('click', function(){
		$('#reason').empty();
		$('#errModal').modal('hide');
	})
	
	$(window).on('resize', function(){
		$('#map').children().first().css('width', parseInt($('.col-xs-9').css('width'))-40);
		$('#map').children().first().css('height', parseInt($('.col-xs-3').css('height'))-40);
		
	});
	
	$('#routeSubmit').on('click', function(){
		
		destinations = [];
		
		$('#inputloc input').each(function(){
			var fromP = (reqGeoCode($(this).val()));
			fromP.success(function(data){
				var lat = data.results[0].geometry.location.lat;
				var lng = data.results[0].geometry.location.lng;
				
				var ll = {latLng: {lat: lat, lng: lng}};
				
				destinations.push(ll);
			});
		});

		MQA.withModule('directions','largezoom', function() {

	    	map.addControl(
	    	      new MQA.LargeZoom(),
	    	      new MQA.MapCornerPlacement(MQA.MapCorner.TOP_LEFT, new MQA.Size(5,5))
	    	    );

	    	         /* Uses the MQA.TileMap.addRoute function (added to the TileMap with the directions module)
	    	          passing in an array of location objects as the only parameter. */
	    	          map.addRoute(destinations,

	    	           /* Pass an object with a property called draggable set to true to enable the draggable feature of the ribbon
	    	            and draggablepoi set to true to enable the draggable feature of the POIs. This parameter
	    	            is optional and is disabled by default.*/
	    	            {ribbonOptions:{draggable:true,draggablepoi:true}}, 
	    	            
	    	            createGPX
	    	          );
	    	        });
		
			
		});
});


function bindAutoComplete(){
        
		$(".dt").geocomplete()
        .bind("geocode:result", function(event, result){
          console.log("Result: " + result.formatted_address);
        })
        .bind("geocode:error", function(event, status){
          console.log("ERROR: " + status);
        })
        .bind("geocode:multiple", function(event, results){
          console.log("Multiple: " + results.length + " results found");
        });
        
};

MQA.EventUtil.observe(window, 'load', function() {

	 mapSizer();
	 
    //Create an object for options
    var options={
      elt:document.getElementById('map'),        //ID of element on the page where you want the map added
      zoom:4,                                   //initial zoom level of map
      latLng:{lat:41.8559637, lng:12.46673316},   //center of map in latitude/longitude
      mtype:'map'                                //map type (map)
    };

    //Construct an instance of MQA.TileMap with the options object
    window.map = new MQA.TileMap(options);
    
    
});


function mapSizer(){
	$('#map').css('width', parseInt($('.col-xs-9').css('width'))-40);
	$('#map').css('height', parseInt($('.col-xs-3').css('height'))-40);
};

function reqGeoCode(address){
	return $.ajax({
			type: 'GET',
			async: false,
			url: 'https://maps.googleapis.com/maps/api/geocode/json?address='+address,
			success: function(data){}
	
	});
};

function setDestinations(){

	$('#inputloc input').each(function(){
		var fromP = (reqGeoCode($(this).val()));
		fromP.success(function(data){
			var lat = data.results[0].geometry.location.lat;
			var lng = data.results[0].geometry.location.lng;
			
			var ll = {latLng: {lat: lat, lng: lng}};
			//console.log(ll);
			destinations.push(ll);
		});
	});

};
	 

function createGPX(data) {
	
	console.log(data);
	if(data.info.statuscode != 0){
		
		for(i=0; i<data.info.messages.length;i++){
			$('#reason').append(data.info.messages[i] + "<br/>");
			console.log(data.info.messages[i]);
			
		}
		
		$('#errModal').modal('show');
		
		
		
	}
	
	else {
		displayNarrative(data);
		   var gpxString='';
		        gpxString += "<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"no\"?>\n" +
		                "<gpx\n" +
		                "  xmlns=\"http://www.topografix.com/GPX/1/0\"\n" +
		                "  version=\"1.0\" creator=\"MoBike Web App\"\n" +
		                "  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n" +
		                "  xsi:schemaLocation=\"http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd\">";
		        gpxString += "<metadata>\n"+
		                "<author>\n"+
		                "<email " +
		                "id=\""+'mobiketeam'+"\""+
		                " domain=\""+'gmail.com'+"\"/>\n"+
		                "</author>\n"+
		                "</metadata>\n";
	               
	    if (data.route){
	        var shapepoints = data.route.shape.shapePoints,
	            legs = data.route.legs,
	            i=0,
	            j=0,
	            k=0,
	            l=shapepoints.length,
	            lat,lng;
	       
	        lat=''+shapepoints[k+0].toFixed(6);
	        lng=''+shapepoints[k+1].toFixed(6);
	        gpxString += "<wpt lat=\"" + lat + "\" lon=\"" + lng + "\"></wpt>\n";
	       
	        for (i=0; i < legs.length; i++) {
	            for (j = 0; j < legs[i].maneuvers.length; j++) {
	                maneuver = legs[i].maneuvers[j];
	                /*k = maneuver.index;
	                if( k+11<l){
	                    lat=''+shapepoints[k+10].toFixed(6);
	                    lng=''+shapepoints[k+11].toFixed(6);
	                   
	                }
	                else{
	                    lat=''+shapepoints[k].toFixed(6);
	                    lng=''+shapepoints[k+1].toFixed(6);
	                } */
	                lat = ''+maneuver.startPoint.lat;
	                lng = ''+maneuver.startPoint.lng;
	                j+=1;
	                gpxString += "<wpt lat=\"" + lat + "\" lon=\"" + lng + "\"></wpt>\n";
	            }
	        }
	       
	        lat=shapepoints[l-2].toFixed(6);
	        lng=shapepoints[l-1].toFixed(6);
	        gpxString += "<wpt lat=\"" + lat + "\" lon=\"" + lng + "\"></wpt>\n<trk>\n<trkseg>\n";
	       
	       
	        for (i=0;i<shapepoints.length-1;i++) {
	            lat=''+shapepoints[i].toFixed(6);
	            lng=''+shapepoints[i+1].toFixed(6);
	            gpxString += "<trkpt lat=\"" + lat + "\" lon=\"" + lng + "\"></trkpt>\n";
	            i+=1;
	        }
	       
	        gpxString += "</trkseg>\n</trk>\n</gpx>";
	        
	        dis = data.route.distance * 1.6 * 1000;
	        time= data.route.time;
	        
	        $('time').text(secondsTimeSpanToHMS(time) + " ");
	        $('length').text(dis /1000 + " Km.");
	        
	        $('#time').val(secondsTimeSpanToHMS(time) + " ");
	        $('#length').val(dis /1000 + " Km.");
	        
	        gpxS = gpxString;
	    }
    
	}
};

function secondsTimeSpanToHMS(s) {
    var h = Math.floor(s/3600); //Get whole hours
    s -= h*3600;
    var m = Math.floor(s/60); //Get remaining minutes
    s -= m*60;
    return h+":"+(m < 10 ? '0'+m : m)+":"+(s < 10 ? '0'+s : s); //zero padding on minutes and seconds
}

function uploadRoute(){
	
	$('#saveModal').modal('show');
	
	$('#sno').on('click', function(){
		$('#saveModal').modal('hide');
	});
	
	$('#syes').on('click', function(){
		
		
		
		var json = {
				name: $('#inputName').val(),
				description: $('#inputDesc').val(),
				startlocation: $('#inputFrom').val(),
				endlocation: $('#inputTo').last().val(),
				gpxString: gpxS,
				duration : time,
				length: dis,
				type: $('#inputType').val(),
				bends: parseInt($('#inputBends').val()),
				difficulty: parseInt($('#inputDiff').val()),
				
		};
		
		$.ajax({
			type: "POST", 
			processData: false, 
			contentType: 'application/json',
			url: "/WAPP/ops/itineraries/insertnew",
			data: JSON.stringify(json),
			success: function (data) { 
				$('#mod-body').text("Thank you! your itinerary has been succesfully saved!");
				onUploadCallBack();
				window.location.assign("/WAPP/itineraries/" + data);
				
			},
			error: function (data) {
				$('#mod-body').text("We're sorry an error occured, please Try again later!"); onUploadCallBack();
			},
			failure: function (data) {
				$('#mod-body').text("We're sorry an error occured, please Try again later!"); onUploadCallBack();
			} 
		});
		
		
		
		
	});
	
	
	
}

function onUploadCallBack(){
	$('#sno').hide();
	$('#syes').hide();
	$('#sclose').show();
	$('#sclose').on('click', function(){$('#saveModal').modal('hide');})
	
};

function displayNarrative(data){
    if(data.route){
      var legs = data.route.legs, html = '', i = 0, j = 0, trek, maneuver;
      html += '<table class="table table-striped table-hover"><tbody>';

      for (; i < legs.length; i++) {
        for (j = 0; j < legs[i].maneuvers.length; j++) {
          maneuver = legs[i].maneuvers[j];
          html += '<tr>';
          html += '<td>';

          if (maneuver.iconUrl) {
            html += '<img src="' + maneuver.iconUrl + '">  ';
          }

          for (k = 0; k < maneuver.signs.length; k++) {
            var sign = maneuver.signs[k];
            if (sign && sign.url) {
              html += '<img src="' + sign.url + '">  ';
            }
          }
          html += '</td><td>' + maneuver.narrative + '</td>';
          html += '</tr>';
        }
      }
      html += '</tbody></table>';
      document.getElementById('narrative').innerHTML = html;
    }
  }

function renderNarrative(response) {
    var legs = response.route.legs;
    var html = '';
    var i = 0;
    var j = 0;
    var trek;
    var maneuver;
    
    html += '<table class="table table-striped table-hover"><tbody>'
    
    for (; i < legs.length; i++) {
        for (j = 0; j < legs[i].maneuvers.length; j++) {
            maneuver = legs[i].maneuvers[j];
            
            html += '<tr>';
            html += '<td>&nbsp;';
            if (maneuver.iconUrl) {
                html += '<img src="' + maneuver.iconUrl + '">  '; 
            } 
            for (k = 0; k < maneuver.signs.length; k++) {
                var sign = maneuver.signs[k];
                if (sign && sign.url) {
                    html += '<img src="' + sign.url + '">  '; 
                }
            }
            
            html += '</td>'
            html += '<td>' + maneuver.narrative + '</td>'
            html += '<td>'
            if (maneuver.mapUrl) {
                html += '<img src="' + maneuver.mapUrl + '">';
            } else {
                html += '&nbsp;'
            }
            html += '</td>'
            html += '</tr>';
        }
    }
    
    html += '</tbody></table>';
    
    document.getElementById('narrative').style.display = "";
    document.getElementById('narrative').innerHTML = html;
}
	 
	
	
	
	


