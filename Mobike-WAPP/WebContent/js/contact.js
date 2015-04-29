$('document').ready(function(){
	if(nickname == ""){
		$("navbar").load('./template/navbar-landing.html');
	}
	else {
		$("navbar").load('./template/navbar.jsp', function(){
			$('user').append(nickname);	
		});	
	}
	
	$('footer').load('/WAPP/template/footer.jsp');
	
	$.material.init();
	
});