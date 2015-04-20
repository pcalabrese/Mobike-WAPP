<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoBike - Contact</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link id="theme-style" rel="stylesheet" href="/WAPP/css/stiledev.css">
	<link href="/WAPP/css/material.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css"	rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
	<link href="/WAPP/css/jquery.nouislider.pips.min.css" rel="stylesheet">
  	<link href="/WAPP/css/jquery.nouislider.min.css" rel="stylesheet">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
	<script src="/WAPP/js/jquery.nouislider.all.js"></script>
	<script src="/WAPP/js/contact.js"></script>
	<script src="/WAPP/js/logout.js"></script>
  	<script> nickname = "${it.get('user').get('nickname')}";</script>
</head>

<body>
  <navbar></navbar>
    
  <div class="corpo">
    <section id="contact" class="contact section ">
        <div class="container">
            <div class="contact-inner">
                <h2 class="text-center" style="color:rgba(0,0,0,0.84);">Contact</h2>
                <h3  class="text-center">The MoBike Team! <br/>
                Feel free to get in touch if you have any questions or suggestions.</h3>
                <br>
                
                <div class="well">
                	<form>
                		<fieldset>
                	<legend>Contact Us</legend>
					<div class="form-group">
						<label for="ctname" class="col-lg-2 control-label">Name</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="ctname" placeholder="Your Name..">
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<label for="ctsurname" class="col-lg-2 control-label">Surname</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="ctsurname" placeholder="Your Surname...">
						</div>
					</div>
					<br>
					<br>
					
					<div class="form-group">
						<label for="ctemail" class="col-lg-2 control-label">Email</label>
						<div class="col-lg-10">
							<input type="email" class="form-control floating-label" id="ctemail" placeholder="Your E-Mail Address...">
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<label for="ctobject" class="col-lg-2 control-label">Object</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="ctobject" placeholder="Choose an object...">
						</div>
					</div>
					<br>
					<br>					
					<div class="form-group">
						<label for="ctmessage" class="col-lg-2 control-label">Message</label>
						<div class="col-lg-10">
							<textarea class="form-control" rows="3" id="ctmessage"></textarea>
							<br>
							<div class="togglebutton">
                    		<label>
                        		<input type="checkbox" checked=""> Bug Report?
                    		</label>
                	</div>
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<button type = "reset" class="btn btn-default">Cancel</button>
							<button type="submit" class="btn btn-primary">Send Message</button>
						</div>
					</div>
					
					
                </fieldset>
                </form>
                </div>
                
            </div><!--//contact-inner-->
        </div><!--//container-->
    </section><!--//contact--> 
  </div>
  
  <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="container text-center">
            <small class="copyright">Developed for the<a href="https://sites.google.com/a/dis.uniroma1.it/google-technologies-for-cloud-and-web-development/" target="_blank"> Google Technologies for Cloud and Web Developement </a> Workshop</small>
        </div><!--//container-->
    </footer><!--//footer-->
    
  
  
</body>
</html>
