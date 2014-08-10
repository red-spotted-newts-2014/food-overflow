require 'rails_helper'

describe VotesController, type: :controller do
  it "should create an upvote" do
    let!(:vote1) { question.votes.create!(is_upvote?: true) }

  end

  it "should create an downvote" do
    let!(:vote2) { question.votes.create!(is_upvote?: false) }

  end
end
