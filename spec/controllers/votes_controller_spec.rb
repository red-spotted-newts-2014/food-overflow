require 'rails_helper'

describe VotesController, type: :controller do
  context "#create" do
    it "should create an upvote" do
      expect{ post :create, vote: { is_upvote?: true }}
      .to change(Vote.count_upvotes).by(1)
    end

    it "should create an downvote" do
      expect{ post :create, vote: { is_upvote?: false }}
      .to change(Vote.count_downvotes).by(1)
    end
  end
end
