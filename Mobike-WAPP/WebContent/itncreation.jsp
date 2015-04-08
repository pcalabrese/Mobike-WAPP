<html>
  <head>
    <title>MoBike - Create Itinerary</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link id="theme-style" rel="stylesheet" href="../css/stiledev.css">
  <!-- Include material.css to include the theme and ripples.css to style the ripple effect -->
  <link href="../css/material.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/ripples.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Roboto:500,400' rel='stylesheet' type='text/css'>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/ripples.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/js/material.min.js"></script>
  <script>
    $(document).ready(function() {
    // This command is used to initialize some elements and make them work properly
    $.material.init();
    });
  </script>
    <script src="http://open.mapquestapi.com/sdk/js/v7.2.s/mqa.toolkit.js?key=Fmjtd%7Cluu82lut2g%2C2l%3Do5-9480da"></script>
 
    <script type="text/javascript">
        function starta(from, to){
            MQA.withModule('directions','largezoom', 'viewoptions', 'geolocationcontrol', 'mousewheel', function() {
                /*Create an object for options*/
                var options={
                  elt:document.getElementById('map'),        /*ID of element on the page where you want the map added*/
                  latLng:{lat:42, lng:12},
                  zoom:4,                                   /*initial zoom level of map*/
                  mtype:'map'                                /*map type (map)*/
                };
 
                /*Construct an instance of MQA.TileMap with the options object*/
                window.map = new MQA.TileMap(options);
               
 
                // enable zooming with your mouse
                map.enableMouseWheelZoom();
               
                map.addRoute([
                  from,
                  to],
             
                  /*Add options.*/
                  { ribbonOptions: { draggable: true }}
                );
               
                map.setDraggable(true);
            });
        }
 
        function getDirections(from, to){
            MQA.withModule('directions', function() {
                /*Create an object for options*/
                var options={
                    elt:document.getElementById('map'),        /*ID of element on the page where you want the map added*/
                    latLng:{lat:42, lng:12},
                    zoom:4,                               /*initial zoom level of map*/
                    mtype:'map'                                /*map type (map)*/
                };
               
                window.map.addRoute([
                  from,
                  to],
             
                  /*Add options.*/
                  { ribbonOptions: { draggable: true }},
             
                  /*Add the callback function to the route call.*/
                  createGPX
                );
            });
        }
       
       
        function createGPX(data) {
            var gpxString='';
                gpxString += "<? xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"no\"?>\n" +
                        "<gpx\n" +
                        "  xmlns=\"http://www.topografix.com/GPX/1/0\"\n" +
                        "  version=\"1.0\" creator=\"MoBike Web App\"\n" +
                        "  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n" +
                        "  xsi:schemaLocation=\"http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd\">";
                gpxString += "<metadata>\n"+
                        "<author>\n"+
                        "<email " +
                        "id=\""+'mobiketeam'+"\""+
                        " domain=\""+'gmail.com'+"\"/>\n"+
                        "</author>\n"+
                        "</metadata>\n";
                       
            if (data.route){
                var shapepoints = data.route.shape.shapePoints,
                    legs = data.route.legs,
                    i=0,
                    j=0,
                    k=0,
                    l=shapepoints.length,
                    lat,
                    lng;
               
                lat=''+shapepoints[k+0].toFixed(6);
                lng=''+shapepoints[k+1].toFixed(6);
                gpxString += "<wpt lat=\"" + lat + "\" lon=\"" + lng + "\"></wpt\n";
               
                for (i=0; i < legs.length; i++) {
                    for (j = 0; j < legs[i].maneuvers.length; j++) {
                        maneuver = legs[i].maneuvers[j];
                        k = maneuver.index;
                        if( k+11<l){
                            lat=''+shapepoints[k+10].toFixed(6);
                            lng=''+shapepoints[k+11].toFixed(6);
                           
                        }
                        else{
                            lat=''+shapepoints[k].toFixed(6);
                            lng=''+shapepoints[k+1].toFixed(6);
                        }
                        j+=1;
                        gpxString += "<wpt lat=\"" + lat + "\" lon=\"" + lng + "\"></wpt>\n";
                    }
                }
               
                lat=shapepoints[l-2].toFixed(6);
                lng=shapepoints[l-1].toFixed(6);
                gpxString += "<wpt lat=\"" + lat + "\" lon=\"" + lng + "\"></wpt>\n<trk>\n<trkseg>\n";
               
               
                for (i=0;i<shapepoints.length-1;i++) {
                    lat=''+shapepoints[i].toFixed(6);
                    lng=''+shapepoints[i+1].toFixed(6);
                    gpxString += "<trkpt lat=\"" + lat + "\" lon=\"" + lng + "\"></trkpt>\n";
                    i+=1;
                }
               
                gpxString += "</trkseg>\n</trk>\n</gpx>";
                var gpxString1 = "<p>"+gpxString +"</p>";
                document.getElementById('gpx').innerHTML = gpxString1;
               
                var dis = data.route.distance * 1000;
                var time= data.route.time;
                $("#distance").val(dis);
                $("#time").val(time);
            }
        }
       
       
        function getGPX(){
            var gpx =$( "gpx" ).html();
           
            gpx= "<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"no\"?>\n" +
                        "<gpx\n" +
                        "  xmlns=\"http://www.topografix.com/GPX/1/0\"\n" +
                        "  version=\"1.0\" creator=\"MoBike Web App\"\n" +
                        "  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n" +
                        "  xsi:schemaLocation=\"http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd\">"+
                        gpx+"</gpx>";
           
            return gpx;
        }
  </script>
  <script type="text/javascript">
        function savePressed(){
            if(document.getElementById('fromtext').value==''){
                var s="<p class='text-danger'>Insert a starting point for your Itinerary!</p>";
                document.getElementById('mod-body').innerHTML = s;
            }
            else if(document.getElementById('totext').value==''){
                var s="<p class='text-danger'>Insert a destination for your Itinerary!</p>";
                document.getElementById('mod-body').innerHTML = s;
            }
           
            else if(document.getElementById('nametext').value==''){
                var s="<p class='text-danger'>Insert a name for your Itinerary!</p>";
                document.getElementById('mod-body').innerHTML = s;
            }
            else {
                var s='<p>Do you really want to save the Itinerary "'+
                        document.getElementById('nametext').value+'"?</p>';
                document.getElementById('mod-body').innerHTML = s;
                var s='<button type="button" class="btn btn-primary shadow-level2" id="ciao" onclick="updateItinerary();">Save</button>';
                document.getElementById('save-mod-btn').innerHTML = s;
            }
           
           
        }    
    </script>
    <script type="text/javascript">
        function updateItinerary() {
            var gpx=getGPX();console.log(gpx);
            var dist =$( "#distance" ).val();
            var time =$( "#time" ).val();
            var json = {
                        name:  $('#nametext').val(),
                        description: $('#textArea').val(),
                        startlocation: $('#fromtext').val(),
                        endlocation: $('#totext').val(),
                        gpxString:gpx,
                        duration: time,
                        length: dist,
                        type: $('#select').val()
           
            }
            $.ajax({
                type: "POST",
                processData: false,
                contentType: 'application/json',
                url: "http://localhost:8080/Mobike-WAPP/itineraries/insertnew",
                data:  JSON.stringify(json),
                dataType: "json",
                success: function(msg)
                {
                console.log("ok");
                }
               
            });
        }
    </script>
 </head>
 
<body onload="starta('', '');">
 
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="home.html"><img src="../img/logo.png" class="img-responsive" alt="MoBike"></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="../itineraries.html">Itineraries</a></li>
                <li><a href="../events">Events</a></li>
                <li><a href="../androidapp">Android App</a></li>
                <li><a href="../contact">Contact</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <span class="glyphicon glyphicon-user"></span> ${it.get('user').get('nickname')}
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="#">Profile</a></li>
                      <li><a href="#">My Itineraries</a></li>
                      <li><a href="#">My Events</a></li>
                      <div class="divider"></div>
                      <li><a href="logout()">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
 
  <a class="btn shadow-level4 btn-primary  btn-fab mdi-content-save"
          style="position: fixed;z-index:9999;
    bottom: 5%;
    right: 5%;"  data-toggle="modal" data-target="#saveModal"
    onclick="savePressed();">
   </a>
   
   
       
    <div class="container-fluid"><div class="img-responsive" id='map' style='width:2000px; height:720px;'></div></div>
       
        <div class="container" style="position:absolute;top:10%;left:3%;
                        background-color:rgba(253,253,253,0.85);
                        width:20%;">
            <form role="form">
                <legend>Create Itinerary</legend>
 
                <div class="form-group">
                    <input class="form-control floating-label" id="fromtext"
                    type="text" placeholder="From" data-hint="Specify a location, an address or geographic coordinates">
                </div></br>
                <div class="form-group">
                    <input class="form-control floating-label" id="totext"
                    type="text" placeholder="To" data-hint="Specify a location, an address or geographic coordinates">
                </div></br>
 
                <div class="form-group">
                  <a class="btn btn-primary shadow-level2" onclick="getDirections(document.getElementById('fromtext').value, document.getElementById('totext').value);">Get Itinerary</a>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-control floating-label" id="nametext"
                    type="text" placeholder="Itinerary Name" data-hint="Give a significant name to this Itinerary">
                </div></br>
 
                <div class="form-group">
                    <label for="Itinerary Type" class="col-lg-2 control-label">Type</label>
                    <div class="col-lg-10">
                        <select class="form-control" id="select">
                            <option>Montuoso</option>
                            <option>Collinare</option>
                            <option>Pianeggiante</option>
                            <option>Costiero</option>
                        </select>
                       
                    </div>
                </div><br>
 
                <div class="form-group">
                    <label for="textArea" class="col-lg-2 control-label">Description</label>
                    <div class="col-lg-10">
                        <textarea class="form-control" rows="3" id="textArea"></textarea>
                        <span class="help-block"></span>
                    </div>
                </div>
            </form>
        </div><!--container-->  
<div id="gpx" style="display:none;"></div>
<!--<div id="distance" style="display:none;"></div>-->
 
<input id="distance" type="text"style="display:none;">
<input id="time" type="text"style="display:none;"> <a data-toggle="modal" data-target="#reviewModal">premi
   </a>
 
<div id="saveModal" class="modal fade">
 <div class="modal-dialog">
  <div class="modal-content">
   <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">Save Itinerary</h4>
   </div>
   <div id="mod-body" class="modal-body">
   </div>
   <div id="mod-footer" class="modal-footer">
    <button type="button" class="btn btn-default shadow-level2" data-dismiss="modal">Close</button>
    <a id="save-mod-btn"></a>
   </div>
  </div>
 </div>
</div>
 
           
 
</body>
</html>