/**
 * 
 */

// $('#subbo').on('click', printFilteredRoutes);

function printFilteredRoutes() {
	$('.list-group').empty();
	for (i = 0; i < routes.length; i++) {
		if (	   (parseInt($('#minl').val()) <= routes[i].length / 1000)
				&& (parseInt($('#maxl').val()) >= routes[i].length / 1000)
				&& (parseInt($('#minD').val()) <= routes[i].difficulty)
				&& (parseInt($('#maxD').val()) >= routes[i].difficulty)
				&& (parseInt($('#minB').val()) <= routes[i].bends)
				&& (parseInt($('#maxB').val()) >= routes[i].bends)
				&& (routes[i].name.toLowerCase().indexOf($('#name').val().toLowerCase()) != -1)
				&& (routes[i].startlocation.toLowerCase().indexOf($('#from').val().toLowerCase()) != -1)
				&& (routes[i].endlocation.toLowerCase().indexOf($('#to').val().toLowerCase()) != -1))
			$('.list-group').append(
							"<div class=\"list-group-item\"><div class=\"row-picture\"><img class=\"img-responsive img-"
									+ routes[i].type
									+ "\" src=\""
									+ routes[i].imgUrl
									+ "&size=150x150"
									+ "\" alt=\"icon\"></div><div class=\"row-content\"><div class=\"least-content\">"
									+ routes[i].owner.nickname
									+ "</div><h4 class=\"list-group-item-heading\"><a href=\"itineraries/"
									+ routes[i].id
									+ "\">"
									+ routes[i].name
									+ "</a>"
									+ "</h4><p class=\"list-group-item-text\"><span class=\"mdi-maps-directions-car\" style=\"font-size:18px;\"></span>"
									+ routes[i].length
									/ 1000
									+ "Km. <span class=\"mdi-action-alarm\" style=\"font-size:18px;\"></span>"
									+ secondsTimeSpanToHMS(routes[i].duration)
									+ " Diff: "
									+ routes[i].difficulty
									+ " Bends: "
									+ routes[i].bends
									+ "</p></div></div><div class=\"list-group-separator\"></div>");
	}
};

function secondsTimeSpanToHMS(s) {
	var h = Math.floor(s / 3600); // Get whole hours
	s -= h * 3600;
	var m = Math.floor(s / 60); // Get remaining minutes
	s -= m * 60;
	return h + ":" + (m < 10 ? '0' + m : m) + ":" + (s < 10 ? '0' + s : s); // zero
	// padding
	// on
	// minutes
	// and
	// seconds
}