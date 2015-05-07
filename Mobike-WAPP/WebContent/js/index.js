$('document').ready(function() {
					$("navbar").load('./template/navbar.jsp', function() {
						$('user').append(nickname);
					});

					$('footer').load('/WAPP/template/footer.jsp');
					setLang();
					$.material.init();
					console.log(routes.length);

					for (i = 0; i < json.routes.length; i++) {
						$('#routesRow').append("<a href=\"itineraries/"
												+ json.routes[i].id
												+ "\"><div class=\"col-xs-4\"> <div class=\"panel panel-"
												+ json.routes[i].type
												+ "\"> <div class=\"panel-heading\"> <h3 class=\"panel-title\"><b>"
												+ json.routes[i].name
												+ "</b></h3> <span class=\"glyphicon mdi-maps-directions-car\"></span>"
												+ json.routes[i].length
												/ 1000
												+ " Km.    <span class=\"glyphicon mdi-device-access-time\"></span> "
												+ secondsTimeSpanToHMS(json.routes[i].duration)
												+ "</br> "
												+ json.routes[i].owner.nickname
												+ " </div> <div class=\"panel-body\"> <img class=\"img-responsive\" src=\""
												+ json.routes[i].imgUrl
												+ "&size=300x300\"></div></div></div></a>");
					}

					for (i = 0; i < json.events.length; i++) {
						$('#eventsRow').append("<div class=\"col-xs-4\"> <div class=\"panel panel-event\"> <div class=\"panel-heading\"> <h3 class=\"panel-title\">"
												+ json.events[i].name
												+ "</h3> </div> <div class=\"panel-body\" style=\"background-color:#f5f5f5;\"> <p> "
												+ json.events[i].startdate
												+ "<p>"
												+ json.events[i].startlocation
												+ "</p><span class=\"label label-success\"><span class=\"mdi-action-done\"> 23</span></span><span class=\"label label-warning\"><span class=\"mdi-action-help\"> 4</span></span><span class=\"label label-danger\"><span class=\"mdi-content-clear\"> 12</span></span></div>   </div></div>");
					}

				});

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
function setLang() {
    var language = 'ita';
    $.ajax({
        url: '/WAPP/languages/index.xml',
        success: function(xml) {
            $(xml).find('translation_index').each(function(){
                var id = $(this).attr('id');
                var text = $(this).find(language).text();
                $("#" + id).html(text);
            });
            $(xml).find('translation_nav').each(function(){
                var id = $(this).attr('id');
                var text = $(this).find(language).text();
                $("#" + id).html(text);
            });
        }
    });
};


