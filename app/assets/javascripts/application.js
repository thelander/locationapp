//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-rating-input
//= require_tree .

var ready;

ready = function() {
  $("#average_rating").rating();
};

$(document).ready(ready);
$(document).on("page:load", ready);
