app = app || {};

app.VoteView = Backbone.View.extend({

  events: {
  },

  initializeTemplates: function(){
    _.templateSettings = { interpolate: /\{\{(.+?)\}\}/g };
    this.voterTemplate = _.template( $('#vote-template').html() )
  },

  initialize: function(){
    this.initializeTemplates();
  },

});