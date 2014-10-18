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
    this.$title = $(".new_question");
    this.$content = $(".new_content");
    this.$form = $(".question_form");
    this.$show = $(".formulated_question")
    this.model = new app.Question();
  },

  render: function(){},

  submitQuestion: function(e){
    e.preventDefault()
    this.model.save({title: this.$title.val(), content: this.$content.val()})
    console.log('geez')
  }

});
