app = app || {};

var User = Backbone.Model.extend({

  defaults: {
    voteData: null,
    questionOwner: null
  },

  initialize: function(){
    this.collectUser(this);
    this.collectVotes(this);
  },

  collectUser: function(self){
    $.ajax({
      url :'/users/current',
      type: 'GET'
    })
    .success(function(data){
      self.set("user_id" , data);
    })
    .fail(function(){
      self.set("user_id", null);
    })
  },

  collectVotes: function(self){
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