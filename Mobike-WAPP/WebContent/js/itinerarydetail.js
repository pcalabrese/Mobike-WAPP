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
  	
  	loadGPXFileIntoGoogleMap(map, "http://localhost:8080/Mobike-SRV/routes/retrieve/"+json.id+"/gpx");
});