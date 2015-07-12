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


$(document).ready(function(){
	
	var latitude;
	var longitude;
	var school_name; 
	var reports; 
	var reportsList = []; 
	var markersList = []; 


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
        console.log(data); 
        // console.log(data['schools'][0]['school_name']); 
        $('#school-name').text(data['schools'][0]['school_name']); 

        school_name = data['schools'][0]['school_name']; 
        reports = data['schools'][0]['reports']; 
        
        // debugger; 
        console.log(reports); 
        initialize(reports);  
       	// $('#school-name').text(school_name); 


       	}
	})
	}

	function initialize(reports) {
		  var mapOptions = {
		    zoom: 12
		  };
		  map = new google.maps.Map(document.getElementById('map-canvas'),
		      mapOptions);

		  google.maps.event.addListener(map, 'click', function(e) {
		    placeMarker(e.latLng, map);
		  });
		var reports_length = reports.length; 

		for (var i=0; i < reports.length; i++) { 
			var thisReport = reports[i]; 
			reportsList.push(thisReport); 

			var thisLatlng = new google.maps.LatLng(thisReport['report_lat'],thisReport['report_long']);
			
			var contentString = '<h2>' + thisReport['report_title'] + '</h2>' + '</p>' + '<p>' + thisReport['report_description'] + '</p>'; 
			
			//'<p>Type: ' + thisReport['type'][0]['type_title']
			// console.log(thisReport['type'][0]['type_title']);
			var infowindow = new google.maps.InfoWindow({
		       
		        content: contentString
		    });

			var marker = new google.maps.Marker({

				position: thisLatlng,

				title:"Hello World!"
				
			});

			markersList.push(marker); 

			 google.maps.event.addListener(marker, 'click', function() {
			    infowindow.open(map,marker);
			  });

			// To add the marker to the map, call setMap();
			marker.setMap(map);

			// alert(reports[i]); // testing purposes
		}

		document.getElementById('verbal').onclick=function() {
			filter_by_type('verbal'); 
		};

		
		function filter_by_type(type) {
			deleteMarkers(); 
			if (type == 'verbal') {
				for (var i=0; i < reportsList.length; i++) {
					var thisReport = reportsList[i]; 
					var thisReportType = thisReport['type']; 
					if(thisReportType=="Verbal") {

					var thisLatlng = new google.maps.LatLng(thisReport['report_lat'],thisReport['report_long']);
					
					var contentString = '<h2>' + thisReport['report_title'] + '</h2>' + '<p>Type: ' + thisReport['type'][0]['type_title'] + '</p>' + '<p>' + thisReport['report_description'] + '</p>'; 

					var infowindow = new google.maps.InfoWindow({
				       
				        content: contentString
				    });

					var marker = new google.maps.Marker({

						position: thisLatlng,

						title:"Hello World!"
						
					});

					reportsList.push(marker); 

					 google.maps.event.addListener(marker, 'click', function() {
					    infowindow.open(map,marker);
					  });

					// To add the marker to the map, call setMap();
					marker.setMap(map);
								
							}
						}

					}
				}

		  // Try HTML5 geolocation
		  if(navigator.geolocation) {
		    navigator.geolocation.getCurrentPosition(function(position) {
		      var pos = new google.maps.LatLng(position.coords.latitude,
		                                       position.coords.longitude);

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
		// Sets the map on all markers in the array.
		function clearMarkers(map) {
		  for (var i = 0; i < markersList.length; i++) {
		    markersList[i].setMap(null);
		  }
		}

		// Deletes all markers in the array by removing references to them.
		function deleteMarkers() {
		  clearMarkers();
		}

		google.maps.event.addDomListener(window, 'load', initialize);

});
