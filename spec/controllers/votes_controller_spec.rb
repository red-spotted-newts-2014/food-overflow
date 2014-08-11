require 'rails_helper'

describe VotesController, type: :controller do
  let!(:question) { FactoryGirl.create :question }
  context "#create" do
    it "should create an upvote" do
      expect{ post :create, vote: { is_upvote: true }}
      .to change{ Vote.count_upvotes }.by(1)
    end

    it "should create a downvote" do
      expect{ post :create, question_id: question.id,  vote: { is_upvote: false }
    }.to change(question.votes, :count).by(1)
    end
  end
end
