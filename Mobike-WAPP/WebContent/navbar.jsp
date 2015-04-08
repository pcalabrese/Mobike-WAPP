<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
              </button>
              <a class="navbar-brand" href="#"><img src="./img/logo.png" class="img-responsive" alt="MoBike"></a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="itineraries">Itineraries</a></li>
              <li><a href="events">Events</a></li>
              <li><a href="androidapp">Android App</a></li>
              <li><a href="contact">Contact</a></li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <span class="glyphicon glyphicon-user"></span> ${it.get('user').get('nickname')}
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Profile</a></li>
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