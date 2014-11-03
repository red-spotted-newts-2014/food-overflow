var app = app || {};

app.Question = Backbone.Model.extend({

  url: '/questions',

  defaults: {
    title: "",
    content: ""
  },

  getTitle: function(){
    return this.title
  },

  getContent: function(){
    return this.content
  },

});