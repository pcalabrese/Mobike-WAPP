$('document').ready(function(){
	$("navbar").load('/WAPP/template/navbar.jsp', function() {
		$('user').append(nickname);
		$('#mitineraries').addClass("active");
	});
	$('footer').load('/WAPP/template/footer.jsp');
	
	$.material.init();
});