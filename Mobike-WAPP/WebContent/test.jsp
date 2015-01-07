<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    	 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    	<!--  <script>

	$(document).ready(function(){
		  $("button").click(function(){
			  var urir = "http://localhost:8080/Mobike-WAPP/testjson";
		    $.getJSON(urir,function(result){
		      $.each(result, function(i, field){
		    	  $('#tabella').append("<tr>"+field+"</td>");
		    	  $.each(field, function(k, v){
		    		  $('#tabella').append("<td>"+ v +"</td>");
		    	  });
		       
		      });
		    });
		  });
		});
	</script>
	-->
	<script>
	
	$.makeTable = function (mydata) {
	    var table = $('<table border=1>');
	    var tblHeader = "<tr>";
	    for (var k in mydata[0]) tblHeader += "<th>" + k + "</th>";
	    tblHeader += "</tr>";
	    $(tblHeader).appendTo(table);
	    $.each(mydata, function (index, value) {
	        var TableRow = "<tr>";
	        $.each(value, function (key, val) {
	            TableRow += "<td>" + val + "</td>";
	        });
	        TableRow += "</tr>";
	        $(table).append(TableRow);
	    });
	    return ($(table));
	};
	
	
	
	$(document).ready(function(){
			  var urir = "http://localhost:8080/Mobike-WAPP/testjson";
		    $.getJSON(urir,function(result){
	var mydata = result;
	var table = $.makeTable(mydata);
	$(table).appendTo("#ciao");
		    });
		  
	});
		    
	</script>
	

</head>
<body>
<table id="tabella">
<tr>
<td> uno </td>
<td> due </td>
<td> tre </td>
<td> quattro </td> </tr>
<tr>
<td> 1 </td>
<td> 2 </td>
<td> 3 </td>
<td> 4 </td> </tr>


</table>

<button>Get JSON data</button>
<div id="ciao"></div>

</body>
</html>