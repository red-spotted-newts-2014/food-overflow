app = app || {};

app.User = Backbone.Model.extend({

  defaults: {
    user_id: null,
    voteData: null,
    questionOwner: null
  },

  initialize: function(){

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