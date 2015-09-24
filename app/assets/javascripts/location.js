$(".feed.show").ready(function(){
  getLegislatorsByLocation()
})

function getLegislatorsByLocation() {
  function successful(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    $.ajax({
         type: "GET",
          url: "http://congress.api.sunlightfoundation.com/legislators/locate?latitude="
               + latitude
               + "&longitude="
               + longitude
               + "&apikey=e12961d962b64b66b4ce180286f0e8a2",
      success: function(legislators) {
        $.each(legislators.results, function(index, legislator){
          renderLegislator(legislator)
        })
      }
    })
  };

  navigator.geolocation.getCurrentPosition(successful);
}

function renderLegislator(legislator) {
  $("#search-area").before(
    "<article class='legislator senator'><h3 class='name'>"
    + legislator.title
    + " "
    + legislator.first_name
    + " "
    + legislator.last_name
    + "</h3><br><a href='#'>See "
    + legislator.title
    + " "
    + legislator.first_name
    + " "
    + legislator.last_name
    + "'s Recent Tweets...</a></article>"
  );
}