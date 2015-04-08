function logout(){
			
			$.ajax({
		        	type: "POST",
		        	url: "/WAPP/disconnect",
		        	data: "",
		        	contentType: "text/plain",
		        	dataType: "text",
		        	success: function(data){window.location=data},
		        	failure: function(errMsg) {alert("ciaone");},
		        	error: function(asd, text, wetr){alert("ciaone2");}
		  	});
    	}