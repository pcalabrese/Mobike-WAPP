/**
 * 
 */
(function() {
					var po = document.createElement('script');
					po.type = 'text/javascript';
					po.async = true;
					po.src = 'https://plus.google.com/js/client:plusone.js?onload=start';
					var s = document.getElementsByTagName('script')[0];
					s.parentNode.insertBefore(po, s);
				})();


function onSignInCallback(authResult) {
	if (authResult['code']) {
		$.ajax({
			type : 'POST',
			url : 'http://mobike.ddns.net/WAPP/connect',
			contentType : 'application/octet-stream; charset=utf-8',
			statusCode : {
				200 : function(data) {
					if(data != "na"){window.location = data;}
					else {
						var nickname = prompt('Welcome!, Please choose a nickname:');
						var bikemodel = prompt('and now insert your Bike Model:');
						var json = "{\"nickname\" :\""+ nickname+"\",\"bikemodel\" :\""+bikemodel+"\"}";
						$.ajax({
							type: 'POST',
							contentType: "application/json; charset=utf-8",
							url: 'http://mobike.ddns.net/WAPP/createuser',
							data: json,
							statusCode: {
								200: function(data1) { window.location = "/home"},
								401: function(data1) { alert ("Nickname già in uso!")},
								500: function(data1) {alert ("Nickname già in uso!")}
							}, 
							processData : false
						});
						
					}
					
				},
				401 : function() {
					alert("401");
				},
				400 : function() {
					alert("400");
				}
			},
			// success: function(data) { window.location=data},
			processData : false,
			data : authResult['code']
		});
	} else if (authResult['error']) {
		// alert("errore");
	}
}



