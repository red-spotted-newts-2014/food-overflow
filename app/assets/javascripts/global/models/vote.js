var app = app || {};

app.Vote = Backbone.Model.extend({

  defaults: {
    is_upvote: null,
    votable_type: null,
    votable_id: null
  },

  urlRoot: '/votes',

  initialize: function(){

  },

  upVote: function(){
    this.save('is_upvote', true)
  },

  downVote: function(){
    this.save('is_upvote', false)
  }
})