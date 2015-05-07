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
              <li id="mitineraries"><a href="/WAPP/itineraries"><div id="navItn"></div></a></li>
              <li id="mevents"><a href="/WAPP/events"><div id="navEve"></div></a></li>
              <li id="mandroidapp"><a href="/WAPP/androidapp"><div id="navAnd"></div></a></li>
              <li id="mcontact"><a href="/WAPP/contacts"><div id="navCon"></div></a></li>
              <li class="dropdown" id="muser">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <span class="glyphicon glyphicon-user"></span> <user></user>
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="/WAPP/users/profile"><div id="navPro"></div></a></li>
                  <div class="divider"></div> 
                  <li><a href="javascript:logout()"><div id="navLogout"></div></a></li>
                </ul>
              </li>
            </ul>
          </div>
      </div>
  </nav>