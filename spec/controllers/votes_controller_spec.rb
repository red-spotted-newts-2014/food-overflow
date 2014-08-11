require 'rails_helper'

describe VotesController, type: :controller do
  let!(:question) { FactoryGirl.create :question }
  context "#create" do
    it "should create an upvote" do
      expect{
        question.votes << Vote.create(is_upvote: true)
      }.to change(question.votes, :count).by(1)
    end

    it "should create a downvote" do
      expect{ 
        question.votes << Vote.create(is_upvote: false)
    }.to change(question.votes, :count).by(1)
    end
  end
end
