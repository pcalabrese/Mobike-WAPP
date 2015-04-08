(function() {
  var app = angular.module('landing', []);

  app.directive("landingNavbar", function(){
	  return {
		restrict:"E", 
		templateUrl:"./pages/navbar-landing.html", 
	  };
  });
})();
