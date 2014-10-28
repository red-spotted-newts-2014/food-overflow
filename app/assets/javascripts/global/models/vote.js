var app = app || {};

app.Vote = Backbone.Model.extend({

  defaults: {
    user_id: null,
    is_upvote: null,
    vote_type: null,
    vote_for: null
  },

  initialize: function(){

  },

  upVote: function(specs){
    var self = this;
    var userVote = {
      "user_id": specs.user || null,
      "votable_type": specs.ownerType || null,
      "votable_id": specs.ownerId || null,
      "is_upvote": true
    };
    $.ajax({
      url: '/votes',
      type: 'POST',
      data: {vote: userVote}
    })
    .success(function(data) {
      this.set(data)
    })
    .fail(function() {
      console.log("error");
    })
  },

  downVote: function(){
     var self = this;
    $.ajax({
      url: '/votes',
      type: 'POST'
    })
    .success(function(data) {
      this.set(data)
    })
    .fail(function() {
      console.log("error");
    })

  },

  nullVote: function(){

  }
})