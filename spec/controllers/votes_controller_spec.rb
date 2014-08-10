require 'rails_helper'

describe VotesController, type: :controller do

  it "should create an upvote" do
    expect{ post :create, vote: { is_upvote?: true }}
    .to change(Vote.count_upvotes).by(1)
  end

  it "should create an downvote" do
    let!(:vote2) { question.votes.create!(is_upvote?: false) }

  end
end
