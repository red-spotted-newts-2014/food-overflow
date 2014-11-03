var app = app || {};

var User = Backbone.Model.extend({

  defaults: {
    loggedIn: false
  },

  initialize: function(){
    this.collectUser();
  },

  collectUser: function(){
    self = this;
    $.ajax({
      url :'/users/current',
      type: 'GET'
    })
    .success(function(data){
      self.set("loggedIn" , data["name"]);
    })
    .fail(function(){
      console.log("test")
      self.set("loggedIn", false);
    })
  },

  collectVotes: function(){
    self = this;
    $.ajax({
      url: '/users/current/votes',
      type: 'GET'
    })
    .success(function(data) {
      self.set("voteData", data);
    })
    .fail(function() {
      self.set("voteData", null);
    })
  }

})

app.currentUser = new User