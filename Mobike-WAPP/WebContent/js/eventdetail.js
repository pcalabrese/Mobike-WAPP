$(document).ready(function(){
	$('navbar').load("/WAPP/template/navbar.jsp", function(){
		$('user').append(nickname);
		 
	});
	
	
	
	$('footer').load("/WAPP/template/footer.jsp");
	
	$.material.init();
	$('#rimageurl').attr('href', '/WAPP/itineraries/'+rid);
	
	$('#rimage').attr('src', rimgurl+'&size=500x500');
	
	printTable("#accepted", usersA, "success");
	printTable("#invited", usersI, "info");
	printTable("#refused", usersR, "danger");
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
			  alert ("You're in!");
			  window.location.reload();
		  },
		  error: function(){alert("error");},
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
			  alert ("You're out !");
			  window.location.reload();
		  },
		  error: function(){alert("error");},
		  failure: function(){alert("failure");}
		 
		});
}