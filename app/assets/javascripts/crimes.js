var getLocation, handler, storePosition;

$(document).ready(function() {
  console.log("document loaded");
  console.log(navigator);
  getLocation();
  handler = Gmaps.build("Google");

	handler.buildMap({
	  provider: {
	  	// zoom: 12,
	  	center: new google.maps.LatLng(51.510478899999995, -0.127639),
	  	},
	  internal: {
	    id: "map"
	  }
	}, function() {
	  var markers;
	  markers = handler.addMarkers(window.markers);
	  handler.bounds.extendWith(markers);
	  handler.fitMapToBounds();
	});
});

getLocation = function() {
  console.log("getting Location");
  if (navigator.geolocation) {
    navigator.geolocation.watchPosition(storePosition);
  } else {
    alert("You need to enable geolocation for this app to work");
  }
};

storePosition = function(position) {
  console.log("Storing position in form");
  $('#crime_lat').val(position.coords.latitude);
  return $('#crime_lon').val(position.coords.longitude);
};

window["setLevel"] = function(level) {
  return $('#crime_level').val(level);
};

window["setCategory"] = function(categoryId, name) {
  $('#crime_category_id').val(categoryId);
  $('.category-btn').removeClass("disabled");
  $('#category_btn_' + categoryId).addClass("disabled");
  $('#category-name').text(name);
  return $('html, body').animate({
    scrollTop: $('#section-more-info').offset().top
  }, 1000);
};
