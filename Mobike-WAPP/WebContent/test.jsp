<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		  $("button").click(function(){
			  var urir = "http://localhost:8080/Mobike-SRV/routes/retrieveall"
		    $.getJSON(urir,function(result){
		      $.each(result, function(i, field){
		    	  $.each(field, function(k, v){
		    		  $("div").append(v + " ");
		    	  });
		       
		      });
		    });
		  });
		});
</script>
</head>
<body>

<button>Get JSON data</button>
<div></div>

</body>
</html>