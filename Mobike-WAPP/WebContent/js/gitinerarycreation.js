$(document).ready(function(){
	
	$("navbar").load('../template/navbar.jsp', function(){
		$('user').append(nickname);
	});
	
	$('footer').load('/WAPP/template/footer.jsp');
	$.material.init();
	
	$('.slider').noUiSlider({
		start: [5],
		decimal: 0,
		step: 1,
		range: {
			'min': 0,
			'max': 10
		}
	});
	
	$('#routeSubmit').on('click', function(){
		calcRoute();
	});
	
	$('#startModal').modal('show', function(){bindAutoComplete();});
	
	bindAutoComplete();
	
	initialize();
	
	
	
	
});


var map;

var gpXString = '';

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

function initialize() {
	
	rendererOptions = {
			  draggable: true
	};

	directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);;
	directionsService = new google.maps.DirectionsService();
	
	var mapOptions = {
		    zoom: 3,
		    center: new google.maps.LatLng(48.6908333333, 9.14055555556)
	};
	
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	directionsDisplay.setMap(map);
	directionsDisplay.setPanel(document.getElementById('narrative'));
	
	google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
	    computeItinerary(directionsDisplay.getDirections());
	  });
};

function calcRoute() {
	 var origin = $('#inputFrom').val();
	 var destination = $('#inputTo').val();

	  var request = {
	    origin: origin,
	    destination: destination,
	    waypoints:[],
	    travelMode: google.maps.TravelMode.DRIVING
	  };
	  
	  directionsService.route(request, function(response, status) {
	    if (status == google.maps.DirectionsStatus.OK) {
	      directionsDisplay.setDirections(response);
	    }
	    else {}
	  });
}

function computeItinerary(result){
	createGPX(result.routes);
	var tlength = 0;
	var myroute = result.route[0];
	
	 for (var i = 0; i < myroute.legs.length; i++) {
		    tlength += myroute.legs[i].distance.value;
	 }
	 tlength = tlength / 1000.0;
	 
	 //AGGIUNGERE VISUALIZZAZIONE DELLA LUNGHEZZA
}

function createGPX(routes) {

	gpxString = ' ';
	
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
						
		gpxString += "<wpt lat=\"" + routes[0].legs[0].start_location.A + "\" lon=\"" + routes[0].legs[0].start_location.F + "\"><name>START</name></wpt>\n";
		
		gpxString += "<wpt lat=\"" + routes[0].legs[0].end_location.A + "\" lon=\"" + routes[0].legs[0].end_location.F + "\"><name>END</name></wpt>\n";
		
		gpxString += "<rte>\n";
		
		gpxString += "<rtept lat=\"" + routes[0].legs[0].start_location.A + "\" lon=\"" + routes[0].legs[0].start_location.F + "\"></rtept>\n";
		
		for (i=0; i<routes[0].legs[0].via_waypoints.length;i++){
			gpxString += "<rtept lat=\"" + routes[0].legs[0].via_waypoints[i].A + "\" lon=\"" + routes[0].legs[0].via_waypoints[i].F + "\"></rtept>\n";
		}
		
		gpxString += "<rtept lat=\"" + routes[0].legs[0].end_location.A + "\" lon=\"" + routes[0].legs[0].end_location.F + "\"></rtept>\n";
		
		gpxString +="</rte>\n<trk>\n<trkseg>\n";
		
		gpxString += "<trkpt lat=\"" + routes[0].legs[0].start_location.A + "\" lon=\"" + routes[0].legs[0].start_location.F + "\"></trkpt>\n";
		
		for(i=0;i<routes[0].overview_path.length;i++){
		
			gpxString+="<trkpt lat=\"" + routes[0].overview_path[i].A + "\" lon=\"" + routes[0].overview_path[i].F + "\"></trkpt>\n";
		}
		
		gpxString += "<trkpt lat=\"" + routes[0].legs[0].end_location.A + "\" lon=\"" + routes[0].legs[0].end_location.F + "\"></trkpt>\n";
		
		gpxString += "</trkseg>\n</trk>\n</gpx>";
		
		
		
}