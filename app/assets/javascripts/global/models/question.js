var app = app || {};

app.Question = Backbone.Model.extend({

  defaults: {
    title: "",
    content: "",
    user_id: 1
  },

  getTitle: function(){
    return this.title
  },

  getContent: function(){
    return this.content
  },

});