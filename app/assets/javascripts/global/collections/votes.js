app = app || {};

app.Votes = Backbone.Collection.extend({
  model: app.Vote,

  upvotes: function(){
    return this.filter(function(vote) {
      return vote.get("is_upvote");
    });
  },

  downvotes: function(){
    return this.reject(function(vote){
      return this.get("is_upvote")
    });
  },

  totalPositive: function(){
    return this.upvotes().length - this.downvotes().length
  },

});