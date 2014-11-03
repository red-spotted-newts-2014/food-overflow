var app = app || {};
var ENTER_KEY = 13;

$(document).ready(function() {
  app.currentQuestion = new app.QuestionView({el: '#question_builder'});
});