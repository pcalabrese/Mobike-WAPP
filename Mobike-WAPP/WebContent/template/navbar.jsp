  <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
              </button>
              <a class="navbar-brand" href="/WAPP/home"><img src="/WAPP/img/logo.png" class="img-responsive" alt="MoBike"></a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li id="mitineraries"><a href="/WAPP/itineraries">Itineraries</a></li>
              <li id="mevents"><a href="/WAPP/events">Events</a></li>
              <li id="mandroidapp"><a href="/WAPP/androidapp">Android App</a></li>
              <li id="mcontact"><a href="/WAPP/contacts">Contact</a></li>
              <li class="dropdown" id="muser">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <span class="glyphicon glyphicon-user"></span> <user></user>
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="/WAPP/users/profile">Profile</a></li>
                  <li><a href="#">My Itineraries</a></li>
                  <li><a href="#">My Events</a></li>
                  <div class="divider"></div> 
                  <li><a href="javascript:logout()">Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
      </div>
  </nav>