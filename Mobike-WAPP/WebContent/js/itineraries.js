$('document').ready(function(){
	$("navbar").load('./template/navbar.jsp', function(){
		$('user').append(nickname);
		$('#mitineraries').addClass("active");
	});
	
	$.material.init();
});