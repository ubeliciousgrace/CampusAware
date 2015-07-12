// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require filterrific/filterrific-jquery

$(document).ready(function(){
	var latitude;
	var longitude;


	function getLocation() {
	     navigator.geolocation.getCurrentPosition(showPosition);
	    }
	    getLocation();

	    function showPosition(position) {
	      latitude = position["coords"]["latitude"];
	      longitude = position["coords"]["longitude"];
	      // debugger;
	      $.ajax({
	       type: 'POST',
	       url: '/reports/get_geo',
	       data: {lat: latitude, lng: longitude},
	       success: function(data){
	       	// debugger;
	        // console.log(data);
	        console.log(data['schools'][0]['school_name']);
	        $('#school-name').text(data['schools'][0]['school_name']);
	       }
	    })
	    }

	function initialize() {
		  var mapOptions = {
		    zoom: 10
		  };
		  map = new google.maps.Map(document.getElementById('map-canvas'),
		      mapOptions);

		  google.maps.event.addListener(map, 'click', function(e) {
		    placeMarker(e.latLng, map);
		  });

		  // Try HTML5 geolocation
		  if(navigator.geolocation) {
		    navigator.geolocation.getCurrentPosition(function(position) {
		      var pos = new google.maps.LatLng(position.coords.latitude,
		                                       position.coords.longitude);

		      // var infowindow = new google.maps.InfoWindow({
		      //   map: map,
		      //   position: pos,
		      //   content: 'Location found using HTML5.'
		      // });

		  //   	var marker = new google.maps.Marker({
				//     position: pos,
				//     title:"Hello World!"
				// });

				// // To add the marker to the map, call setMap();
				// marker.setMap(map);

		      map.setCenter(pos);
		    }, function() {
		      handleNoGeolocation(true);
		    });
		  } else {
		    // Browser doesn't support Geolocation
		    handleNoGeolocation(false);
		  }
		}



		function handleNoGeolocation(errorFlag) {
		  if (errorFlag) {
		    var content = 'Error: The Geolocation service failed.';
		  } else {
		    var content = 'Error: Your browser doesn\'t support geolocation.';
		  }

		  var options = {
		    map: map,
		    position: new google.maps.LatLng(60, 105),
		    content: content
		  };

		  var infowindow = new google.maps.InfoWindow(options);
		  map.setCenter(options.position);
		}


		function placeMarker(position, map) {
				  var marker = new google.maps.Marker({
				    position: position,
				    map: map
				  });
				  map.panTo(position);
				}

		google.maps.event.addDomListener(window, 'load', initialize);

});




