app = app || {};

app.QuestionView = Backbone.View.extend({

  events: {
    'submit .question_form': 'submitQuestion',
  },

  initializeTemplates: function(){
    _.templateSettings = { interpolate: /\{\{(.+?)\}\}/g };
    this.template = _.template( $('#question_template').html() )
  },

  initialize: function(){
    this.initializeTemplates();
  },

  render: function(){},

  submitQuestion: function(e){
    e.preventDefault()
  }

});
