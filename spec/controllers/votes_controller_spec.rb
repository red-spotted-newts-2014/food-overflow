require 'rails_helper'

describe VotesController, type: :controller do
  let!(:question) { FactoryGirl.create :question }
  context "#create" do
    it "creates an upvote" do
      expect{
        question.votes << Vote.create(is_upvote: true)
      }.to change(Vote, :count).by(1)
    end

    it "creates a downvote" do
      expect{ 
        question.votes << Vote.create(is_upvote: false)
    }.to change(Vote, :count).by(1)
    end
  end
end
