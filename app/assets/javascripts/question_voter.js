var app = app || {};
var ENTER_KEY = 13;

$(document).ready(function() {
  app.currentUser.set("currentQuestion", new app.Question());
});