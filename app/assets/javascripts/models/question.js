var app = app || {};

app.Question = Backbone.Model.extend({

  defaults: {
    title: "",
    content: "",
    user_id: 1
  }
});