// $('#element').load('sompage.html', function(){ /* callback */ });
// $('#legislators').load('/feed', console.log('Hi there'));

// function sayHi() {
//   console.log('Hi there');
// }


$(".feed.show").ready(function(){
  getLegislators()
})

// $('#legislators').ready(function(){
//   getLegislators()
// })

function getLegislators() {
  getLocation()
}

function getLocation() {
  var output = document.getElementById("out");

  // if (!navigator.geolocation){
  //   output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
  //   return;
  // }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    output.innerHTML = '<p>Latitude is ' + latitude + '° <br>Longitude is ' + longitude + '°</p>';

    // var img = new Image();
    // img.src = "https://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

    // output.appendChild(img);
  };

  function error() {
    output.innerHTML = "Unable to retrieve your location";
  };

  output.innerHTML = "<p>Locating…</p>";

  navigator.geolocation.getCurrentPosition(success, error);
}