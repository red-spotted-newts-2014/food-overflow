var app = app || {};

app.QuestionView = Backbone.View.extend({

  events: {
    'submit .question_form': 'submitQuestion',
    'click .up.loggedin': 'voteUp',
    'click .down.loggedin': 'voteDown',
    'click .voter:not(.loggedin)': 'alertLogin'
  },


  initializeTemplates: function(){
    _.templateSettings = { interpolate: /\{\{(.+?)\}\}/g };
    this.template =  this.template || _.template( $('#question_template').html() );
  },

  initialize: function(){
    this.$title = $(".new_question");
    this.$content = $(".new_content");
    this.$form = $(".question_form");
    this.$show = $(".formulated_question");
    this.$voteBox = $(".vote_box");
    this.modelId = this.queryId();
    this.model = new app.Question({"id": this.modelId });
    this.activeVote = new app.Vote({'votable_type': 'Question', 'votable_id': this.modelId });

    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model, 'sync', this.exitForm);
    this.listenTo(this.activeVote, 'sync', this.visualizeVote)
  },

  render: function(){
    this.$show.html(this.template(this.model.attributes));
  },

  exitForm: function(){
    this.$title = $(".new_question").val("");
    this.$content = $(".new_content").val("");
    this.$form.hide();
  },

  submitQuestion: function(e){
    e.preventDefault()
    this.initializeTemplates();
    this.model.save({title: this.$title.val(), content: this.$content.val()})
  },

  queryId: function(){
    return this.$el.data('id')
  },

  voteUp: function(){
    this.activeVote.upVote()
  },

  voteDown: function(){
    this.activeVote.downVote()
  },

  alertLogin: function() {
    $('.notice').css('display', 'inline-block').fadeOut(2000);
  },

  visualizeVote: function(){
    this.$voteBox.removeClass('unvoted likes dislikes')
    this.$voteBox.find(".voter").removeClass('selected')
    var vote = this.activeVote.get('is_upvote')
    if (vote === null) {
      this.$voteBox.addClass('unvoted')
    } else if (vote === true) {
      this.$voteBox.addClass('likes')
      this.$voteBox.find(".up").addClass('selected')
    } else {
      this.$voteBox.addClass('dislikes')
      this.$voteBox.find(".down").addClass('selected')
    }
  },


});
