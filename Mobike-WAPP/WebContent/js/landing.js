$('document').ready(function(){
	$("navbar").load('./template/navbar-landing.html');
	
	$('footer').load('/WAPP/template/footer.jsp');
	$.material.init();
	$.cookieBar();
	
	
});

(function() {
	var po = document.createElement('script');
	po.type = 'text/javascript';
	po.async = true;
	po.src = 'https://plus.google.com/js/client:plusone.js?';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(po, s);
})();

function login(){
		var myParams = {
		 	'clientid' : '648355147327-l29pdutihnfa25kdmo1ocjankqg4217c.apps.googleusercontent.com',
		 	'cookiepolicy' : 'single_host_origin',
		 	'callback' : 'onSignInCallback',
				'scope' : 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email'
		};
		gapi.auth.signIn(myParams);
};


function onSignInCallback(authResult) {
	if (authResult['code']) {
		$.ajax({
			type : 'POST',
			url : 'ops/connect',
			contentType : 'application/octet-stream; charset=utf-8',
			statusCode : {
				200 : function(data) {
					if(data != "na"){gapi.auth.signOut();window.location = data;}
					else {
						
						$("#regModal").modal('show');
						$("#regSubmit").on('click', function(){
							var nickname = $("#inputNickname").val();
							var bikemodel = $("#inputBikeModel").val(); 
							$("#regModal").modal('hide');
							
							var json = "{\"nickname\" :\""+ nickname+"\",\"bikemodel\" :\""+bikemodel+"\"}";
							
							$.ajax({
								type: 'POST',
								contentType: "application/json; charset=utf-8",
								url: '/WAPP/ops/createuser',
								data: json,
								statusCode: {
									200: function(data1) {gapi.auth.signOut(); window.location = "home"},
									409: function(data1) { 
										$("#regModal").modal('show');
										$(".modal-body").find("p").text("Nickname unavailable, please choose another one!");
									},
									500: function(data1) {alert ("Nickname già in uso!")}
								}, 
								processData : false
							});
							
						});
					}
					
				},
				400 : function() {
					$("errModal").modal('show');
					$("#errSubmit").on('click', function(){
						window.location = "/WAPP/landing";
					});
				}
			},
			
			processData : false,
			data : authResult['code']
		});
	} else if (authResult['error']) {
		$("errModal").modal('show');
		$("#errSubmit").on('click', function(){
			window.location = "./landing";
		});
	}
}

