$(document).ready(function(){
	$('navbar').load("/WAPP/template/navbar.jsp", function(){
		$('user').append(nickname);
		 
	});
	
	
	
	$('footer').load("/WAPP/template/footer.jsp");
	
	$.material.init();
	$('#rimageurl').attr('href', '/WAPP/itineraries/'+rid);
	
	$('#rimageurl').append('<img class=img-responsive src="'+route.imgUrl+'&size=500x500">');
	
	printTable("#accepted", usersA, "success");
	printTable("#invited", usersI, "info");
	printTable("#refused", usersR, "danger");
	
	$('#pclose').on('click',function(){
		$('#partModal').modal('hide');
		window.location.reload();
	});
	
	if(ustate != 0 ){
		$('#participation').show();
	}
	else {
		$('#participation').hide();
	}
	
});

function printTable(selector, array, style){
	for(i=0;i<array.length;i++){
		$(selector).append('<tr><td>'+i+'</td><td>'+array[i].nickname+'</td></tr>')
	}
	console.log("style0: " + style);
	$.each($(selector).children(), function(){
		
		$(this).addClass(style);
	});
}

function accept(){
	  
	var json = "{\"id\":"+id+"}";
	  $.ajax({
		  type: 'POST',
		  url: '/WAPP/ops/events/participation/accept',
		  data: json,
		  contentType: 'application/json',
		  success: function(){
			  $('#partModal').modal('show');
			  $('#mod-body').text("You have accepted!, Have a Nice Ride!!");
			  
		  },
		  error: function(){$('#partModal').modal('show');
		  $('#mod-body').text("Sorry, we encountered an error, please try again!");},
		  failure: function(){alert("failure");}
		 
		});
}

function decline(){
	  var json = "{\"id\":"+id+"}";
	  $.ajax({
		  type: 'POST',
		  url: '/WAPP/ops/events/participation/decline',
		  data: json,
		  contentType: 'application/json',
		  success: function(){
			  $('#partModal').modal('show');
			  $('#mod-body').text("You have declined!  :( !!");
			  
		  },
		  error: function(){$('#partModal').modal('show');
		  $('#mod-body').text("Sorry, we encountered an error, please try again!");},
		  failure: function(){alert("failure");}
		 
		});
}

