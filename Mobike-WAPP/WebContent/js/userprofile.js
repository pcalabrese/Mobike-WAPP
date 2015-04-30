$(document).ready(function(){
	
	$('navbar').load('/WAPP/template/navbar.jsp', function(){
		$('user').append(nickname);
		$('#muser').addClass('active');
	});
	
	$('footer').load('/WAPP/template/footer.jsp');
	console.log(user.imgurl);
	$('#userimg').attr('src', user.imgurl);
	$('#uname').text(user.name).append(" ").append(user.surname);
	
	$('#uemail').text(user.email);
	$('#unickname').text(user.nickname);
	$('#ubikemodel').text(user.bikemodel);
	
	$('#displayroutes').on('click', function(){
		if($('#routetable').is(':visible')) {
			$('.col-xs-9').empty();
		}
		else {
			makeRouteTable(myroutes);
		} 
		
	});
	
	$('#displayevents').on('click', function() {
		if($('#eventtable').is(':visible')) {
			$('.col-xs-9').empty();
		}
		else {
			makeEventTable(myevents);
		}
	});
	
	$('#displayinvitations').on('click', function() {
		if($('#invitationstable').is(':visible')) {
			$('.col-xs-9').empty();
		}
		else {
			makeInvitationsTable(eventsinv);
		}
	});
	
	
});

function makeRouteTable(data){
	
	$('.col-xs-9').empty();
	$('.col-xs-9').append('<h3 style="text-align: -webkit-center;">My Routes</h3>');
	$('.col-xs-9').append('<table id="routetable" class="table table-striped table-hover"><thead><tr><th>id</th><th>Name</th><th>Creation Date</th></tr></thead><tbody></tbody>');
	for(i=0;i<data.length;i++){
		$("tbody").append("<tr><td> <a href=\"/WAPP/itineraries/"+data[i].id+"\">"+data[i].id+"</a></td><td>"+data[i].name+"</td><td>"+data[i].creationdate+"</td></tr>");
	}
};

function makeEventTable(data){
	$('.col-xs-9').empty();
	$('.col-xs-9').append('<h3 style="text-align: -webkit-center;">My Events</h3>');
	$('.col-xs-9').append('<table id="eventtable" class="table table-striped table-hover"><thead><tr><th>id</th><th>Name</th><th>Creation Date</th></tr></thead><tbody></tbody>');
	for(i=0;i<data.length;i++){
		$("tbody").append("<tr><td> <a href=\"/WAPP/events/"+data[i].id+"\">"+data[i].id+"</td><td>"+data[i].name+"</td><td>"+data[i].creationdate+"</td></a></tr>");
	}
};

function makeInvitationsTable(data){
	$('.col-xs-9').empty();
	$('.col-xs-9').append('<h3 style="text-align: -webkit-center;">My Invitations</h3>');
	$('.col-xs-9').append('<table id="invitationstable" class="table table-striped table-hover"><thead><tr><th>id</th><th>Name</th><th>Creation Date</th></tr></thead><tbody></tbody>');
	for(i=0;i<data.length;i++){
		$("tbody").append("<tr><td> <a href=\"/WAPP/events/"+data[i].id+"\">"+data[i].id+"</td><td>"+data[i].name+"</td><td>"+data[i].creationdate+"</td></a></tr>");
	}
};

