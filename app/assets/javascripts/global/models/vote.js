var app = app || {};

app.Vote = Backbone.Model.extend({

  defaults: {
    user_id: null,
    upvote: null,
    vote_type: null,
    vote_for: null
  },

  initialize: function(){

  }
})