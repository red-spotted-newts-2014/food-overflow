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

  upVote: function(){

  },

  downVote: function(){

  },

  nullVote: function(){

  }
})