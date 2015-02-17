<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
      <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
      <link rel="icon" href="/images/favicon.ico" type="image/x-icon">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <meta charset="utf-8">
      <title>MoBike, Share your routes!</title>
      <meta name="generator" content="Bootply" />
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/styles.css" rel="stylesheet">
      <style type="text/css">
         .hide { display: none;}
         .show { display: block;}
      </style>
   </head>
   <body>
      <div class="navbar navbar-custom navbar-fixed-top">
         <div class="navbar-header"><a class="navbar-brand" href="#">Mobike</a>
         </div>
      </div>
      <div class="container-fluid" id="main">
         <div class="row">
            <div class="col-xs-8" id="left">
               <div id="imgcontainer"></div>
               <hr>
               <h2>
                  <img src="images/logo.png" width="600" height="220">
                  <br>
                  <br>
                  <input type="button" class="myButton" value="Start! Here" onclick="login()" />	<input type="button" class="myButton hide" value="Logout" onclick="logout()" />
               </h2>
               
                  
               
               <hr>
               <div class="panel panel-default">
                  <div class="panel-heading" id="maintitle"><a href="">What is Mobike?</a></div>
               </div>
                  <hr>
                  <hr>
                  <p id="maintext">Mobike is an app to create, share and discover routes for motorcycle enthusiasts!    <br> Record your trip with our mobile app and share it with your friends, browse uploaded itineraries available on the website </p>
               </div>
               <hr>
               <hr>
           
               <p>
                  <a href="https://sites.google.com/a/dis.uniroma1.it/google-technologies-for-cloud-and-web-development/" target="_ext" class="center-block btn btn-primary">Google Workshop for Cloud and Web Development</a>
               </p>
               <hr>
            </div>
         </div>
      
      <script type="text/javascript">
         function logout(){
            	gapi.auth.signOut();
             location.reload();
         }
         
         function login(){
          		var myParams = {
             	'clientid' : '648355147327-l29pdutihnfa25kdmo1ocjankqg4217c.apps.googleusercontent.com',
             	'cookiepolicy' : 'single_host_origin',
             	'callback' : 'loginCallback',
             	'approvalprompt':'force',
            		'scope' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
          	};
          		gapi.auth.signIn(myParams);
         }
         
         function loginCallback(result){
             if(result['status']['signed_in']){
                	var request = gapi.client.plus.people.get({'userId': 'me'});
                	request.execute(function (resp){
                    	var email = '';
                    	if(resp['emails']){
                        	for(i = 0; i < resp['emails'].length; i++){
                            	if(resp['emails'][i]['type'] == 'account'){
                                	email = resp['emails'][i]['value'];
                            	}
                        	}
                    	}
         				var surname = resp['name']['familyName'];
         				var firstname = resp['name']['givenName'];
         				var data = "{ \"name\":\""+firstname+"\", " + "\"surname\":\"" + surname +"\", " + "\"email\":\"" + email +"\"}";
         				            	
         				
         				
         				$.ajax({
         				        type: "POST",
         				        url: "/WAPP/login",
         				        data: data,
         				        contentType: "application/json; charset=utf-8",
         				        dataType: "text",
         				        success: function(data){window.location=data},
         				        failure: function(errMsg) {alert(errMsg);},
         				        error: function(asd, text, wetr){alert(text);}
         				  });
                    	
                	});
            	}
         	}
         
         function onLoadCallback(){
            	//gapi.client.setApiKey('kFPvMH88ifFkbKYnsFsPq5Me ');
            	gapi.client.load('plus', 'v1',function(){});
         }
           
      </script>
      <script type="text/javascript">
         (function() {
          var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
          po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
         })();
      </script>
   </body>
</html>