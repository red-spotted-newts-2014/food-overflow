app = app || {};

var User = Backbone.Model.extend({

  defaults: {
    user_id: null,
    voteData: null,
    questionOwner: null
  },

  initialize: function(){

  },

  collectUser: function(){
    $.ajax({
      url :'/users/current',
      type: 'GET'
    })
    .success(function(data){
      this.user_id = JSON.parse(data);
    })
    .fail(function(){
      this.user_id = null;
    })
  },

  collectVotes: function(){
    $.ajax({
      url: '/users/current/votes',
      type: 'GET'
    })
    .success(function(data) {
      this.voteData = JSON.parse(data);
    })
    .fail(function() {
      this.voteData = null;
    })
  }

})

app.currentUser = new User